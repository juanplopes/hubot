# Some interaction with basecamp
#
# set the HUBOT_BASECAMP_KEY
# set the HUBOT_BASECAMP_URL -> this is your company Name  in basecamp url company_name.basecamphq.com
# gives the right permissions to see the content in basecamp.

# developed by http://github.com/fellix - Crafters Software Studio

require('date-utils')

module.exports = (robot) ->
	robot.hear /^basecamp calendar( (.*))?$/i, (msg) ->
    project_name = msg.match[2]
    basecamp_request msg, 'projects.json', (projects) ->
      for project in projects.records
        if project_name 
          if project.name == project_name
            print_calendar msg, project
            return
        else
          print_calendar msg, project
          
print_calendar = (msg, project) ->
  basecamp_request msg, "projects/#{project.id}/milestones.json", (entries) ->
    if entries.count <= 0
      msg.send "No milestone found in this project #{project.name}"
      return
    else
      msg.send "Showing milestones for #{project.name} Project"
    for milestone in entries.records
      unless milestone.completedOn
        responsability = "None"
        responsability = milestone.responsibleParty.name if milestone.responsibleParty
        msg.send "#{milestone.author.name} created #{milestone.title}, Responsible: #{responsability}, Status: #{milestone.status}, Deadline: #{milestone.deadline}, Completed at: #{milestone.completedOn}"
      
      
          
          
basecamp_request = (msg, url, handler) ->
  basecamp_key = process.env.HUBOT_BASECAMP_KEY
  auth = new Buffer("#{basecamp_key}:X").toString('base64')
  basecamp_url = "http://#{process.env.HUBOT_BASECAMP_URL}.basecamphq.com"
  msg.http("#{basecamp_url}/#{url}")
    .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "Basecamp says: #{err}"
          return
        content = JSON.parse(body)
        handler content
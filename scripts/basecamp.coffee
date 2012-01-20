# Some interaction with basecamp
#
# set the HUBOT_BASECAMP_KEY
# set the HUBOT_BASECAMP_URL -> this is your company Name  in basecamp url company_name.basecamphq.com
# gives the right permissions to see the content in basecamp.

# developed by http://github.com/fellix - Crafters Software Studio

module.exports = (robot) ->
	robot.hear /^basecamp calendar( (.*))?$/i, (msg) ->
    show_calendar msg
  robot.hear /^basecamp todos( (.*))?$/i, (msg) ->
    show_todos msg

show_calendar = (msg) ->
  project_name = msg.match[2]
  using_projects msg, project_name, print_calendar  
          
print_calendar = (msg, project, searching) ->
  basecamp_request msg, "projects/#{project.id}/milestones.json", (entries) ->
    if entries.count <= 0
      msg.send "No milestone found in this project #{project.name}" if searching
      return
    result = ""
    for milestone in entries.records
      unless milestone.completedOn
        responsability = "None"
        responsability = milestone.responsibleParty.name if milestone.responsibleParty
        result += "[#{project.name}] #{milestone.title} -> #{milestone.status}: #{milestone.deadline}, Responsible: #{responsability}\n"
    msg.send result

show_todos = (msg) ->
  project_name = msg.match[2]
  using_projects msg, project_name, print_todos
  
print_todos = (msg, project, searching) ->
  basecamp_request msg, "projects/#{project.id}/todo_lists.json", (todo_lists) ->
    if todo_lists.count <= 0
      msg.send "No to-do found in this project #{project.name}" if searching
      return
    else
      for todo_list in todo_lists.records
        if !todo_list.completed && !todo_list.todoItemIds.empty?
          basecamp_request_with_params msg, "todo_lists/#{todo_list.id}/todo_items.json", {listName: todo_list.name}, (todo_items, params) ->
            listName = params['listName']
            result = ""
            for todo_item in todo_items.records
              responsability = "None"
              responsability = todo_item.responsibleParty.name if todo_item.responsibleParty
              result += "[#{listName}] #{todo_item.id} - #{todo_item.content} -> Responsible: #{responsability}\n" unless todo_item.completed
            result += "\n"
            msg.send result
  

using_projects = (msg, project_name, handler) ->
  basecamp_request msg, 'projects.json', (projects) ->
    for project in projects.records
      if project_name
        if project.name == project_name
          handler msg, project, true
          return
      else
        handler msg, project, false

basecamp_request = (msg, url, handler) ->
  basecamp_request_with_params msg, url, {}, handler
            
basecamp_request_with_params = (msg, url, params, handler) ->
  basecamp_key = "#{process.env.HUBOT_BASECAMP_KEY}"
  auth = new Buffer("#{basecamp_key}:X").toString('base64')
  basecamp_url = "https://#{process.env.HUBOT_BASECAMP_URL}.basecamphq.com"
  msg.http("#{basecamp_url}/#{url}")
    .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "Basecamp says: #{err}"
          return
        content = JSON.parse(body)
        handler content, params

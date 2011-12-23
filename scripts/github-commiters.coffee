# Show the commiters from a repo
#
# the HUBOT_BOT_GITHUB_USER should map to the bot github username
# the HUBOT_BOT_GITHUB_PASS should map to the bot github password

# developed by http://github.com/fellix - Crafters Software Studio

module.exports = (robot) ->
	robot.hear /repo commiters (.*)/i, (msg) ->
	    read_contributors msg, (commits) ->
			    for commit in commits
				    msg.send "#{commit.login} -> #{commit.contributions}"
	robot.hear /repo top-commiter (.*)/i, (msg) ->
	    read_contributors msg, (commits) ->
          commit = commits.first
          msg.send "#{commit.login} -> #{commit.contributions}"
	
	
read_contributors = (msg, response_handler) ->
    repo = msg.match[1].toLowerCase()
    repo = "#{process.env.HUBOT_GITHUB_USER}/#{repo}" unless repo.indexOf("/") > -1
    bot_github_user = process.env.HUBOT_BOT_GITHUB_USER
    bot_github_pass = process.env.HUBOT_BOT_GITHUB_PASS
    auth = new Buffer("#{bot_github_user}:#{bot_github_pass}").toString('base64')
    url = "https://api.github.com/repos/#{repo}/contributors"

    msg.http(url)
      .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "GitHub says: #{err}"
          return
        commits = JSON.parse(body)
        if commits.length == 0
          msg.send "Achievement unlocked: [LIKE A BOSS] no commits found!"
        else
          response_handler commits

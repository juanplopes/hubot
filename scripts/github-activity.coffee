module.exports = (robot) ->
  robot.hear /govsynchro/i, (msg) ->
    repo = msg.match[0].toLowerCase()
    repo = "#{process.env.HUBOT_GITHUB_USER}/#{repo}" unless ~repo.indexOf("/")
    auth = new Buffer("thehubot:da.hub0t").toString('base64')

    msg.http("https://api.github.com/repos/#{repo}/commits")
      .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "GitHub says: #{err}"
          return
        commits = JSON.parse(body)
        if commits.length == 0
            msg.send "Achievement unlocked: commits zero!"
        else
          for commit in commits
            msg.send commit.message
    msg.send auth
    msg.send repo
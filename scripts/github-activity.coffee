require('date-utils')

module.exports = (robot) ->
  robot.hear /repo show (.*)/i, (msg) ->
    repo = msg.match[1].toLowerCase()
    repo = "#{process.env.HUBOT_GITHUB_USER}/#{repo}" unless repo.indexOf("/")
    auth = new Buffer("thehubot:da.rub0t").toString('base64')

    url = "https://api.github.com/repos/#{repo}/commits"
    msg.http(url)
      .headers(Authorization: "Basic #{auth}", Accept: "application/json")
      .get() (err, res, body) ->
        if err
          msg.send "GitHub says: #{err}"
          return
        commits = JSON.parse(body)
        msg.send body
        if commits.length == 0
            msg.send "Achievement unlocked: commits zero!"
        else
          for c in commits
            d = new Date(Date.parse(c.commit.committer.date)).toFormat("DD/MM HH24:MI")
            msg.send "[#{d} -> #{c.commit.committer.name}] #{c.commit.message}" 
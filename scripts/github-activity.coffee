module.exports = (robot) ->
  robot.hear /govsynchro/i, (msg) ->
    repo = msg.match[1].toLowerCase()
    repo = "#{process.env.HUBOT_GITHUB_USER}/#{repo}" unless ~repo.indexOf("/")
    auth = new Buffer("thehubot:da.hub0t").toString('base64')
    msg.send auth
    msg.send repo
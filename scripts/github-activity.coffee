# Show activity from a Github repository.
#
# You need to set the following variables:
#   HUBOT_GITHUB_TOKEN ="<oauth token>"
#   HUBOT_GITHUB_USER ="<user name>"
#
# HUBOT_GITHUB_USER is optional, but if you set it, you can ask `show me hubot`
# instead of `show me github/hubot`.
#
# show me <user/repo> -- Shows activity for that project.

module.exports = (robot) ->
  robot.respond /show govsynchro/i, (msg)->
    oauth_token = process.env.HUBOT_GITHUB_TOKEN
    repo = msg.match[1].toLowerCase()
    repo = "#{process.env.HUBOT_GITHUB_USER}/#{repo}" unless ~repo.indexOf("/")
    auth = new Buffer("thehubot:da.hub0t").toString('base64')

    msg.send "oi"
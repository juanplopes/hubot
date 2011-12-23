module.exports = (robot) ->
  robot.hear /govsynchro/i, (msg) ->
    auth = new Buffer("thehubot:da.hub0t").toString('base64')
    msg.send auth
    msg.send "oi"
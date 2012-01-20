module.exports = (robot) ->
	robot.hear /^o?rly\?$/i, (msg) ->
		msg.send "http://img849.imageshack.us/img849/1027/orlyjn.jpg"
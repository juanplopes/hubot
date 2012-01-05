module.exports = (robot) ->
	robot.hear /r(a|ã|u)b(i|y)\??/i, (msg) ->
		msg.send "http://img252.imageshack.us/img252/4495/rabi.jpg"


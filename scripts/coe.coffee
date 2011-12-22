module.exports = (robot) ->
	robot.hear /.*(cóé|coeh|coe).*/i, (msg) ->
		msg.send "cóe? belê?"
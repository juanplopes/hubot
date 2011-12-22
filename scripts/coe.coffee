module.exports = (robot) ->
	robot.hear /.*(cóé|coeh|coe|cóe|cóe).*/i, (msg) ->
		msg.send "cóé? belê?"
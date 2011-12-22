module.exports = (robot) ->
	robot.hear /.*(cóé|coeh|coe|cóe|cóe).*/i, (msg) ->
		msg.send "barra play yeah"
		msg.send "cóé? belê?"
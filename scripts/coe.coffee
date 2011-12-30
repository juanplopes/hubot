module.exports = (robot) ->
	greetings = [
			"cóé... belê?",
			"sai fora rapá, nem te conheço",
			"isso são horas?",
			"cóé... sai da internet e vai trabalhar rapaz...",
			"que que foi?",
			"que que você quer?"
	]
	robot.hear /^(cóé|coeh|coe|cóe|coé)\??$/i, (msg) ->
		msg.send msg.random greetings

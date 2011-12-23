module.exports = (robot) ->
	robot.hear /(quede|quedê|kede|kedê) (.*)/i, (msg) ->
		actions = [
			"tá cagando", 
			"foi jogar assassin's creed", 
			"dormiu",
			"foi abduzido hein... que triste",
			"já era... se foi...",
			"tá rebootando o windows, tsc tsc",
			"quem?"
		]

		name = msg.match[2]
		name = name.replace("?","")
		action = msg.random actions
		msg.send "#{name.toLowerCase()} #{action}"
module.exports = (robot) ->
	robot.hear /^(quede|quedê|kede|kedê) (.*\?+?)/i, (msg) ->
		actions = [
			"tá cagando", 
			"foi jogar assassin's creed", 
			"dormiu",
			"foi abduzido hein... que triste",
			"já era... se foi...",
			"tá rebootando o windows, tsc tsc",
			"quem?",
			"nunca vi mais gordo...",
			"ta almoçando"
		]

		name = msg.match[2]
		name = name.replace("?","")
		if name.match /vitor/i
			name += "? Did you mean the windows guy?"
		if name.match /hana/i
			name += "? Foi lavar roupa hein... que agonia, que agonia..."
		else
			action = msg.random actions
		msg.send "#{name.toLowerCase()} #{action}"
module.exports = (robot) ->
	robot.hear /(quede|quedê|kede|kedê) (.*)/i, (msg) ->
		name = msg.match[2]
		name = name.replace("?","")
		msg.send "#{name} tá cagando"
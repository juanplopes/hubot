module.exports = (robot) ->
	msgbox = ""
	count = 0
	robot.hear /addmsg (.*)/i, (msg) ->
		count += 1
		msgbox += "#{count}. #{msg.match[1].toLowerCase()}\n"
	robot.hear /readmsg/i, (msg) ->
		msg.send msgbox
	robot.hear /resetmsg/i, (msg) ->
		msgbox = ''
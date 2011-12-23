class MessageBox
	constructor: (@robot) ->
		@robot.brain.data.messagebox = {}

	add: (user, msg) ->
		if @robot.brain.data.messagebox[user] is undefined
			@robot.brain.data.messagebox[user] = []
			
		for message in @robot.brain.data.messagebox[user]
			if message.toLowerCase() is msg.toLowerCase()
				return

		@robot.brain.data.messagebox[user].push msg
		
	removeAll: (user) ->
		delete @robot.brain.data.messagebox[user]
		
	user: (user) ->
		return @robot.brain.data.messagebox[user] or []

module.exports = (robot) ->
	messagebox = new MessageBox robot
	robot.enter (msg) ->
		sendUserMessages msg.message.user.name.toLowerCase(), msg, messagebox
	robot.hear /^addmsg (.*): (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		message = msg.match[2]
		messagebox.add user, message
		msg.send "Message added for #{user}"
	robot.hear /^readmsg (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		sendUserMessages user, msg, messagebox
	robot.hear /^resetmsg (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		messagebox.removeAll user
		msg.send "Reseted messages for #{user}"	
		
sendUserMessages = (user, msg, messagebox) ->
	messages = messagebox.user user
	if messages.length > 0
		msg.send "Messages for #{user}:"
		count = 0
		for message in messages
			count++
			msg.send "#{count}. message"
	else
		msg.send "I dont have messages for #{user}"
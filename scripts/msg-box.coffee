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
		
	removeFor: (user) ->
		delete @robot.brain.data.messagebox[user]
		
	user: (user) ->
		return @robot.brain.data.messagebox[user] or []
		
	users: ->
		return @robot.brain.data.messagebox
		
	removeAll: ->
		delete @robot.brain.data.messagebox = {}

module.exports = (robot) ->
	messagebox = new MessageBox robot
	robot.enter (msg) ->
		sendUserMessages msg.message.user.name.toLowerCase(), msg, messagebox
	robot.hear /^addmsg (.*): (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		
		foundUser = false
		for userInRoom in @robot.users
			msg.send userInRoom.name.toLowerCase()
			if userInRoom.name.toLowerCase() is user
	        	foundUser = true
	
		if foundUser
			message = msg.match[2]
			messagebox.add user, message
			msg.send "Message added for #{user}"
		else
			msg.send "User #{user} doesn\'t exist"
	robot.hear /^readmsg (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		sendUserMessages user, msg, messagebox
	robot.hear /^resetmsg (.*)/i, (msg) ->
		user = msg.match[1].toLowerCase()
		messagebox.removeFor user
		msg.send "Reseted messages for #{user}"
	robot.hear /^resetallmsg$/i, (msg) ->
		messagebox.removeAll
		
sendUserMessages = (user, msg, messagebox) ->
	messages = messagebox.user user
	if messages.length > 0
		msgBody = "Messages for #{user}:\n"
		count = 0
		for message in messages
			count++
			msgBody += "#{count}. message\n"
		msg.send msgBody
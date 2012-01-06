module.exports = (robot) ->
	robot.hear /sou raquer/i, (msg) ->
		msg.send "http://noticias.gospelmais.com.br/files/2011/04/hacker.jpg"
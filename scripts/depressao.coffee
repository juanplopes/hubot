module.exports = (robot) ->
	robot.hear /^(.*) da depressão/i, (msg) ->
		msg.send "http://www.i9artigos.com.br/wp-content/uploads/2011/10/depressao1.jpg"
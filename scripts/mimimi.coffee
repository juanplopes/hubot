module.exports = (robot) ->
	robot.hear /ˆmimimi$/i, (msg) ->
		msg.send "http://videobeta.net/gifs/15963.gif"
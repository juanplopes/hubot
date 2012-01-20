module.exports = (robot) ->
	robot.hear /^mimimi$/i, (msg) ->
		msg.send "http://videobeta.net/gifs/15963.gif"
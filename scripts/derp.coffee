module.exports = (robot) ->
	robot.hear /^derp$/i, (msg) ->
		msg.send "http://www.izismile.com/img/img3/20100908/640/funny_derp_pictures_640_14.jpg"

module.exports = (robot) ->
	robot.hear /(^(é uma cilada)|^(cilada)|^(corre bino)|^(bilada))(.*)$/i, (msg) ->
		images = ["http://img638.imageshack.us/img638/6583/batimapedroebino.jpg",
		"http://img10.imageshack.us/img10/8348/seloeumaciladabino.jpg",
		"http://img844.imageshack.us/img844/6425/emboscada.jpg",
		"http://img841.imageshack.us/img841/3755/eraciladabino.jpg",
		"http://img213.imageshack.us/img213/6097/eumaciladabino4e09d2a30.jpg"]
		
		image = msg.random images
		msg.send image
		
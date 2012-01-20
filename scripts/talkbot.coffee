module.exports = (robot) ->
	robot.respond /(.*)/i, (msg) ->
		msg.http("http://calypso.pandorabots.com/pandora/talk-xml")
			.query(botid: "f34ae0544e345ab8", input: msg.match[1])
			.post() (err, res, body) ->
				jsdom = require('jsdom')
				msg.send jsdom.jsdom(body).getElementsByTagName("that")[0].childNodes[0].nodeValue
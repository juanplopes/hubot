module.exports = (robot) ->
	robot.hear /yuno '([\w\s]*)' '([\w\s]*)'/i, (msg) ->
		top = encodeURI(msg.match[1].toUpperCase()) 
		bottom = encodeURI(msg.match[2].toUpperCase()) 
		msg.send "http://images.memegenerator.net/Instance/Preview?imageID=166088&generatorTypeID=1&panels=&text0=#{top}&text1=#{bottom}&text2=&text3="
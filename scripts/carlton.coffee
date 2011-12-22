carltons = [
  "http://media.tumblr.com/tumblr_lrzrlymUZA1qbliwr.gif"
]

module.exports = (robot) ->
  robot.hear /.*(dance|happy).*/i, (msg) ->
  	msg.send "/play yeah"
    msg.send msg.random carltons
felixes = [
  "oi, e sim eu sou gay",
  "olá, sim eu sou viadinho",
  "Oi, beleza? QUEDE MEU MACHO?"
]

module.exports = (robot) ->
  robot.hear /oi felix/i, (msg) ->
    msg.send msg.random felixes
  robot.gear /tá aê felix\?/i, (msg) ->
  	msg.send "Opa! Sou gay!"
  	msg.send "/play yeah"
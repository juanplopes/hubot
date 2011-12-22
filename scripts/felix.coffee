felixes = [
  "oi, e sim eu sou gay",
  "olá, sim eu sou viadinho",
  "Oi, beleza? QUEDE MEU MACHO?"
]

module.exports = (robot) ->
  robot.hear /oi felix/i, (msg) ->
    msg.send msg.random felixes
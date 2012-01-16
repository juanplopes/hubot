module.exports = (robot) ->
	piadas =[
		"Meu filho, quais são os seus pecados?\n
\t- Padre, eu comunguei há três anos.\n
\t- Sim, meu filho, e quais são seus pecados?\n
\t- Eu comunguei há três anos.\n
\t- Tudo bem, meu filho, eu sei que você comungou há três anos. Isso não é pecado! Conte-me os seus verdadeiros pecados...\n
\t- Padre, vou lhe contar bem explicadinho, que o senhor num tá intendendo:\n
\tEU - COMO - UM - GAY - HÁ - TRÊS - ANOS !"
	]
	robot.respond /conta uma piada\?$/i, (msg) ->
		msg.send msg.random piadas
		
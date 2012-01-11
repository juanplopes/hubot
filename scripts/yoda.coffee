module.exports = (robot) ->
  robot.hear /^yoda/i, (msg) ->
    images = ["http://upload.wikimedia.org/wikipedia/pt/thumb/4/45/Yoda.jpg/200px-Yoda.jpg",
		  "http://images.wikia.com/pt.starwars/images/c/c4/Yoda2.jpg",
		  "http://images.wikia.com/starwars/images/e/e0/Yoda_SWSB.jpg",
		  "http://2.bp.blogspot.com/_iL70zHv_XC8/TK2_lCOuK_I/AAAAAAAAEzA/2l65R-O2mKM/s1600/yoda5.jpg",
		  "http://blogdocko.com.br/wp-content/uploads/2011/02/yoda.jpg",
		  "http://pensandoavida.com/blog/wp-content/uploads/2010/10/master-yoda12.jpg",
		  "http://1.bp.blogspot.com/--8Oa8ifmmNU/TmF9RLf_JEI/AAAAAAAAALg/l2mU7lTCkSk/s1600/yoda.jpg"]
		
		image = msg.random images
		msg.send image
		
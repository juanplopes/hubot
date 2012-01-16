module.exports = (robot) ->
	depressoes = [
		"http://1.bp.blogspot.com/-b0gI4lDe88w/TcPnnj05AKI/AAAAAAAAAG0/GKnbflvwyuk/s320/depression.jpg",
		"http://www.i9artigos.com.br/wp-content/uploads/2011/10/depressao1.jpg",
		"http://fe.blog.images.s3.amazonaws.com/2011/06/Alcohol-and-Depression-Image-via-healthcasual.com_.jpg",
		"http://3.bp.blogspot.com/_xJIBEZAZBJQ/SoAKf5etW4I/AAAAAAAAAI0/UQZR_NJWZpc/s400/depression2.JPG",
		"http://portalwebnews.com/wp-content/uploads/2010/11/04/depressao.jpg",
		"http://www.batuiranet.com.br/wp-content/uploads/2011/10/Depress.jpg"]
	robot.hear /^(.*) da depress[ãa]o/i, (msg) ->
		msg.send msg.random depressoes

import wollok.game.*

class Visual {
	var property image
	var property position = game.at(0,0)
}

const principal = new Visual(image = "principal.jpg")
const juego = new Visual(image = "juego.jpg")
const no = new Visual(image = "no.jpg")
const final = new Visual(image = "final.jpg")
const finalCursada = new Visual(image = "finCursada.jpg")
const pasillo=new Visual(image = "pasillo.jpg")
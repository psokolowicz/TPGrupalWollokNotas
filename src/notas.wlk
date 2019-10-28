import wollok.game.*
import niveles.*
import lobby.*
import niveles.*

object libreta {
	const notasATomar = 2
	var property sumatoria = 0
	var property cantNotas = 0
	var position = game.at(2,2)
	var property image = "libreta.jpg"
	
	method position() { return position }
	
	method position(newPos){
		position = game.at(newPos.x(), 2)
	}
	
	method agregarNota(nota){
		sumatoria += nota.valor()
		cantNotas++
		var cantNotasActuales = cantNotas
		var aprobo = personaje.aprobar()
		game.removeVisual(nota)
		if(personaje.progreso() < 6){
			if (cantNotasActuales == notasATomar){
				pantallas.final(aprobo)
			}
		}
		else if (cantNotasActuales == notasATomar && aprobo == 1){
			pantallas.ganaste()
		}
		else if(cantNotasActuales == notasATomar && aprobo == 0){
			pantallas.final(aprobo)
		}
	}
	
	method promedio(){ return self.sumatoria() / self.cantNotas() }
}

object utn {
	
	var property position = game.at(19,12)
	
	method image() = "utn.png"
}



class Numero{
	var property position
	var property valor

	method image(){
		return "" + valor.toString() + ".png"
	}
	method movete(){
		position = game.at(position.x(), position.y()-1)
	}
}
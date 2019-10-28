import wollok.game.*
import fondos.*
import lobby.*
import notas.*

object pantallas{
	method pregunta(){
		game.clear()
		game.addVisual(principal)
		
		keyboard.s().onPressDo{ self.lobby() }
		keyboard.n().onPressDo{ self.no() }
	}
	
	method no(){
		game.clear()
		game.title("No quiere empezar")
		game.addVisual(no)
		
		keyboard.s().onPressDo{ self.lobby() }
		keyboard.n().onPressDo{ self.no() }
		
	}
	
	method lobby(){
		game.clear()
		
		game.addVisual(pasillo)
		
		game.addVisualCharacter(personaje)
		
		game.addVisual(primero)
		game.addVisual(segundo)
		game.addVisual(tercero)
		game.addVisual(cuarto)
		game.addVisual(quinto)
		
		personaje.position(game.at(2,2))
		
		game.say(personaje, "Llevame al año que te gustaría cursar")
		
		game.whenCollideDo(primero, {personaje =>  personaje.todaviaNo(primero)})
		game.whenCollideDo(segundo, {personaje => personaje.todaviaNo(segundo) })
		game.whenCollideDo(tercero, {personaje => personaje.todaviaNo(tercero) })
		game.whenCollideDo(cuarto, {personaje =>  personaje.todaviaNo(cuarto) })
		game.whenCollideDo(quinto, {personaje => personaje.todaviaNo(quinto) })
		
	}
	
	method juego(tiempoDeMovimiento){
		game.clear()
		game.addVisual(juego)
		game.addVisualCharacter(libreta)
		// CREACION DE NUMEROS					
		game.onTick(600, "crear", { 
			const val = (1.. 10).anyOne()
			const posicion = game.at((1.. game.width()-3).anyOne(), 14)
			const numero = new Numero(position = posicion, valor = val)
			game.addVisual(numero)
			// MOVIMIENTO DE NUMEROS
			game.onTick(tiempoDeMovimiento,"mover",{numero.movete()})
		})
		// AGREGADO DE NOTAS PARA EL PROMEDIO
		game.whenCollideDo(libreta, {nota => libreta.agregarNota(nota)})
	}
	
	method ganaste(){
		game.clear()
		game.addVisual(final)
		game.addVisual(libreta)
		libreta.position(game.at(8,9))
		game.say(libreta, ((personaje.promTotal()/5).toString()))
		keyboard.enter().onPressDo{ game.stop() }
		
	}

	method final(aprobo){
		game.clear()
		game.title("Se termino el año")
		game.addVisual(finalCursada)
		game.addVisual(utn)
		utn.position(game.at(9,9))
		game.say(utn, personaje.intentos().toString())
		if(aprobo == 1) { 
			personaje.intentos(0)
		}
		keyboard.enter().onPressDo{ self.lobby() }
	}
}
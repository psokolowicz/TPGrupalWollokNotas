import wollok.game.*
import notas.*
import niveles.*

class Anio{
	var property position
	var property anio
	var property tiempoDeMovimiento
	
	method image(){
		return anio.toString() + ".png"
	}
	
	method jugar(){
		pantallas.juego(tiempoDeMovimiento)
	}
}

const primero = new Anio(position = game.at(4,10), anio = 1, tiempoDeMovimiento = 550)
const segundo = new Anio(position = game.at(7,10), anio = 2, tiempoDeMovimiento = 400)
const tercero = new Anio(position = game.at(10,10), anio= 3, tiempoDeMovimiento = 350)
const cuarto = new Anio(position = game.at(13,10), anio= 4, tiempoDeMovimiento = 250)
const quinto = new Anio(position = game.at(17,11), anio= 5, tiempoDeMovimiento = 150)

object personaje{
	var property progreso = 1
	var property intentos = 0
	// AL FINAL MOSTRAR PROMEDIO FINAL O EN UN LUGAR DE PROGRES
	var property promTotal = 0
	
	var property position = game.at(2,2)
	var property image = "utn.png"
	
	// Aumenta el progreso para los niveles y los intentos ademas de tener el promedio total 	
	method aprobar() {
		var aprobo = 0
		if(libreta.promedio() < 6) {
			intentos++
		}else if(libreta.promedio() >=6 ){
			progreso++
			intentos++
			promTotal += libreta.promedio()
			aprobo = 1
		}
		libreta.cantNotas(0)
		libreta.sumatoria(0)
		return aprobo
	}
	
	method todaviaNo(unAnio){
		if(progreso < unAnio.anio()){
			game.say(self, "Todavia no llegue a " + unAnio.anio().toString() + "! Estoy en " + progreso.toString())
		}
		else if(progreso > unAnio.anio()){
			game.say(self, "Ya pase este anio")
		}
		else{
			unAnio.jugar()
		}
	}
}
import wollok.game.*
import bombas.*
object bomberman{
    //si da el tiempo voy a hacerle que gire a donde se mueve
    var property image = "bombermanAbajo.png"
    var property position = game.center()
    var direccion = abajo
	var bombasDisponibles = 5 // ver con cuantas empieza o tiene, o si aumenta si hay powerups

	method bombasDisponibles() = bombasDisponibles

	method agregarBomba() {
	     bombasDisponibles = bombasDisponibles +1 // methodo que agrega a 1 bomba a la variable cuando ya exploto
	}

	method ponerBomba(){
		if(bombasDisponibles >= 1){
			//game.addVisual(new Bomba())
			game.addVisual(new Bomba(position=self.position()))
			bombasDisponibles -= 1
			game.onTick(1000, "activarBomba", {bomba.relojActivado()})}
		}
	}

    method irArriba() {
		direccion = arriba
		self.avanzar()
	}

	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	
	method avanzar() {
        const siguientePosicion = game.getObjectsIn(direccion.siguiente(position))
        if(siguientePosicion.isEmpty() || siguientePosicion.first().puedeAtravesarse()){
            position = direccion.siguiente(position)
			self.actualizarImagen(direccion.imagen())
        }
	}

	method actualizarImagen(direccionImagen){
		const baseImagen = "bomberman"
		const extension = ".png"
		image = baseImagen + direccionImagen + extension
	}
}

class Direccion {
	method siguiente(position)
	method imagen()
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	override method imagen() = "Izquierda"
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	override method imagen() = "Derecha"
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	override method imagen() = "Abajo"
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	override method imagen() = "Arriba"
}
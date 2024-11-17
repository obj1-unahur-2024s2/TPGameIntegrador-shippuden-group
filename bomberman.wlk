import wollok.game.*
object bomberman{
    //si da el tiempo voy a hacerle que gire a donde se mueve
    var property image = "bombermanAbajo.png"
    var property position = game.center()
    var direccion = abajo
	var bombasDisponibles = 2 // ver con cuantas empieza o tiene, o si aumenta si hay powerups

	method bombasDisponibles() = bombasDisponibles

	method ponerBomba(){
		if(bombasDisponibles >= 1){
			//game.addVisual(new Bomba())
			console.println("Puse una bomba")
			bombasDisponibles -= 1
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
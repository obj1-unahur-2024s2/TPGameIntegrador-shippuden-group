import wollok.game.*
import bombas.*
import config.*
object bomberman{
    //si da el tiempo voy a hacerle que gire a donde se mueve
    var property image = "bombermanAbajo.png"
    var property position = game.center()
    var direccion = abajo
	var bombasDisponibles = 2 //ver si cuantas dejar como inicial

	method bombasDisponibles() = bombasDisponibles

	method agregarBomba() {
		console.println("Se ejecuto agregar bomba")
	    bombasDisponibles += 1 // methodo que agrega a 1 bomba a la variable cuando ya exploto
	}

	method ponerBomba(){
		if(bombasDisponibles >= 1){
			game.addVisual(new Bomba(position=self.position()))
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


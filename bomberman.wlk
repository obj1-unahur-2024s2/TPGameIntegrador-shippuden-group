import wollok.game.*
import bombas.*
import config.*
object bomberman{
    //si da el tiempo voy a hacerle que gire a donde se mueve
    var property image = "bombermanAbajo.png"
    var property position = game.at(1,1)
    var direccion = abajo
	var bombasDisponibles = 2 //ver si cuantas dejar como inicial
	var estaVivo = true

	method bombasDisponibles() = bombasDisponibles

	method agregarBomba() {
	    bombasDisponibles += 1
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
		self.actualizarImagen(direccion.imagen())
        if(siguientePosicion.isEmpty() || siguientePosicion.first().puedeAtravesarse()){
            position = direccion.siguiente(position)
			
        }
	}

	method puedeMoverseHacia(siguientePosicion){
		return estaVivo and (siguientePosicion.isEmpty() or siguientePosicion.first().puedeAtravesarse())
	}

	method actualizarImagen(direccionImagen){
		const baseImagen = "bomberman"
		const extension = ".png"
		image = baseImagen + direccionImagen + extension
	}

	method morir(){
		estaVivo = false
		self.mostrarAnimacionDeMuerte()
		
		game.schedule(1000, {configuraciones.perder()})
	}

	//hice esto de otro objeto, porque no supe como ponerlo delante del tablero de nuevo
	//trate con removeself y addself pero no me funcionaba, creeria que despues de hacer el remove no se ejecuta lo demas
	method mostrarAnimacionDeMuerte(){
		bombermanMuerto.position(self.position())
		game.addVisual(bombermanMuerto)
		self.position(game.at(-1,-1))
		game.removeVisual(self)
		
	}
}

object bombermanMuerto{
	var property position = game.at(1,1)//una posicion cualquiera
	method hacerDanio() = false
	method puedeAtravesarse() = true
	method image() = "bombermanMuerto.png"
}

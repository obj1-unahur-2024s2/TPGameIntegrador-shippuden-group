import bomberman.*

object ui{
	method cargar(){
		game.addVisual(contadorImagen)
    	game.addVisual(contadorLabel) 
    	game.addVisual(relojImagen) 
		game.addVisual(relojLabel)
	}
}

class Label{
	method textColor() = "FFFFFF"
}

object contadorImagen {
    const position =  game.at(1,9)
    method image() ="contadorBomba.png" 
    method position() = position
}

object contadorLabel inherits Label{
	method position() = game.at(2,game.height() - 1)
	method text() = "" + bomberman.bombasDisponibles() 
}


object relojImagen {
	method position() = game.at(game.width() - 3, game.height() - 1)
	method image() = "reloj.png"

}

object relojLabel inherits Label{
	var tiempo = 0

	method position() = game.at(game.width() - 2, game.height() - 1)
	method initialize(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}

	method text() = ""+tiempo

	method pasarTiempo() {
		tiempo = tiempo + 1
	}

	method detener(){
		game.removeTickEvent("tiempo")
	}

	method reiniciar(){
		tiempo = 0
	}
}
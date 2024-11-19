import bomberman.*
import bombas.*
object controles{
    method activarControles(){
        keyboard.up().onPressDo({bomberman.irArriba()})
        keyboard.down().onPressDo({bomberman.irAbajo()})
        keyboard.left().onPressDo({bomberman.irIzquierda()})
        keyboard.right().onPressDo({bomberman.irDerecha()})
        keyboard.space().onPressDo({bomberman.ponerBomba()} )
    }
}

object configuraciones{
    method tiempoDeEplosionDeBombas() = 2
    method duracionDeExplosion() = 1

    method velocidadFantasma() = 0.4
    method velocidadValcom() = 0.8

    method generarNumeroRandom(){
        return 0.randomUpTo(300).truncate(0)
    }

    method activarColisiones(){
        game.whenCollideDo(bomberman, {elemento => 
            if (elemento.className() == "bombas.Explosion" || self.esUnEnemigo(elemento)){
                bomberman.morir()
            }   
        }) 

    }
    //no supe hacerlo mejor esto
    method esUnEnemigo(enemigo){
        return enemigo.className() == "enemigo.Valcom" || enemigo.className() == "enemigo.Fantasma" // aca hay quje agregar los nuevos enemigos que hagamos
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
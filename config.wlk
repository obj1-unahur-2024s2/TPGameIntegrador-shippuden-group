import bomberman.*
import bombas.*
import niveles.*
object controles{
    method activarControles(){
        keyboard.up().onPressDo({bomberman.irArriba()})
        keyboard.down().onPressDo({bomberman.irAbajo()})
        keyboard.left().onPressDo({bomberman.irIzquierda()})
        keyboard.right().onPressDo({bomberman.irDerecha()})
        keyboard.w().onPressDo({bomberman.irArriba()})
        keyboard.s().onPressDo({bomberman.irAbajo()})
        keyboard.a().onPressDo({bomberman.irIzquierda()})
        keyboard.d().onPressDo({bomberman.irDerecha()})

        keyboard.space().onPressDo({bomberman.ponerBomba()} )
        keyboard.r().onPressDo({niveles.reiniciarJuego()} )
        keyboard.j().onPressDo({configuraciones.pasarNivel()} ) //pa pruebas
        keyboard.c().onPressDo({console.println(configuraciones.todosLosEnemigosMuertos())} ) //esto pa debug
    }
}

object niveles{

    const listaNiveles = [nivel1,nivel2]

    method cargar(nivel){
        nivel.cargar()
    }

    method reiniciarJuego(){
        //game.clear() no funca game clear :(
        self.removerTodo()
        self.cargar(nivel1)
    }

    //no tengo lista de visuals, mas qu del nivel :(
    method removerTodo(){
        const lista = [bomberman,imagenPerder,bombermanMuerto,pantallaFinal]
        lista.forEach{elemento => 
            if (game.hasVisual(elemento)){
                game.removeVisual(elemento)
            }}

        listaNiveles.forEach({nivel => nivel.eliminarVisuals()})
        console.println(nivel1.visuals())
        console.println(nivel1.visualsEnemigos())
        //self.cargar(nivel1)
    }
}

object configuraciones{

    var property nivelActual = nivel1 

    method tiempoDeEplosionDeBombas() = 1.5
    method duracionDeExplosion() = 1

    method velocidadFantasma() = 2
    method velocidadValcom() = 0.8

    method generarNumeroRandom(){
        return 0.randomUpTo(300).truncate(0)
    }

    method todosLosEnemigosMuertos() = nivelActual.visualsEnemigos().all{enemigo => !enemigo.vivo()}

    method pasarNivel(){
        if(self.todosLosEnemigosMuertos()){
            niveles.removerTodo()
            niveles.cargar(nivelActual.siguienteNivel())
        }
    }

    method activarColisiones(){
        game.whenCollideDo(bomberman, {elemento => 
            /*
            if (elemento.className() == "bombas.Explosion" || self.esUnEnemigo(elemento)){
                bomberman.morir()
            }   */
            if (elemento.haceDanio()){
                bomberman.morir()
            }
        }) 

    }

    method perder(){
        game.addVisual(imagenPerder)
    }
    /*
    method esUnEnemigo(enemigo){
        return enemigo.className() == "enemigo.Valcom" || enemigo.className() == "enemigo.Fantasma" // aca hay quje agregar los nuevos enemigos que hagamos
    }*/
}


object imagenPerder{
	method position() = game.origin()
	method image() = "imagenPerder.jpg"
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
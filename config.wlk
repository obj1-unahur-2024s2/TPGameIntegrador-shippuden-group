import bomberman.*
import bombas.*
object controles{
    method activarControles(){
        keyboard.up().onPressDo({bomberman.irArriba()})
        keyboard.down().onPressDo({bomberman.irAbajo()})
        keyboard.left().onPressDo({bomberman.irIzquierda()})
        keyboard.right().onPressDo({bomberman.irDerecha()})
        keyboard.space().onPressDo(
            {bomberman.ponerBomba()
            game.onTick(1000, "activarBomba", {bomba.relojActivado()})} )

        //game.whenCollideDo(raton, { elemento => elemento.interactuar() })
    }
}
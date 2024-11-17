import bomberman.*
object controles{
    method activarControles(){
        keyboard.up().onPressDo({bomberman.irArriba()})
        keyboard.down().onPressDo({bomberman.irAbajo()})
        keyboard.left().onPressDo({bomberman.irIzquierda()})
        keyboard.right().onPressDo({bomberman.irDerecha()})
        keyboard.space().onPressDo({bomberman.ponerBomba()})

        //game.whenCollideDo(raton, { elemento => elemento.interactuar() })
    }
}
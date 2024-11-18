import wollok.game.*
import bomberman.*

class Bomba  {
    var property position 
    var tiempoDeExplosion = 3
    var numeroRandomParaElTick

    method image() = "bomba1.png"
    method text() = "tiempo: " + tiempoDeExplosion

    method initialize(){
        numeroRandomParaElTick = self.generarNumeroRandom()
        game.onTick(1000, "activarBomba"+numeroRandomParaElTick, {self.descontarTiempo(1)})
    }

    method generarNumeroRandom(){
        return 0.randomUpTo(300).truncate(0)
    }

    method puedeTraspazarse() = false 

    method descontarTiempo(segundos) {
        tiempoDeExplosion = 0.max(tiempoDeExplosion - segundos)
        self.explotar()
    }

    method explotar(){
        if(tiempoDeExplosion == 0){
            console.println("Exploto!")
            bomberman.agregarBomba() 
            game.addVisual(new Explosion(position = self.position()))
            self.removerBomba()
        }
        
        
        //tiempoDeExplosion=2 // el tiempo de explocion vuelve a settearse en 2
    }

    method removerBomba() {
        game.removeTickEvent("activarBomba"+numeroRandomParaElTick)// cuando explota remueve el tick y cuando pone lo activa
        game.removeVisual(self)
    }

}


class Explosion {
    const property position 
    var property tiempoDeExplosion = 2
    method image() ="explosion.png"

    method initialize(){
        game.onTick(1000, "activarTimer", {self.relojActivado()})
    }

    method relojActivado() {
       tiempoDeExplosion = 0.max(tiempoDeExplosion - 1)
       self.removerObjeto()
    }

    method removerObjeto(){
        if(tiempoDeExplosion == 0) {
            game.removeVisual(self)
            game.removeTickEvent("activarBomba")
            // debe volver a settearse en 2 este valor por que queda en 0 cuando termina la animacion
        }
    }
   
}

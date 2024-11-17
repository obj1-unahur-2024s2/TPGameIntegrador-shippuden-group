import wollok.game.*
class Bomba  {
    var property position
    var property tiempoDeExplacion = 2
    var property estaActivada = false
    var property puedeTraspazarse = false 

    /*
    method initialize(){
        game.onTick(1000, "activarBomba", {self.relojActivado()})
    }*/

    method image() = "bomba1.png"
    //if(tiempoDeExplacion >=1){"descarga (1).png"}else{self.explotar()}

    method text() = "tiempo: " +self.tiempoDeExplacion()

    method relojActivado() {
       tiempoDeExplacion = 0.max(tiempoDeExplacion - 1)
       self.removerBomba()
    }

    method explotar(){
        //esto despues tendria que agarrar una bomba para cada punto
        game.addVisual(new Explosion(position = self.position()))
        game.removeVisual(self)
    }

    method removerBomba() {
        if(tiempoDeExplacion == 0) {
            self.explotar()
            //game.removeTickEvent("activarBomba")
        }

    }
    /*
    method hacerDanio(unObjeto) {
       game.removeTickEvent("activarBomba")

       //unObjeto.recibirDanio(self.danio())
    }
    */
}

class Explosion {
    const property position 
    var property tiempoDeExplacion = 2
    method image() ="explosion.png"

    method initialize(){
        game.onTick(1000, "activarTimer", {self.relojActivado()})
    }

    method relojActivado() {
       tiempoDeExplacion = 0.max(tiempoDeExplacion - 1)
       self.removerObjeto()
    }

    method removerObjeto(){
        if(tiempoDeExplacion == 0) {
            game.removeVisual(self)
            game.removeTickEvent("activarBomba")
        }
    }
   
}
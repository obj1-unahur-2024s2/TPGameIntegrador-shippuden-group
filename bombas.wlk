import wollok.game.*
import bomberman.*
import config.*

class ObjetoConCuentaRegresiva{
    var property position 
    var numeroRandomParaElTick
    var temporizador

    method image()
    //method text() //esto es a modo de debug

    method initialize(){
        numeroRandomParaElTick = configuraciones.generarNumeroRandom()
        game.onTick(1000, "timer"+numeroRandomParaElTick, {self.descontarTiempo(1)})
    }

    method descontarTiempo(segundos) {
        temporizador = 0.max(temporizador - segundos)
    }

    method puedeAtravesarse() = false 

    method removerObjeto() {
        game.removeTickEvent("timer"+numeroRandomParaElTick)// cuando explota remueve el tick y cuando pone lo activa
        game.removeVisual(self)
    } 
}
class Bomba inherits ObjetoConCuentaRegresiva(temporizador = configuraciones.tiempoDeEplosionDeBombas()){

    override method image() = "bomba1.png"
    //override method text() = "tiempo: " + temporizador //DEBUG

    override method descontarTiempo(segundos) {
        if(temporizador == 0){
            self.explotar()
        }
        super(segundos)
    }

    method explotar(){
        bomberman.agregarBomba() 
        game.addVisual(new Explosion(imagen = "explosionCentro.png", position = self.position()))
        self.ondaExpansiva()
        self.removerObjeto()
    }

    //Cosa para quizas cambiar si terminamos y hay tiempo.
    //Ver si podemos pedirle
    method ondaExpansiva(){
        if(self.noHayParedhacia(self.position().up(1))){
            game.addVisual(new Explosion(imagen = "explosionArriba.png", position = self.position().up(1)))
        }
        if(self.noHayParedhacia(self.position().right(1))){
            game.addVisual(new Explosion(imagen = "explosionDerecha.png", position = self.position().right(1)))
        }
        if(self.noHayParedhacia(self.position().down(1))){
            game.addVisual(new Explosion(imagen = "explosionAbajo.png" ,position = self.position().down(1)))
        }
        if(self.noHayParedhacia(self.position().left(1))){
            game.addVisual(new Explosion(imagen = "explosionIzquierda.png", position = self.position().left(1)))
        }
    }

    method noHayParedhacia(direccion){
        const listaDeObjetos = game.getObjectsIn(direccion)

        return !listaDeObjetos.any({obj => obj.className() == "escenario.Pared" || obj.className() == "escenario.Bloque"})

    }
}   



class Explosion inherits ObjetoConCuentaRegresiva(temporizador = configuraciones.duracionDeExplosion()){

    const imagen

    override method image() = imagen
    //override method text() = "tiempo: " + temporizador //DEBUG

    override method descontarTiempo(segundos){
        if(temporizador == 0){
            self.removerObjeto()
        }
        super(segundos)
    }

    override method puedeAtravesarse() = true

}

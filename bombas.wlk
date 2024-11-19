import wollok.game.*
import bomberman.*
import config.*

class ObjetoConCuentaRegresiva{
    var property position 
    var numeroRandomParaElTick
    var temporizador

    method image()
    method text() //esto es a modo de debug

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
    override method text() = "tiempo: " + temporizador //DEBUG

    override method descontarTiempo(segundos) {
        console.println("bomba: "+temporizador)
        if(temporizador == 0){
            self.explotar()
        }
        super(segundos)
    }

    method explotar(){
        console.println("Exploto!") //DEBUG
        bomberman.agregarBomba() 
        game.addVisual(new Explosion(position = self.position()))
        self.ondaExpansiva()
        self.removerObjeto()
    }
    method ondaExpansiva(){
        if(game.getObjectsIn(self.position().up(1)).isEmpty()){
            game.addVisual(new Explosion(position = self.position().up(1)))
        }
        if(game.getObjectsIn(self.position().right(1)).isEmpty()){
            game.addVisual(new Explosion(position = self.position().right(1)))
        }
        if(game.getObjectsIn(self.position().down(1)).isEmpty()){
            game.addVisual(new Explosion(position = self.position().down(1)))
        }
        if(game.getObjectsIn(self.position().left(1)).isEmpty()){
            game.addVisual(new Explosion(position = self.position().left(1)))
        }
    }
    }   



class Explosion inherits ObjetoConCuentaRegresiva(temporizador = configuraciones.duracionDeExplosion()){

    override method image() ="explosion.png"
    override method text() = "tiempo: " + temporizador //DEBUG

    override method descontarTiempo(segundos){
        console.println("bomba: "+temporizador)
        if(temporizador == 0){
            self.removerObjeto()
        }
        super(segundos)
    }

}

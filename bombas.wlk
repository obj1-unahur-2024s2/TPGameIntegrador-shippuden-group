import wollok.game.*
import bomberman.*
import config.*

class ObjetoConCuentaRegresiva{
    var property position 
    const temporizador

    method image()

    method initialize(){
        game.schedule(temporizador * 1000, {self.removerObjeto()})
    }

    method puedeAtravesarse() = false 

    method removerObjeto(){
        game.removeVisual(self)
    }
}
class Bomba inherits ObjetoConCuentaRegresiva(temporizador = configuraciones.tiempoDeEplosionDeBombas()){

    override method image() = "bomba1.png"

    override method removerObjeto(){
        self.explotar()
        super()
    }

    method explotar(){
        bomberman.agregarBomba() 
        self.crearOndaExpansiva()
    }

    //Cosa para quizas cambiar si terminamos y hay tiempo.
    //Ver si podemos pedirle
    method crearOndaExpansiva(){
        game.addVisual(new Explosion(imagen = "explosionCentro.png", position = self.position()))
        
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
    override method puedeAtravesarse() = true
}

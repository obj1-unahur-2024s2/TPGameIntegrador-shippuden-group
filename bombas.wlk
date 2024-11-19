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

    method haceDanio()
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

    override method haceDanio() = false

    //este metodo necesita refactorisarse urgemtente
    method crearOndaExpansiva(){
        const direcciones = [arriba,abajo,izquierda,derecha]

        game.addVisual(new Explosion(imagen = "explosionCentro.png", position = self.position()))
        
        //para crear las explosiones al rededor
        direcciones.forEach({direccion => 
            const siguiente = direccion.siguiente(position)
            const objetosEnLaSiguientePosicion = game.getObjectsIn(direccion.siguiente(position))

            if (self.noHayParedhacia(direccion.siguiente(position))){
                const imagenExplosion = "explosion" + direccion.imagen() + ".png"
                game.addVisual(new Explosion(imagen = imagenExplosion, position = direccion.siguiente(position)))
            }else if(objetosEnLaSiguientePosicion.first().className() == "escenario.Bloque"){
                objetosEnLaSiguientePosicion.first().destruir()
            }
        })

        /*
        if(self.noHayParedhacia(arriba.siguiente(position))){
            game.addVisual(new Explosion(imagen = "explosionArriba.png", position = arriba.siguiente(position)))
        }

        if(self.noHayParedhacia(self.position().right(1))){
            game.addVisual(new Explosion(imagen = "explosionDerecha.png", position = self.position().right(1)))
        }else{
            game.getObjectsIn(self.position().up(1)).find{pared => pared.className() == "escenario.Bloque"}.destruir()
        }
        
        if(self.noHayParedhacia(self.position().down(1))){
            game.addVisual(new Explosion(imagen = "explosionAbajo.png" ,position = self.position().down(1)))
        }else{
            game.getObjectsIn(self.position().up(1)).find{pared => pared.className() == "escenario.Bloque"}.destruir()
        }
        
        if(self.noHayParedhacia(self.position().left(1))){
            game.addVisual(new Explosion(imagen = "explosionIzquierda.png", position = self.position().left(1)))
        }else{
            game.getObjectsIn(self.position().up(1)).find{pared => pared.className() == "escenario.Bloque"}.destruir()
        }*/
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
    override method haceDanio() = true
}

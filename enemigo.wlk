import wollok.game.*
import bomberman.*
import config.*

//despues pasar todo a enemigo
class Enemigo{
  var property position
  const velocidad // este vamos a indicar cada cuanto se actualiza
  const nombre
  const puedeAtravesarParedes
  const property direcciones = [izquierda,derecha,arriba,abajo]
  var numeroRandomParaElTick
  var property image
  var vivo = true

  method initialize(){
    image = nombre+"Abajo.png"
    numeroRandomParaElTick = configuraciones.generarNumeroRandom()
    game.onTick(velocidad, "movimientoEnemigo"+numeroRandomParaElTick, {self.moverse()})
    //Hice esto para que no se creen muchos onTick con el mismo nombre ya que traia problemas.
    //despues vi que existe el schedule para que se ejecute tal accion despues de cierto tiempo
    self.detectarExplosiones()
  }

  method detectarExplosiones(){
    game.whenCollideDo(self,{ elemento => 
      if(elemento.className() == "bombas.Explosion"){
        self.morir()
      }
    })
  }

  method morir(){
    vivo = false
    self.animacionMorir()
    game.schedule(1000, {game.removeVisual(self)})
  }
  
  method animacionMorir(){
    game.addVisual(new EnemigoMuerto(nombre = nombre, position = self.position()))
    game.removeVisual(self)
  }

  method estaVivo() = vivo

  method puedeAtravesarse() = true

  method moverse(){
        const aleatorio = direcciones.anyOne()
        const siguientePosicion = game.getObjectsIn(aleatorio.siguiente(position))
           if(self.estaVivo() and (self.puedeAtravesarParedes() or siguientePosicion.isEmpty())){
        position = aleatorio.siguiente(position)
        self.actualizarImagen(aleatorio.imagen())
    }
  }

  method puedeAtravesarParedes() = puedeAtravesarParedes

  method actualizarImagen(direccionImagen){
		const extension = ".png"
		image = nombre + direccionImagen + extension
  }

}

class Valcom inherits Enemigo(velocidad = 1000, nombre = "valcom", puedeAtravesarParedes = false){

}

class EnemigoMuerto{
  const nombre
  const property image = nombre+"Muerto.png"
  const property position 

  method initialize(){
    game.schedule(1000, {game.removeVisual(self)})
  }
}

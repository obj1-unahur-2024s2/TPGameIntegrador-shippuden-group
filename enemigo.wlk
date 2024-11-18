import wollok.game.*
import bomberman.*
import config.*

//despues pasar todo a enemigo
class Enemigo{
  var property position
  const velocidad // este vamos a indicar cada cuanto se actualiza
  const nombreImagenBase
  const puedeAtravesarParedes
  const property direcciones = [izquierda,derecha,arriba,abajo]
  var numeroRandomParaElTick
  var property image

  method initialize(){
    image = nombreImagenBase
    numeroRandomParaElTick = configuraciones.generarNumeroRandom()
    game.onTick(velocidad, "movimientoEnemigo"+numeroRandomParaElTick, {self.moverse()})
  }

  method moverse(){
        const aleatorio = direcciones.anyOne()
        const siguientePosicion = game.getObjectsIn(aleatorio.siguiente(position))
           if(self.puedeAtravesarParedes() or siguientePosicion.isEmpty()){
        position = aleatorio.siguiente(position)
        self.actualizarImagen(aleatorio.imagen())
    }
  }

  method puedeAtravesarParedes() = puedeAtravesarParedes

  method actualizarImagen(direccionImagen){
		const extension = ".png"
		image = nombreImagenBase + direccionImagen + extension
  }

}

class Valcom inherits Enemigo(velocidad = 1000, nombreImagenBase = "valcom", puedeAtravesarParedes = false){

}
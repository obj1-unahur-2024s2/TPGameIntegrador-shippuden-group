import wollok.game.*
import bomberman.*

object valcom {
  var property image = "valcom.png"
  var property position = game.at(4, 5)
  const property direcciones = [izquierda,derecha,arriba,abajo]
  var direccion = direcciones.anyOne()

  method moverse() {
    const aleatorio = direcciones.anyOne()
    const siguientePosicion = game.getObjectsIn(aleatorio.siguiente(position))
    if(siguientePosicion.isEmpty()){
        position = aleatorio.siguiente(position)
        //self.actualizarImagen(direccion.imagen())
    }
  }
}
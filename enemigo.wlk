import wollok.game.*
import bomberman.*
import config.*

class Enemigo{
  var property position
  const velocidad // este vamos a indicar cada cuanto se actualiza
  const nombre
  const puedeAtravesarBloques
  const property direcciones = [izquierda,derecha,arriba,abajo]
  var numeroRandomParaElTick
  var property image
  var vivo = true

  method initialize(){
    image = nombre+"Abajo.png"
    numeroRandomParaElTick = configuraciones.generarNumeroRandom()
    game.onTick(velocidad, "movimientoEnemigo"+numeroRandomParaElTick, {self.moverse()})
    //hice esto para que haya un onTick independiente por enemigo. Se podria haber usado uno global y que llame a una lista
    //de enemigos y haga un forEach{enemigo => enemigo.moverse()} para modificar si se puede.
    //a si tendriamos un solo onTick que controle todo
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
    //por ahora solo cambia de sprite a uno muerto, ver si hacemos animacion
    game.addVisual(new EnemigoMuerto(nombre = nombre, position = self.position()))
    game.removeVisual(self)
  }

  method estaVivo() = vivo

  method puedeAtravesarse() = true

  method moverse(){
        const aleatorio = direcciones.anyOne()
        const siguientePosicion = game.getObjectsIn(aleatorio.siguiente(position))
           if(self.estaVivo() and (self.puedeAtravesarBloques() or siguientePosicion.isEmpty())){
        position = aleatorio.siguiente(position)
        self.actualizarImagen(aleatorio.imagen())
    }
  }

  method puedeAtravesarBloques() = puedeAtravesarBloques

  method actualizarImagen(direccionImagen){
		const extension = ".png"
		image = nombre + direccionImagen + extension
  }

}

class Valcom inherits Enemigo(velocidad = 700, nombre = "valcom", puedeAtravesarBloques = false){

}

class Fantasma inherits Enemigo(velocidad = 1000, nombre = "fantasma", puedeAtravesarBloques = false){
//este enemigo estaria bueno que te pueda seguir y que pueda atravesar bloques
}

class EnemigoMuerto{
  const nombre
  const property image = nombre+"Muerto.png"
  const property position 

  method initialize(){
    game.schedule(1000, {game.removeVisual(self)})
  }
}

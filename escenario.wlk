import wollok.game.*

class Escenario {
  const visuals=[]

  method crearLineaHaciaDerecha(origenX,origenY,_ancho){
    (origenX..origenX + _ancho).forEach({n=>visuals.add(new Pared(position = game.at(n,origenY)))})
  }

  method crearLineaHaciaArriba(origenX,origenY,_alto){
    (origenY..origenY + _alto).forEach({n=>visuals.add(new Pared(position = game.at(origenX,n)))})
  }

  method crearBordes(){
    self.crearLineaHaciaArriba(0, 0, game.height() - 2)
    self.crearLineaHaciaDerecha(1, game.height() - 2, game.width() - 3)
    self.crearLineaHaciaArriba(game.width() - 1, 0, game.height() - 2)
    self.crearLineaHaciaDerecha(1, 0, game.width() - 3)
  }

  method ponerParedes(){
    (1 .. game.height() - 3).forEach({
      y => (1 .. game.width() - 2).forEach({
          x => if (x.even() and y.even()){visuals.add(new Pared(position = game.at(x,y)))}
        })
    })
    
  }

  method cargarBloques()

  method renderizarNivel(){
    visuals.forEach({visual=>game.addVisual(visual)})
  }

  method cargar(){
    self.crearBordes()
    self.ponerParedes()
    self.cargarBloques()
    self.renderizarNivel()
  }

}

class Objeto{
    const property position
    method puedeAtravesarse() = false
}

class Pared inherits Objeto{
    const property image = "pared2.png"
    //verride method puedeAtravesarse() = false
}

class Bloque inherits Objeto{
    const property image = "bloque.png"

    method destruir(){
      game.removeVisual(self)
    }
}





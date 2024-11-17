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
    self.crearLineaHaciaArriba(0, 0, game.height())
    self.crearLineaHaciaDerecha(game.height(), 0, game.width())
    self.crearLineaHaciaArriba(game.width(), 0, game.height())
    self.crearLineaHaciaDerecha(0, 0, game.width())
  }
  method ponerParedes(posx,posy){    
    (posx..posx+10).forEach((posy..posy + 7).forEach({x,y => if(x.even() and y.even()){visuals.add(new Pared(position = game.at(posx,posy)))}}))
  }
  method renderizarNivel(){
    visuals.forEach({visual=>game.addVisual(visual)})
  }
  
}

class Objeto{
    const property position
    method puedeAtravesarse() = true
}

class Pared inherits Objeto{
    const property image = "pared.png"
    override method puedeAtravesarse() = false
}


import bomberman.*

object contador  {

    var position =  game.at(2,9)

    method image() ="contadorBomba.png" 
    method position() = position

    method text() ="bombas" + bomberman.bombasDisponibles() 
  
}


object reloj {
	var tiempo = 0
  var property position = game.at(6,9)
	method pasarTiempo() {
		tiempo = tiempo + 1
	}
  method image()= "reloj.png"
  method text()= "Tiempo " +  tiempo
	method initialize(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
 }
import mainExample.*
import personajes.*


object UI{
    
}

class BarraDeVida {
    const position 

    method image() = "barraDeVida2.png" 

    method position() = position 

    method text() = "hp" + player.vida()

}

class VidaEnemiga inherits BarraDeVida {

    override method image()= "barraDeVida1.png" 

}


const vidaPJ = new BarraDeVida(position = game.at(2,7))

const vidaEnemigo = new BarraDeVida(position = game.at(12,7))


object menu {
    var position = game.at(1,1)

    method image() ="menuBatalla.png" 

    method position() = position 
  

    
}

class Menu{
    const property opciones = [] 

    var property opcionActual = opciones.first()

    method renderizarOpciones(){
		opciones.forEach({opcion => game.addVisual(opcion)})
	}

    method moverSiguienteopcion(){
		opcionActual = self.siguienteOpcion(opciones, opcionActual)
		//return self.siguienteOpcion(labels, opcionActual)
	}

    method siguienteOpcion(lista, elemento){
        return if(elemento == lista.last()) lista.first() else self.siguienteElemento(lista,elemento)
    }

    method siguienteElemento(lista, elemento){
        var encontrado = false 
		var siguiente = null

		lista.forEach({e => 

			if(encontrado and siguiente == null){
				siguiente = e
			}

			if(e == elemento){
				encontrado = true
			}

		})

		return siguiente
    }
}
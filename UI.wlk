import assets.*
import UI_opciones.*
import personajes.*


//Agrupe todo lo que es User Interface en este archivo
//El objeto UI es el que se va a encargar de mostrar las cosas.
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

object cursor{
    var position = game.at(15,5)//puse una posicon cualquiera para que no este vacio
    
    method position() = position
    method image() = imagenes.cursor()

    method moverCursor(opcionMenu){
        const x = opcionMenu.position().x()
        const y = opcionMenu.position().y()
        position = game.at(x - 2, y)
    }
}

class Fondo{
    method image() = imagenes.fondo()
    const property position
}

class Menu{
    const property opciones = []
    const tipoDeMenu
    const alto = opciones.size() // va a tener de alto la cantidad de opciones
    const ancho = 3 //este 3 hay que probar como queda en otros menues

    var property opcionActual = opciones.first()

    const posicionX = tipoDeMenu.x() + 1  //origen (celda de abajo a la izquierda)
    const posicionY = tipoDeMenu.y() //origen

    method renderizarMenu(){
        self.renderizarFondo()
        self.renderizarOpciones()
        game.addVisual(cursor)
        cursor.moverCursor(opcionActual)
    }

    method renderizarFondo(){

        const _ancho = ancho + posicionX - 1
        const _alto = alto + posicionY - 1

        (posicionX - 1 .. _ancho).forEach({
            posX => 
                (posicionY .. _alto).forEach({
                    posY => game.addVisual(new Fondo(position = game.at(posX,posY)))
                })
        })

    }

    method renderizarOpciones(){
        var offsetY = opciones.size() - 1
    
		opciones.forEach({opcion => 
            opcion.position(game.at(posicionX + 1,posicionY + offsetY ))
            game.addVisual(opcion)
            offsetY -= 1
            })
	}

    method moverSiguienteOpcion(){
		opcionActual = self.siguienteOpcion(opciones, opcionActual)
        cursor.moverCursor(opcionActual)
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

    method moverAnteriorOpcion(){
		opcionActual = self.anteriorOpcion(opciones, opcionActual)
        cursor.moverCursor(opcionActual)
    }

    method anteriorOpcion(lista, elemento){
        const reversedList = lista.reverse()
		return if(elemento == reversedList.last()) reversedList.first() else self.siguienteElemento(reversedList,elemento)
    }

    method seleccionarOpcionActual(){
        opcionActual.seleccionar()
    }
}

//distintos tipos de menu (dan cosas como la posicion donde se muestra)
object menuBatalla{
    method x() = 2
    method y() = 2
}

object menuAtaque{
    method x() = 2
    method y() = 0
}
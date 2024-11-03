import assets.*
import UI_opciones.*
import personajes.*
import wollok.game.*


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

    //mover a otro lado depsues esto
object controles{
    method activarControles(menu){
        keyboard.up().onPressDo({ menu.moverAnteriorOpcion()})
        keyboard.down().onPressDo({ menu.moverSiguienteOpcion()})
        keyboard.enter().onPressDo({ menu.seleccionarOpcionActual()})
    }

    method desactivarControles(){
        keyboard.up().onPressDo(null)
        keyboard.down().onPressDo(null)
        keyboard.enter().onPressDo(null)
    }
}

class Menu{
    const property opciones = []
    const visuals = []
    var property quienLoUsa = null// cambiar de nombre
    const tipoDeMenu
    const alto = opciones.size() // va a tener de alto la cantidad de opciones
    const ancho = 3 //este 3 hay que probar como queda en otros menues

    var property opcionActual = opciones.first()

    const posicionX = tipoDeMenu.x() + 1  //origen (celda de abajo a la izquierda)
    const posicionY = tipoDeMenu.y() //origen

    method renderizarMenu(){
        self.renderizarFondo()
        self.renderizarOpciones()
        visuals.add(cursor)
        game.addVisual(cursor)
        cursor.moverCursor(opcionActual)
    }


    method renderizarFondo(){//cambiar nombre a generar fondo
        
        const _ancho = ancho + posicionX - 1
        const _alto = alto + posicionY - 1

        (posicionX - 1 .. _ancho).forEach({
            posX => 
                (posicionY .. _alto).forEach({
                    posY => game.addVisual(new Fondo(position = game.at(posX,posY)))
                })
        })
        /*
        const _ancho = ancho + posicionX - 1
        const _alto = alto + posicionY - 1

        (posicionX - 1 .. _ancho).forEach({
            posX => 
                (posicionY .. _alto).forEach({
                    posY => visuals.add(new Fondo(position = game.at(posX,posY)))
                })
        })
        */

        controles.activarControles(self)
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
        opcionActual.seleccionar(quienLoUsa)
        controles.desactivarControles()
    }
}

//Esto podria reemplazarse por una clase MenuBatalla que herede de Menu y ponerle el metodo x() e y() en vez de pasarle tipo de menu
object menuBatalla{
    method x() = 2
    method y() = 2
}

object menuMagia{
    method x() = 2
    method y() = 0
}
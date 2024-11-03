import assets.*
import UI_opciones.*
import personajes.*
import wollok.game.*
import archivoTest.*

//Agrupe todo lo que es User Interface en este archivo

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
        if(game.hasVisual(self)) game.removeVisual(self) 
        game.addVisual(self) 

        const x = opcionMenu.position().x()
        const y = opcionMenu.position().y()

        position = game.at(x - 2, y)
        //console.println("" + opcionMenu + "position: " + opcionMenu.position())
        //console.println("" + "cursor.position: " + self.position())
    }
}

class Fondo{
    method image() = imagenes.fondo()
    const property position
}



class Menu{
    const property opciones = []
    const visuals = []
    var property quienLoUsa = null// cambiar de nombre, variable para activar "quienLoUsa.Activar()"

    const alto = opciones.size() // va a tener de alto la cantidad de opciones
    const ancho = 3 //este 3 hay que probar como queda en otros menues

    var property opcionActual = opciones.first()

    method posicionX()//origen X
    method posicionY()//origen Y

    method renderizarMenu(){
        self.renderizarFondo()
        self.renderizarOpciones()

        //esta logica ponerla en otro metodo
        //visuals.add(cursor)
        //game.addVisual(cursor)
        cursor.moverCursor(opcionActual)
        controles.cambiarDeMenu(self)
    }

    method renderizarFondo(){ 
        //modificar este metodo para que renderice todo lo de una lista, y la logica de crearlo hcaerlo en otra lista
        //a si es mas facil de borrar despues
        
        const _ancho = ancho + self.posicionX() - 1
        const _alto = alto + self.posicionY() - 1

        (self.posicionX() - 1 .. _ancho).forEach({
            posX => 
                (self.posicionY() .. _alto).forEach({
                    posY => game.addVisual(new Fondo(position = game.at(posX,posY)))
                })
        })
        
    }

    method renderizarOpciones(){
        var offsetY = opciones.size() - 1
    
		opciones.forEach({opcion => 
            opcion.position(game.at(self.posicionX() + 1,self.posicionY() + offsetY ))
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
    }

    method quitarMenu(){
        //Este metodo tiene que remover TODOS los visuales que se renderizaron. Por lo tanto
        //hay que modificar el metodo renderizarOpciones, para que antes de renderizarlas, las guarde en una lista.
        //Y despues remover todos los visuales de esta lista.
    }

    method volverMenuAnterior(){
        //primero ejecutar self.quitarMenu()
        //y despues el cursor tiene que ir al menur anterior. Habria que guardar una referencia al menu y opcion anterior.
    }
}


class MenuBatalla inherits Menu{
    override method posicionX() = 2//origen X
    override method posicionY() = 2//origen Y

    const _opciones = [atacar,magia,items,escapar] //esto podria obtenerse del personaje, si queremos que tengan distintas opciones.

    method initialize(){
        opciones.addAll(_opciones)
    }
}

class SubMenuBatalla inherits Menu{
    override method posicionX() = 6
    override method posicionY() = magia.position().y()
}

class MenuItems inherits Menu{
    override method posicionX() = 6
    override method posicionY() = items.position().y()
}

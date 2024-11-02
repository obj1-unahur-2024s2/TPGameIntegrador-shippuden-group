import UI.*
import personajes.*
import wollok.game.*
import UI_opciones.*
import assets.*

object testObject{
    method iniciarPelea(){

        //instancio un nuevo menu.
        const menuPrueba = new Menu(opciones = [atacar,magia,items,escapar], tipoDeMenu = menuBatalla)
        //utilizo la funcion renderizarOpciones() del menu para mostrarlo en pantalla
        menuPrueba.renderizarMenu()
        //game.addVisual(cursor)
        //cursor.moverCursor(menuPrueba.opcionActual())

        //esto tendria que estar en el menu despues.
        keyboard.up().onPressDo({ menuPrueba.moverAnteriorOpcion()})
		keyboard.down().onPressDo({ menuPrueba.moverSiguienteOpcion()})
        keyboard.enter().onPressDo({ menuPrueba.opcionActual().seleccionar()})
    }
}

object fondoMenuPelea{
    var property position = game.at(0,0)
    method image() = imagenes.fondoMenu()
    //method text() = "Hola"
}
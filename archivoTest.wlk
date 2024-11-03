import UI.*
//import personajes.*
import wollok.game.*
import UI_opciones.*
import assets.*
import items.*


object testObject{
    method iniciarPelea(){

        party.seleccionarAccion()
    }
}

object controles{

    var menuActual = null

    method cambiarDeMenu(menu){
        menuActual = menu
    }

    method activarControles(){
        keyboard.up().onPressDo({self._moverAnteriorOpcion()})
        keyboard.down().onPressDo({ self._moverSiguienteOpcion()})
        keyboard.enter().onPressDo({ self._seleccionarOpcionActual()})
        keyboard.backspace().onPressDo({ self._volverMenuAnterior()})
    }

    method _moverAnteriorOpcion(){
        if(menuActual != null){
            menuActual.moverAnteriorOpcion()
        }else{
            return
        }
        
    }

    method _moverSiguienteOpcion(){
        if(menuActual != null){
            menuActual.moverSiguienteOpcion()
        }else{
            return
        }
        
    }
    
    method _seleccionarOpcionActual(){
        if(menuActual != null){
            menuActual.seleccionarOpcionActual()
        }else{
            return
        }
        
    }

    method _volverMenuAnterior(){
        if(menuActual != null){
            menuActual.volverMenuAnterior()
        }else{
            return
        }
        
    }
    
}

object party{
    const miembros = [playerPrueba]
    const property inventario = []
    //const menuPelea = new MenuBatalla(opciones = [atacar,magia,items,escapar])
    const menuPelea = new MenuBatalla()

    method seleccionarAccion(){
        if(self.hayPersonajeDisponible()){
            menuPelea.quienLoUsa(self.primerPersonajeDisponible())
            menuPelea.renderizarMenu()
        }
    }

    method hayPersonajeDisponible(){
        return true //aca habria que ver que haya justamente al menos un personaje disponible.
    }

    method primerPersonajeDisponible(){
        //la idea seria que elija el primero que este "sin cooldown", mientras tanto voy a usar first()
        return miembros.first()
    }
}
object playerPrueba{
    const property magias = [fuegoI,hieloI]
    method atacar() {
        //este metodo tendria que llamar a algo como "self.seleccionarEnemigo" y ejecutar todo lo que tiene que hacer al atacar
        //Ejecutar la animacion, dañar el enemigo etc.
        console.println("accion atacar")
    }

}


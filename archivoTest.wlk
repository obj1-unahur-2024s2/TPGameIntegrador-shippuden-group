import UI.*
//import personajes.*
import wollok.game.*
import UI_opciones.*
import assets.*

object testObject{
    method iniciarPelea(){

        party.seleccionarAccion()
    }
}

object party{
    const miembros = [playerPrueba]
    const menuPelea = new Menu(opciones = [atacar,magia,items,escapar], tipoDeMenu = menuBatalla)

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
    method atacar() {
        //este metodo tendria que llamar a algo como "self.seleccionarEnemigo" y ejecutar todo lo que tiene que hacer al atacar
        //Ejecutar la animacion, dañar el enemigo etc.
        console.println("accion atacar")
    }
}

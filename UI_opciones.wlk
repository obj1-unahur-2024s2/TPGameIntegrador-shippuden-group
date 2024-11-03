import assets.*
import UI.*

//No se me ocurrio como hacerlo mejor. Dejo esto para los items, quizas sirva.
class Opcion{
    const property nombre //ponerle un nombre a mostrar
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = nombre
    method seleccionar(personaje)
}

//-------------------------------opciones del Menu de batalla-------------------------------

object atacar{
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Atacar"

    method seleccionar(personaje){
        personaje.atacar()
    }
}

object magia{
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Magia"
    const menuMagia = new MenuMagia()

    method seleccionar(personaje){
        //mejorar este metodo
        menuMagia.quienLoUsa(personaje)
        menuMagia.opciones().addAll(personaje.magias())
        menuMagia.renderizarMenu()
        //console.println(personaje.magias())
    }
}

object items{
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Items"

    method seleccionar(personaje){
        console.println("ejecutar menuItems de la party")
    }
}

object escapar{
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Escapar"

    method seleccionar(personaje){
        console.println("Este esta para nada, no se si vamos a llegar a tener otra pelea")
    }
}

//-------------------------------opciones del Menu de magias-------------------------------

object fuegoI{
    //ver como calculamos el daño
    const costo = 5
    const danioBase = 5
    const elemento = "fuego" //no creo que lleguemos a hacer algo con esto pero lo agrego igual

    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Fuego I"

    method seleccionar(personaje){
        console.println("Lanzar :"+ self.text())
    }
}

object hieloI{
    //ver como calculamos el daño
    const costo = 5
    const danioBase = 5
    const elemento = "hielo" //no creo que lleguemos a hacer algo con esto pero lo agrego igual

    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Hielo I"

    method seleccionar(personaje){
        console.println("Lanzar :"+ self.text())
    }
}
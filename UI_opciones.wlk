import assets.*
import UI.*
import archivoTest.*
import items.*

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

//Este es un paso a paso de como crar un nuevo Menu y usarlo.
//Primero instanciar un menu del tipo requerido. Actualmente esta creado MenuBatalla y SubMenuBatalla
//En caso de requerir otro habria que crear otro heredandolo. 
//Ejemplo creo SubMenuBatalla que SOLO crea un menu pero con otro origen, en este caso use la siguiente linea
/*
class SubMenuBatalla inherits Menu{
    override method posicionX() = 6
    override method posicionY() = magia.position().y()
}*/
//Para poder decirle que se cree desde la posicion X = 6 y la posicion Y desde la posicion Y desde la opcion Magia.
//Como no se me ocurrio otra forma de vincularlo con el personaje, el menu tiene una variable llamada "quienLoUsa"
//A si a la hora de ejecutar por ejemplo la opcion "atacar" esta ejectura quienLoUsa.atacar()
//Por otro lado, todas las opciones renderiza el Menu, son todos los objetos que estan dentro de la lista opciones
//Por eso aca, hago menuMagia.Opciones y le agrego todas las magias que posee el personaje.
//Este personaje de ejemplo, tiene Magia Fuego y Magia Hielo, que son las que se muestran. Si tuviera menos o mas, se mostrarian mas.
//Por ultimo, estando todo configurado el Menu, llamo a renderizarMenu. Esto trae el cursor, y toda su funcionalidad.

object magia{
    var property position = game.at(1,1)
    method textColor() = paleta.blanco()
    method text() = "Magia"
    const menuMagia = new SubMenuBatalla()

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
    const menuItems = new MenuItems()

    method seleccionar(personaje){
        if(party.inventario().isEmpty()){
            console.println("TODO: Enviar un sonido o hacer algo, pero que no muestre un menu vacio, o ver que hacemos.")
        }else{
            self.ejecutarSeleccion()
        }
    }

    method ejecutarSeleccion(){
        menuItems.quienLoUsa(menuItems)
        menuItems.opciones().addAll(party.inventario())
        menuItems.renderizarMenu()
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
import assets.*

object atacar{
    var property position = game.at(1,1)
    
    //method image() = imagenes.atacar()
    method text() = "Atacar"
    method textColor() = paleta.blanco()

    method seleccionar(personaje){
        personaje.atacar()
    }
}

object magia{
    var property position = game.at(1,1)
    
    //method image() = imagenes.magia()
    method text() = "Magia"
    method textColor() = paleta.blanco()

    method seleccionar(personaje){
        personaje.magia()
    }
}

object items{
    var property position = game.at(1,1)

    //method image() = imagenes.items()
    method text() = "Items"
    method textColor() = paleta.blanco()

    //ver si uso los items de la party
    method seleccionar(personaje){
        console.println(self)
    }    
}

object escapar{
    var property position = game.at(1,1)
    
    //method image() = imagenes.huir()
    method text() = "Escapar"
    method textColor() = paleta.blanco()

    method seleccionar(personaje){
        console.println(self)
    }    
}

object enemigo{
    var property position = game.at(1,1)
    method text() = "Enemigo"
    method textColor() = paleta.blanco()
    method seleccionar(){
        return "enemigo 1"
    }
}
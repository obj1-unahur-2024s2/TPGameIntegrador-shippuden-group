class Item{
    var property efecto = "efecto por defecto"
    var property cantidad = 1
    var property descripcion = "descripcion por defecto"
    var property user = "none"
    const property image = ''
    const nombre
    method position(a) = game.at(1, 1) // una posicion cualquiera, ya que es obligatorio
    method usarEfecto(target)
    method text() = nombre
    method esConsumible() = false
}

class Arma inherits Item{
    var property multiplier 
    override method usarEfecto(target){ 
        user.ataque(user.ataque() * self.multiplier() )
    }
}

class Escudo inherits Item{
    var property multiplier 
    override method usarEfecto(target){ 
        user.defensa(user.defensa() * self.multiplier() )
    }
}

class Consumable inherits Item{
    override method esConsumible() = true
}

class Pocion inherits Consumable{
    var property porcentajeRecuperacion
    
    override method usarEfecto(target){
        user.vida(user.vida() * self.porcentajeRecuperacion())
    } 
}
class Item{
    var property efecto
    var property cantidad
    var property descripcion
    var user
    method image() = ''
    method usarEfecto(target){
        
    }

}

class Espada inherits Item{
    const property nombre
    var property multiplier 
    
    override method image() = 'sword.png'
    override method usarEfecto(target){ 
        user.ataque() = user.ataque() * self.multiplier() 
    }
}

class Escudo inherits Item{
    const property nombre
    var property multiplier 
    
    override method image() = 'shield.png'
    override method usarEfecto(target){ 
        user.defensa() = user.defensa() * self.multiplier() 
    }
}
class Pocion inherits Item{
    const property nombre 
    var property porcentajeRecuperacion
    
    override method image() = 'potion.png'
    override method usarEfecto(target){
        user.vida() = user.vida() * self.porcentajeRecuperacion()
    } 
}
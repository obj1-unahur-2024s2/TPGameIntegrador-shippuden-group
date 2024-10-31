import wollok.game.*



class Personaje {

    var ataque
    var vida
    var defensa
    var position 
    

    
  
   
    method image() = ""
    method position() = position

    method recibirDanio(unEnemigo) {
        vida = 0.max(vida - (unEnemigo.ataque()-defensa))
    }

    

    method atacarEnemigo(unEnemigo) {
        unEnemigo.recibirDanio(unEnemigo)
    }

    method ataque() = ataque
    method defensa() = defensa  
    method vida() = vida 
}

class Player inherits Personaje {
    const property nombre 

    override method image() = "player.png" 

}


class Jefe inherits Player{

    override method image() = "dragon.png" 



}

const jefe = new Jefe(ataque=8,defensa=6,vida=100,nombre="Dragon DelAuraNegra", position = game.at(9, 2))

const player = new Player (ataque=8,defensa=6,vida=100,nombre="auron", position =game.at(4, 2))

const player2 = new Player (ataque=8,defensa=6,vida=100,nombre="auron", position =game.at(4, 1))

const player3 = new Player (ataque=8,defensa=6,vida=100,nombre="auron", position =game.at(5, 1.5))


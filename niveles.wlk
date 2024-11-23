import wollok.game.*
import escenario.*
import enemigo.*
import config.*

object nivel1 inherits Escenario(posicionInicial = game.at(1,7)){

    override method siguienteNivel() = nivel2

    override method cargarBloques(){
        
        visuals.add(new Bloque(position = game.at(1,2)))
        visuals.add(new Bloque(position = game.at(1,3)))
        visuals.add(new Bloque(position = game.at(1,6)))
        visuals.add(new Bloque(position = game.at(3,2)))
        visuals.add(new Bloque(position = game.at(3,6)))
        visuals.add(new Bloque(position = game.at(4,1)))
        visuals.add(new Bloque(position = game.at(4,7)))
        visuals.add(new Bloque(position = game.at(5,1)))
        visuals.add(new Bloque(position = game.at(5,4)))
        visuals.add(new Bloque(position = game.at(5,5)))
        visuals.add(new Bloque(position = game.at(7,4)))
        visuals.add(new Bloque(position = game.at(7,7)))
        visuals.add(new Bloque(position = game.at(8,7)))
        visuals.add(new Bloque(position = game.at(9,5)))
        visuals.add(new Bloque(position = game.at(9,6)))
        visuals.add(new Bloque(position = game.at(10,1)))
        visuals.add(new Bloque(position = game.at(10,5)))
        visuals.add(new Bloque(position = game.at(11,2)))
        visuals.add(new Bloque(position = game.at(11,4)))
        visuals.add(new Bloque(position = game.at(12,1)))
        visuals.add(new Bloque(position = game.at(13,1)))
        visuals.add(new Bloque(position = game.at(13,2)))
        visuals.add(new Bloque(position = game.at(13,4)))
        visuals.add(new Bloque(position = game.at(13,7)))
    }

    //  quizas podria haber creado nuevas posiciones y haer un forEach agregndo new enemigo posicion en visuals pero me parecio muy simmilar como quedaba.
    override method cargarEnemigos(){
        visualsEnemigos.add(new Valcom(position = game.at(11,5)))
        visualsEnemigos.add(new Valcom(position = game.at(2,1)))
        visualsEnemigos.add(new Valcom(position = game.at(5,3)))
        visualsEnemigos.add(new Valcom(position = game.at(9,7)))
        visualsEnemigos.add(new Valcom(position = game.at(11,1)))
    }
}

object nivel2 inherits Escenario(posicionInicial = game.at(1,7)){

    override method siguienteNivel() = pantallaGanaste

    override method cargarBloques(){
        
        visuals.add(new Bloque(position = game.at(1,2)))
        visuals.add(new Bloque(position = game.at(1,3)))
        visuals.add(new Bloque(position = game.at(1,6)))
        visuals.add(new Bloque(position = game.at(3,2)))
        visuals.add(new Bloque(position = game.at(3,6)))
        visuals.add(new Bloque(position = game.at(4,1)))
        visuals.add(new Bloque(position = game.at(4,7)))
        visuals.add(new Bloque(position = game.at(5,1)))
        visuals.add(new Bloque(position = game.at(5,4)))
        visuals.add(new Bloque(position = game.at(5,5)))
        visuals.add(new Bloque(position = game.at(7,4)))
        visuals.add(new Bloque(position = game.at(7,7)))
        visuals.add(new Bloque(position = game.at(8,7)))
        visuals.add(new Bloque(position = game.at(9,5)))
        visuals.add(new Bloque(position = game.at(9,6)))
        visuals.add(new Bloque(position = game.at(10,1)))
        visuals.add(new Bloque(position = game.at(10,5)))
        visuals.add(new Bloque(position = game.at(11,2)))
        visuals.add(new Bloque(position = game.at(11,4)))
        visuals.add(new Bloque(position = game.at(12,1)))
        visuals.add(new Bloque(position = game.at(13,1)))
        visuals.add(new Bloque(position = game.at(13,2)))
        visuals.add(new Bloque(position = game.at(13,4)))
        visuals.add(new Bloque(position = game.at(13,7)))
    }

    override method cargarEnemigos(){
        visualsEnemigos.add(new Fantasma(position = game.at(11,5)))
        visualsEnemigos.add(new Valcom(position = game.at(2,1)))
        visualsEnemigos.add(new Valcom(position = game.at(5,3)))
        visualsEnemigos.add(new Valcom(position = game.at(9,7)))
        visualsEnemigos.add(new Fantasma(position = game.at(11,1)))
    }
}

object pantallaGanaste{

    method cargar(){
        game.addVisual(pantallaFinal)
    }
}

object pantallaFinal{
    method position() = game.origin()
    method image() = "fin.png"
}

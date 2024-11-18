import wollok.game.*
import escenario.*

object nivel1 inherits Escenario{
    override method cargarBloques(){
        visuals.add(new Bloque(position = game.center()))
    }
}
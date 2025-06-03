class Plaga {
    var poblacion
     method transmitirEnfermedades() = poblacion >= 10 && self.condicionalAdicional()
     method condicionalAdicional() = true
     method danio() = poblacion
     method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.1
     }
    method atacar(unElemento) {
        unElemento.esAtacadoPor(self)
        self.efectoDeAtacar()
    }
}


class Cucarachas inherits Plaga {
  var pesoPromedioBicho
  override method danio() = super() / 2
  override method condicionalAdicional() = pesoPromedioBicho >= 10
  override method efectoDeAtacar() { super() pesoPromedioBicho =
   pesoPromedioBicho + 2
  }
}

class Pulgas inherits Plaga{
    override method danio() = super() * 2
}

class Garrapatas inherits Pulgas{
    override method efectoDeAtacar() {
        poblacion = poblacion + poblacion * 0.2
    }
}

class Mosquitos inherits Plaga {
    override method condicionalAdicional() =  poblacion % 3 == 0 
}

import plagas.*
class Hogar {
  var mugre 
  const confort
  method mugre() = mugre
  method esBueno() = confort >= mugre / 2
  method esAtacadoPor(unaPlaga) {mugre += unaPlaga.danio()}
}

class Huerta {
  var produccion 
  method produccion() = produccion
  method esBueno() = produccion > nivelMinimoProduccion.valor()
  method esAtacadoPor(unaPlaga) {
    produccion -= 0.max((unaPlaga.danio() * 0.1 + if(unaPlaga.transmitirEnfermedades()) 10 else 0))
  }
 
  }

class Mascota {
  var salud
  method salud() = salud
  method esBueno() = salud >= 250
  method esAtacadoPor(unaPlaga) = if(unaPlaga.transmitirEnfermedades()) salud -= unaPlaga.danio() 
}

class Barrio {
  const elementos = []
  method agregarElemento(unElemento) = elementos.add(unElemento)
  method quitarElemento(unElemento) = elementos.remove(unElemento)
  method esBueno(unElemento) = unElemento.esBueno()
  method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
  method cantElementosBuenos() = elementos.count({e => e.esBueno()})
  method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}

object nivelMinimoProduccion {
  var property valor = 100
}

// const cucas1 = new Cucarachas(pesoPromedioBicho=8, poblacion=20)

// const mascota1 = new Mascota(salud=200)
// const barrio1 = new Barrio()
// barrio1.agregarElemento(mascota1)
//const pulga1 = new Pulgas(poblacion=10)
// mascota1.esAtacadoPor(pulga1)

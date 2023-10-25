object cosmeFulanito {

	const planContratado = planBasico

	const cosasVistas = []
	const preferencias = #{"Acción", "Aventuras"}
	
	method puedeVer(contenido) = planContratado.perteneceAPlan(contenido)

	method ver(contenido) {
		if (self.puedeVer(contenido)) {
			cosasVistas.add(contenido)
		}
	}	
		
	method valoracion() {
	
		if (cosasVistas.size() == 0) {return 0}
	
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
	
		return sumValoracion / cosasVistas.size()
	}	
 
	method preferencias() {return preferencias}
	method preferencias (genero) {preferencias.add(genero)}
	
	method veria(contenido) {
		return contenido.esRecomendadoA(self)
	}
		
}

object margoZavala {
	
	const planContratado = planPremium
	const cosasVistas = []
	var property desvio = 0.15
	
	method puedeVer(contenido) = planContratado.perteneceAPlan(contenido)
	
	method ver(contenido) {
		if (self.puedeVer(contenido)) {
			cosasVistas.add(contenido)
		}
	}
	
	method cosasVistas(){return cosasVistas}

	method valoracion() {
	
		if (cosasVistas.size() == 0) {return 0}
	
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
	
		return sumValoracion / cosasVistas.size()
	}
	 
	 method veria(contenido){
	 	if (self.valoracion()==0){
	 		return true
		} else{		
			return contenido.valoracion().between(self.valoracion() * ( 1 - desvio), self.valoracion() * ( 1 + desvio) )
		}
	 }
	 
}

object blackSails {
	
	const property tipo = "Serie"
	const temporadas = 4
	const capitulos = 8
	const property generos = #{"Acción"}
	
	method perteneceAPlanBasico() = true
	method valoracion() = temporadas * capitulos
	
	method esRecomendadoA(persona){
		 return  persona.preferencias().filter { n => self.generos().contains(n)} == self.generos()
		}
}

object avengersEndgame {
	
	const property tipo = "Película"
	const property generos = #{"Acción", "Drama", "Aventuras"}
	
	method perteneceAPlanBasico() = true
	method valoracion() = generos.size() * 12
	method esRecomendadoA(persona){
		return !((persona.preferencias().intersection(generos)) == #{})
	}
}

object seanEternos {
	
	const property tipo = "Documental"
	const property generos = #{"Documental"}
	
	method perteneceAPlanBasico() = false
	method valoracion() = 100
	method esRecomendadoA(persona){
		return persona.preferencias().contains("Documental")
	}
}

object planBasico{
	method perteneceAPlan(contenido){return contenido.perteneceAPlanBasico() }
}
object planPremium{
	method perteneceAPlan(contenido) = true
}





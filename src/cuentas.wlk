import contenidos.*

object cosmeFulanito {

	const planContratado = planBasico
	const property cosasVistas = []
	const property preferencias = #{"Acción", "Aventuras"}
	
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
	method preferencias (genero) {preferencias.add(genero)}	
	method veria(contenido) {
		return contenido.esRecomendadoA(self)
	}		
}

object margoZavala {
	
	const planContratado = planPremium
	const property cosasVistas = []
	var property desvio = 0.15
	
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
	 method veria(contenido){
	 	if (self.valoracion()==0){
	 		return true
		} else{		
			return contenido.valoracion().between(self.valoracion() * ( 1 - desvio), self.valoracion() * ( 1 + desvio) )
		}
	 }
}

object planBasico{
	method perteneceAPlan(contenido){return contenido.perteneceAPlanBasico() }
}
object planPremium{
	method perteneceAPlan(contenido) = true
}





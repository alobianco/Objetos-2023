import contenidos.*

class Cuenta{
	var property planContratado = planBasico
	var property perfiles = []
	method agregarPerfil(cuenta){
		perfiles.add(cuenta)
		self.planesEnPerfiles()
	}
	method planesEnPerfiles(){
		perfiles.forEach{perfil => perfil.planContratado(planContratado) }
	}
	
}

class Perfil inherits Cuenta{
	
	var property desvio = 0
	var property preferencias = #{}
	var property actoresFavoritos = #{}
	var property recomendador = preferenciaDeGenero
	var property cosasVistas = #{}
	const property nombrePerfil = ""
	const property valoracion = 0
	
	method puedeVer(contenido) = planContratado.perteneceAPlan(contenido)
	
	method ver(contenido){
		if(self.puedeVer(contenido)){
			cosasVistas.add(contenido)
		}
	}
	method valoracion() {
		if (cosasVistas.size() == 0) {return 0}
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
		return sumValoracion / cosasVistas.size()
	}
	
	method esVariado(){
		return recomendador.esVariado(preferencias)
	}
	
	method seRecomienda(contenido){
		if(self.valoracion()==0){
			return true
		}
		else{
			return recomendador.algoritmoElegido(contenido, self)
			
		}
	}
}


object valoracionSimilar{
	
	method esVariado(preferencias) = false
	method algoritmoElegido(contenido, usuario){
		return contenido.valoracion().between(usuario.valoracion() * ( 1 - usuario.desvio()), usuario.valoracion() * ( 1 + usuario.desvio()) )
	}

}

object preferenciaDeGenero{
	method esVariado(preferencias){
		return preferencias.size() >= 5
	}
	method algoritmoElegido(contenido, usuario){
		return usuario.preferencias().intersection(contenido.generos()) != #{} 
	}
}

object modoFan{

	method esVariado(preferencias) = true
	method algoritmoElegido(contenido, usuario){
		return contenido.reparto().filter { n => usuario.actoresFavoritos().contains(n)} != #{}
	}
}


object planBasico{
	method perteneceAPlan(contenido){return contenido.perteneceAPlanBasico() }
}
object planPremium{
	method perteneceAPlan(contenido) = true
}

import contenidos.*

class Cuenta{
	var property planContratado = planBasico
	var property perfiles = []
	var property desvio = 0.15
	method agregarPerfil(cuenta){
		perfiles.add(cuenta)
	}
}


/* */
class Perfil{
//-------------------------------Constantes y Variables-------------------------------//
	const property perteneceACuenta = cuentaMargo
	const property nombrePerfil = ""
	var property recomendador = preferenciaDeGenero
	var property cosasVistas = #{}
	var property valoracion = 0
//-------------------------------Methods-------------------------------//
	method puedeVer(contenido) {return perteneceACuenta.planContratado().perteneceAPlan(contenido)}
	method ver(contenido){
		if(self.puedeVer(contenido)){
			cosasVistas.add(contenido)
		}
	}
	method valoracion() {
		if (cosasVistas.size() == 0) {return 0}
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
		valoracion = sumValoracion / cosasVistas.size()
		return valoracion
	}
	
	method esVariado(){
		return recomendador.esVariado()
	}
	method seRecomienda(contenido){
		return recomendador.algoritmoElegido(contenido, self)
	}
}


object valoracionSimilar{
	var property preferencias = #{}
	var property actoresFavoritos = #{}
	method esVariado() = false
	method algoritmoElegido(contenido, usuario){
		if((usuario.valoracion()==0)||(usuario.cosasVistas().contains(contenido))){
			return true
		}
		else{
			 return contenido.valoracion().between(usuario.valoracion() * ( 1 - usuario.perteneceACuenta().desvio()), usuario.valoracion() * ( 1 + usuario.perteneceACuenta().desvio()) )
			 }	 
		}

}

// Las configuraciones de preferencias se hacen al recomendador, no al usuario

object preferenciaDeGenero{
	var property preferencias = #{}
	var property actoresFavoritos = #{}
	method esVariado(){
		return preferencias.size() >= 5
	}
	method algoritmoElegido(contenido, usuario){
		if(usuario.cosasVistas().contains(contenido)){
			return false
		}
		else{
			return preferencias.intersection(contenido.generos()) != #{}
		} 
	}
}

object modoFan{
	var property preferencias = #{}
	var property actoresFavoritos = #{}
	method esVariado() = true
	method algoritmoElegido(contenido, usuario){
		if(usuario.cosasVistas().contains(contenido)){
			return false
		}
		else{
		return contenido.reparto().filter { n => actoresFavoritos.contains(n)} != #{}
		}
	}
}


object planBasico{
	method perteneceAPlan(contenido){return contenido.perteneceAPlanBasico() }
}
object planPremium{
	method perteneceAPlan(contenido) = true
}
	
const cuentaMargo = new Cuenta(
	planContratado = planPremium,
	perfiles = []
)

const margoZavala = new Perfil(
	nombrePerfil = "Margo Zavala",
	recomendador = valoracionSimilar
)

const cosmeFulanito = new Perfil(
	nombrePerfil = "Cosme Fulanito",
	recomendador = preferenciaDeGenero
)
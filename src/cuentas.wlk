import contenidos.*

class Cuenta{
	var property planContratado = planBasico
	const property perfiles = []
	method agregarCuenta(cuenta){
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
	const property nombrePerfil = ""
	var property cosasVistas = []
	const property valoracion = 0
	var property recomendador = preferenciaDeGenero
	
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
	
}


object valoracionSimilar{

}

object preferenciaDeGenero{

}

object modoFan{


}

const cuentaMargo = new Cuenta(
	planContratado = planPremium,
	perfiles = [margoZavala]
)

const margoZavala = new Perfil(
	nombrePerfil = "Margo Zavala", 
	recomendador = valoracionSimilar
)

const cosmeFulanito = new Perfil(
	nombrePerfil = "Cosme Fulanito",
	preferencias = #{"Accion", "Aventuras", "Drama", "Comedia","a","b"},
	recomendador = preferenciaDeGenero
)

object planBasico{
	method perteneceAPlan(contenido){return contenido.perteneceAPlanBasico() }
}
object planPremium{
	method perteneceAPlan(contenido) = true
}

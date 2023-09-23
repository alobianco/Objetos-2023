object cosmeFulanito {

	const planContratado = planBasico

	var cosasVistas = []	
	
	//1.Saber si Cosme puede ver una serie o película de acuerdo al plan que tiene
	method puedeVer(contenido) = planContratado.puedeVer(contenido)

	//2. Hacer que Cosme Fulanito pueda ver un contenido
	method ver(contenido) {
		if (self.puedeVer(contenido)) {
			cosasVistas.add(contenido)
		}
	}	
}

object margoZavala {
	
	const planContratado = planPremium
	
	var cosasVistas = []
	
}


object blackSails {
	
	const tipo = "Serie"
	const temporadas = 4
	const capitulos = 8
	const generos = #{"Acción"}	
	
	method valoracion() = temporadas * capitulos

}

object avengersEndgame {
	
	const tipo = "Película"
	const generos = #{"Acción", "Drama", "Aventuras"}
	
	method valoracion() = generos.size() * 12
	
}

object seanEternos {
	
	const tipo = "Documental"
	
	method valoracion() = 100
	
}

object planBasico {
	
	method puedeVer(contenido) = contenido == blackSails || contenido == avengersEndgame

}

object planPremium {

	method puedeVer(contenido) = true

}





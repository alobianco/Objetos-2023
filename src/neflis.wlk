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
		
	/*3.Conocer la valoración del usuario, que está dada por 
	el promedio de las valoraciones de las cosas que ya vió.*/	
	method valoracion() {
	
		//Prevengo división por cero
		if (cosasVistas.size() == 0) {return 0}
	
		// Sumarizo la valorizacion de cada contenido visto
		var sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
	
		// Calculo el promedio
		return sumValoracion / cosasVistas.size()
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





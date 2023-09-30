object cosmeFulanito {

	const planContratado = planBasico

	const cosasVistas = []
	const preferencias = #{"Acción", "Aventuras"}
	
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
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
	
		// Calculo el promedio
		return sumValoracion / cosasVistas.size()
	}
	
	/*
	  Cosme en cambio, prefiere, por el momento, 
	  * ver contenidos que tegan géneros de Acción o Aventuras.		   
	  
	  Tener en cuenta que esto depende de cada tipo de contenido:
		Película: la intersección no debe ser vacía.
		Serie: debe contener el género de dicha serie
		Documental: debe incluir “Documental” 	
	  }*/			  
	 	 
	method preferencias() {return preferencias}
	method preferencias (genero) {preferencias.add(genero)}
	
	method veria(contenido) {
		const tipoContenido = contenido.tipo()
		const generosContenido = contenido.generos()
				
		if (tipoContenido == "Película" || tipoContenido == "Serie") 
		{
			return generosContenido.any ({ genero => preferencias.contains(genero) })
		} else if (tipoContenido == "Documental") {
			return generosContenido.contains("Documental") && generosContenido.any ({ genero => preferencias.contains(genero) })
		} else {
			return false
		}
	}
		
}

object margoZavala {
	
	const planContratado = planPremium
	const cosasVistas = []
	var property desvio 
	
	//Polimorfismo misma interfaz que Cosme, agregado para la prueba
	method puedeVer(contenido) = planContratado.puedeVer(contenido)
	
	method ver(contenido) {
		if (self.puedeVer(contenido)) {
			cosasVistas.add(contenido)
		}
	}
	
	method cosasVistas(){return cosasVistas}

	method valoracion() {
	
		//Prevengo división por cero
		if (cosasVistas.size() == 0) {return 0}
	
		// Sumarizo la valorizacion de cada contenido visto
		const sumValoracion = cosasVistas.map({ contenido => contenido.valoracion()}).sum()
	
		// Calculo el promedio
		return sumValoracion / cosasVistas.size()
	}
	
	
	/* 
	 * Recomendaciones
		Cada cuenta tiene una forma distinta de recomendar contenido.
		Lo que queremos determinar en este punto, es si una cuenta vería un contenido.		
		Margo prefiere ver contenidos que tienen una valoración similar a la suya. 
		La similitud actualmente está dada por un desvío del 15%, pero podría cambiar.
		En el caso de no haber visto ningún contenido (valoración igual a 0), todo contenido puede ser recomendado.
	 */
	 
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
	const property plan="Basico"
	
	method valoracion() = temporadas * capitulos
}

object avengersEndgame {
	
	const tipo = "Película"
	const property generos = #{"Acción", "Drama", "Aventuras"}
	const property plan="Basico"
	
	method valoracion() = generos.size() * 12
}

object seanEternos {
	
	const property tipo = "Documental"
	const property generos = #{"Documental"}
	const property plan= "Premium"
	
	method valoracion() = 100
}

object planBasico {
	
	method puedeVer(contenido) = contenido.plan() == "Basico"

}

object planPremium {

	method puedeVer(contenido) = true

}





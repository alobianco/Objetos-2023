import cuentas.*

class Contenido{
	const property generos = #{}
	const property reparto = #{}
	const property nombre
	const property perteneceAPlanBasico
}

class Pelicula inherits Contenido{
	const property duracion
	
	method valoracion() = generos.size() * 12
	
	method esRecomendadoA(perfil){
		return !((perfil.preferencias().intersection(generos)) == #{})
	}
}

class Serie inherits Contenido{
	//Nombre y generos en Contenido
	var property cantidadTemporadas = 0
	const property cantidadCapitulosPorTemporada
	
	method duracionSerie(capitulo) =
		capitulo.duracion()	
	method valoracion() = cantidadCapitulosPorTemporada*cantidadTemporadas
	method esRecomendadoA(perfil){
		return  perfil.preferencias().filter { n => self.generos().contains(n)} == self.generos()
	}
	
}
/*
const blackSails = new Serie(
	nombre = "Black Sails",
	generos = #{"Acción", "Aventuras", "Drama"},
	perteneceAPlanBasico = true,
	cantidadTemporadas = 4,
	cantidadCapitulosPorTemporada = 8
)
	
const seanEternos = new Serie(
	nombre = "Sean Eternos",
	generos = #{"Documental"},
	perteneceAPlanBasico = false,
	cantidadTemporadas = 1,
	cantidadCapitulosPorTemporada = 3
)

const avengersEndgame = new Pelicula(
	nombre = "Avengers Endgame", 
	generos = #{"Acción","Drama","Aventuras","Ciencia Ficción"}, 
	duracion = 182, 
	perteneceAPlanBasico = true
)
*/

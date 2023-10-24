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
	var property cantidadTemporadas = 0
	const property cantidadCapitulosPorTemporada
	
	method duracionSerie(capitulo) =
		capitulo.duracion()	
	method valoracion() = cantidadCapitulosPorTemporada*cantidadTemporadas
	method esRecomendadoA(perfil){
		return  perfil.preferencias().filter { n => self.generos().contains(n)} == self.generos()
	}
	
}

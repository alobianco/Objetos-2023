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
	
}

class Serie inherits Contenido{
	const property temporadas = #{}
	const property cantidadCapitulosPorTemporada
	
	method cantidadTemporadas() = temporadas.size()
	
	method valoracion() = cantidadCapitulosPorTemporada* self.cantidadTemporadas()

}

class Temporada{
	const property serie
	const property capitulos = []
	method duracion() = capitulos.sum({capitulo => capitulo.duracion()})
	method perteneceAPlanBasico() = serie.perteneceAPlanBasico()
}
class Capitulo{
	const property serie
	const property nombre
	const property duracion 
	method perteneceAPlanBasico() = serie.perteneceAPlanBasico()
}

//-------------------------------Catalogo-------------------------------//

//-----------------------------------------------------------------------//
//-------------------------------Peliculas-------------------------------//
//-----------------------------------------------------------------------//
const avengersEndgame = new Pelicula(
	nombre = "Avengers Endgame", 
	generos = #{"Acción","Drama", "Aventuras","Ciencia Ficción"}, 
	duracion = 182, 
	perteneceAPlanBasico = true,
	reparto = #{"Robert Downey Jr.", "Chris Evans", "Mark Ruffalo", "Chris Hemsworth", "Scarlett Johansson", "Jeremy", "Don Cheadle", "Paul Rudd", "Benedict Cumberbatch", "Chadwick Boseman", "Brie Larson", "Tom Holland", "Karen Gillan", "Zoe Saldana"}
)
	
const it = new Pelicula(
	nombre = "It",
	generos = #{"Terror"},
	duracion = 135,
	perteneceAPlanBasico = false,
	reparto = #{"Jaeden Martell", "Jeremy Ray Taylor", "Sophia Lillis", "Finn Wolfhard", "Chosen Jacobs"}
)

const eternoResplandor = new Pelicula(
	nombre = "El eterno resplandor de una mente sin recuerdos",
	generos = #{"Drama", "Romance", "Ciencia Ficción"},
	duracion = 108,
	perteneceAPlanBasico = true,
	reparto = #{"Jim Carrey", "Kate Winslet", "Gerry Robert Byrne", "Elijah Wood"}
)

const millenium2 = new Pelicula(
	nombre = "Millennium 2: La chica que soñaba con una cerilla y un bidón de gasolina",
	generos = #{"Acción", "Crimen", "Drama", "Misterio", "Suspenso"}, 
	duracion = 129,
	perteneceAPlanBasico = false,
	reparto = #{"Michael Nyqvist", "Noomi Rapace", "Lena Endre"}
)

const elementos = new Pelicula(
	nombre = "Elementos",
	generos = #{"Animación","Comedia","Fantansía"},
	duracion = 101,
	perteneceAPlanBasico = true,
	reparto = #{"Leah Lewis", "Mamoudou Athie", "Ronnie Del Carmen", "Shila Ommi"}
)


//--------------------------------------------------------------------//
//-------------------------------Series-------------------------------//
//--------------------------------------------------------------------//

const blackSails = new Serie(
	nombre = "Black Sails",
	generos = #{"Acción", "Aventuras", "Drama"},
	perteneceAPlanBasico = true,
	temporadas = #{blackSailsTemp1, blackSailsTemp2, blackSailsTemp3, blackSailsTemp4},
	cantidadCapitulosPorTemporada = 8,
	reparto = #{"Toby Stephens", "Luke Arnold", "Toby Schmitz", "Hannah New", "Jessica Parker Kennedy"}
)

const theWitcher = new Serie(
	nombre = "The Witcher",
	generos = #{"Acción","Fantasía","Drama","Misterio"},
	perteneceAPlanBasico = true,
	temporadas = #{theWitcherTemp1, theWitcherTemp2, theWitcherTemp3},
	cantidadCapitulosPorTemporada = 8,
	reparto = #{"Henry Cavill", "Freya Allan", "Anya Chalotra"}
)

const seanEternos = new Serie(
	nombre = "Sean Eternos",
	generos = #{"Documental"},
	perteneceAPlanBasico = false,
	temporadas = #{seanEternosTemp1},
	cantidadCapitulosPorTemporada = 3,
	reparto = #{"Lionel Messi", "Angel Di Maria", "Xavi Hernández", "Luis Suarez"}
)

const goodOmens = new Serie(
	nombre = "Good Omens",
	generos = #{"Fantasía", "Comedia", "Drama"},
	perteneceAPlanBasico = false,
	temporadas = #{goodOmensTemp1, goodOmensTemp2, goodOmensTemp3, goodOmensTemp4, goodOmensTemp5, goodOmensTemp6},
	cantidadCapitulosPorTemporada = 6,
	reparto = #{"David Tennant", "Michael Sheen"}
)

//--------------------------------------------------------------------//
//--------------------TEMPORADAS Y CAPITULOS--------------------------//
//--------------------------------------------------------------------//

const blackSailsTemp1 = new Temporada(serie = blackSails, capitulos = [new Capitulo(serie = blackSails, nombre = 1,duracion = 45), new Capitulo(serie = blackSails, nombre = 2,duracion = 45), new Capitulo(serie = blackSails, nombre = 3,duracion = 45), new Capitulo(serie = blackSails, nombre = 4,duracion = 45), new Capitulo(serie = blackSails, nombre = 5,duracion = 45), new Capitulo(serie = blackSails, nombre = 6,duracion = 45), new Capitulo(serie = blackSails, nombre = 7,duracion = 45), new Capitulo(serie = blackSails, nombre = 8,duracion = 45)])
const blackSailsTemp2 = new Temporada(serie = blackSails, capitulos = [new Capitulo(serie = blackSails, nombre = 1,duracion = 45), new Capitulo(serie = blackSails, nombre = 2,duracion = 45), new Capitulo(serie = blackSails, nombre = 3,duracion = 45), new Capitulo(serie = blackSails, nombre = 4,duracion = 45), new Capitulo(serie = blackSails, nombre = 5,duracion = 45), new Capitulo(serie = blackSails, nombre = 6,duracion = 45), new Capitulo(serie = blackSails, nombre = 7,duracion = 45), new Capitulo(serie = blackSails, nombre = 8,duracion = 45)])
const blackSailsTemp3 = new Temporada(serie = blackSails, capitulos = [new Capitulo(serie = blackSails, nombre = 1,duracion = 45), new Capitulo(serie = blackSails, nombre = 2,duracion = 45), new Capitulo(serie = blackSails, nombre = 3,duracion = 45), new Capitulo(serie = blackSails, nombre = 4,duracion = 45), new Capitulo(serie = blackSails, nombre = 5,duracion = 45), new Capitulo(serie = blackSails, nombre = 6,duracion = 45), new Capitulo(serie = blackSails, nombre = 7,duracion = 45), new Capitulo(serie = blackSails, nombre = 8,duracion = 45)])
const blackSailsTemp4 = new Temporada(serie = blackSails, capitulos = [new Capitulo(serie = blackSails, nombre = 1,duracion = 45), new Capitulo(serie = blackSails, nombre = 2,duracion = 45), new Capitulo(serie = blackSails, nombre = 3,duracion = 45), new Capitulo(serie = blackSails, nombre = 4,duracion = 45), new Capitulo(serie = blackSails, nombre = 5,duracion = 45), new Capitulo(serie = blackSails, nombre = 6,duracion = 45), new Capitulo(serie = blackSails, nombre = 7,duracion = 45), new Capitulo(serie = blackSails, nombre = 8,duracion = 45)])


const theWitcherTemp1 = new Temporada(serie = theWitcher, capitulos = [new Capitulo(serie = theWitcher, nombre = 1,duracion = 60), new Capitulo(serie = theWitcher, nombre = 2,duracion = 60), new Capitulo(serie = theWitcher, nombre = 3,duracion = 60), new Capitulo(serie = theWitcher, nombre = 4,duracion = 60), new Capitulo(serie = theWitcher, nombre = 5,duracion = 60), new Capitulo(serie = theWitcher, nombre = 6,duracion = 60), new Capitulo(serie = theWitcher, nombre = 7,duracion = 60), new Capitulo(serie = theWitcher, nombre = 8,duracion = 60)])
const theWitcherTemp2 = new Temporada(serie = theWitcher, capitulos = [new Capitulo(serie = theWitcher, nombre = 1,duracion = 60), new Capitulo(serie = theWitcher, nombre = 2,duracion = 60), new Capitulo(serie = theWitcher, nombre = 3,duracion = 60), new Capitulo(serie = theWitcher, nombre = 4,duracion = 60), new Capitulo(serie = theWitcher, nombre = 5,duracion = 60), new Capitulo(serie = theWitcher, nombre = 6,duracion = 60), new Capitulo(serie = theWitcher, nombre = 7,duracion = 60), new Capitulo(serie = theWitcher, nombre = 8,duracion = 60)])
const theWitcherTemp3 = new Temporada(serie = theWitcher, capitulos = [new Capitulo(serie = theWitcher, nombre = 1,duracion = 60), new Capitulo(serie = theWitcher, nombre = 2,duracion = 60), new Capitulo(serie = theWitcher, nombre = 3,duracion = 60), new Capitulo(serie = theWitcher, nombre = 4,duracion = 60), new Capitulo(serie = theWitcher, nombre = 5,duracion = 60), new Capitulo(serie = theWitcher, nombre = 6,duracion = 60), new Capitulo(serie = theWitcher, nombre = 7,duracion = 60), new Capitulo(serie = theWitcher, nombre = 8,duracion = 60)])

const seanEternosTemp1 = new Temporada(serie = seanEternos, capitulos = [new Capitulo(serie = seanEternos, nombre = 1,duracion = 50), new Capitulo(serie = seanEternos, nombre = 2,duracion = 50), new Capitulo(serie = seanEternos, nombre = 3,duracion = 50)])

const goodOmensTemp1 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])
const goodOmensTemp2 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])
const goodOmensTemp3 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])
const goodOmensTemp4 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])
const goodOmensTemp5 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])
const goodOmensTemp6 = new Temporada(serie = goodOmens, capitulos = [new Capitulo(serie = goodOmens, nombre = 1,duracion = 50), new Capitulo(serie = goodOmens, nombre = 2,duracion = 50), new Capitulo(serie = goodOmens, nombre = 3,duracion = 50), new Capitulo(serie = goodOmens, nombre = 4,duracion = 50), new Capitulo(serie = goodOmens, nombre = 5,duracion = 50), new Capitulo(serie = goodOmens, nombre = 6,duracion = 50)])






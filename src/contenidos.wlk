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
	var property cantidadTemporadas = 0
	const property cantidadCapitulosPorTemporada
	
	method valoracion() = cantidadCapitulosPorTemporada*cantidadTemporadas

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
	cantidadTemporadas = 4,
	cantidadCapitulosPorTemporada = 8,
	reparto = #{"Toby Stephens", "Luke Arnold", "Toby Schmitz", "Hannah New", "Jessica Parker Kennedy"}
)

const theWitcher = new Serie(
	nombre = "The Witcher",
	generos = #{"Acción","Fantasía","Drama","Misterio"},
	perteneceAPlanBasico = true,
	cantidadTemporadas = 3,
	cantidadCapitulosPorTemporada = 8,
	reparto = #{"Henry Cavill", "Freya Allan", "Anya Chalotra"}
)

const seanEternos = new Serie(
	nombre = "Sean Eternos",
	generos = #{"Documental"},
	perteneceAPlanBasico = false,
	cantidadTemporadas = 1,
	cantidadCapitulosPorTemporada = 3,
	reparto = #{"Lionel Messi", "Angel Di Maria", "Xavi Hernández", "Luis Suarez"}
)

const goodOmens = new Serie(
	nombre = "Good Omens",
	generos = #{"Fantasía", "Comedia", "Drama"},
	perteneceAPlanBasico = false,
	cantidadTemporadas = 6,
	cantidadCapitulosPorTemporada = 6,
	reparto = #{"David Tennant", "Michael Sheen"}
)
import mariano.*

class Golosina {

	var golosinaSeBanio = false

	method libreGluten() {
		return true
	}

}

class Bombon inherits Golosina {

	var property peso = 15

	method precio() {
		return 5
	}

	method mordisco() {
		peso = (peso * 0.8 - 1).max(0)
	}

	method gusto() {
		return "frutilla"
	}

}

class BombonDuro inherits Bombon {

	override method mordisco() {
		peso = (peso - 1).max(0)
	}

	method gradoDeDureza() = if (peso > 12) {
		3
	} else if (peso.between(8, 12)) {
		2
	} else {
		1
	}

}

/*
 * var bombon = new Bombon(peso=15) "genera Bombon con herencia en Golosina"
 * bombon.mordisco() 		  		 "mordisco a Bombon"
 * bombon.peso() 			 		 "peso = 11 a Bombon"
 * bombonDuro = new BombonDuro() 	 "genera BombonDuro con herencia de Bombon, que a su ves es Sub de Golosina"
 * bombonDuro.mordisco() 			 "mordisco a BombonDuro"
 * bombonDuro.peso() 			     "peso = 14 a BombonDuro"
 */
class Alfajor inherits Golosina {

	var property peso = 300

	method precio() {
		return 12
	}

	method mordisco() {
		peso = peso * 0.8
	}

	method gusto() {
		return "chocolate"
	}

	override method libreGluten() {
		return not super()
	}

}

class Caramelo inherits Golosina {

	var property peso = 5
	var property sabor

	method precio() {
		return 1
	}

	method mordisco() {
		peso = (peso - 1).max(0)
	}

	method gusto() {
		return sabor
	}

}

class CarameloConChoco inherits Caramelo {

	override method mordisco() {
		super()
		sabor = "chocolate"
	}

	override method peso() = super() + 1

}

/*
 * var caramelo = new Caramelo(sabor="frutilla") 			 "genera caramelo con herencia en Golosina"
 * caramelo.mordisco() 		  					 		 "mordisco a caramelo"
 * caramelo.peso() 			 						 	 "peso = 5 a caramelo"
 * caramelo.sabor() 			  							 "sabor= "frutilla"
 * carameloRelleno = new CarameloRelleno(sabor="frutilla")  "genera carameloRelleno con herencia de Caramelo, que a su ves es Sub de Golosina"
 * carameloRelleno.mordisco() 								 "mordisco a carameloRelleno"
 * carameloRelleno.peso() 									 "peso = 6 "
 * carameloRelleno.sabor()									 "sabor= "chocolate"
 */
class Chupetin inherits Golosina {

	var property peso = 7

	method precio() {
		return 2
	}

	method mordisco() {
		peso = (2).max(peso * 0.9)
	}

	method gusto() {
		return "naranja"
	}

}

class Oblea inherits Golosina {

	var property peso = 250

	method precio() {
		return 5
	}

	method mordisco() {
		if (peso > 70) peso *= 0.5 else peso *= 0.75
	}

	method gusto() {
		return "vainilla"
	}

	override method libreGluten() {
		return not super()
	}

}

class ObleaCrujiente inherits Oblea {

	var cantMordisco = 0

	override method mordisco() {
		super()
		if (cantMordisco < 3) {
			cantMordisco++
			peso - 3
		}
	}

}

class Chocolatin inherits Golosina {

	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var pesoInicial
	var comido

	/* al principio, el peso actual coincide con el inicial */
	method pesoInicial(cuanto) {
		pesoInicial = cuanto
	}

	method precio() {
		return 0.5 * pesoInicial
	}

	method peso() {
		return (pesoInicial - comido).max(0)
	}

	method mordisco() {
		comido += 2
	}

	method gusto() {
		return "chocolate"
	}

	override method libreGluten() {
		return not super()
	}

}

class ChocolatinVIP inherits Chocolatin {

	override method peso() = super() * (1 + self.humedad())

	method humedad() {
		return heladeraMariano.humedad()
	}

}

class ChocolatinPremium inherits ChocolatinVIP {

	override method humedad() {
		return super() / 2
	}

}

class GolosinaBaniada inherits Golosina {

	var property golosinaInterior
	var pesoBanio = 4

	method baniaA(unaGolosina) {
		if (not golosinaSeBanio) {
			golosinaInterior = unaGolosina
			golosinaSeBanio = true
		}
	}

	method precio() {
		return golosinaInterior.precio() + 2
	}

	method peso() {
		return golosinaInterior.peso() + pesoBanio
	}

	method mordisco() {
		golosinaInterior.mordisco()
			// if (pesoBanio > 0) { pesoBanio -= 2 }
		pesoBanio = (pesoBanio - 2).max(0)
	// otra forma de hacer la cuenta:  
	}

	method gusto() {
		return golosinaInterior.gusto()
	}

	override method libreGluten() {
		return golosinaInterior.libreGluten()
	}

}

class Tuttifrutti inherits Golosina {

	var property peso = 5
	var property libreGluten
	var gustoActual
	var mordiscoHecho = 2

	// como manejar el cambio de sabor ??
	method precio() {
		return if (libreGluten) 7 else 10
	}

	method mordisco() {
		/*const mordiscoHecho = mordisco
		 * if (mordiscoHecho == "frutilla"){
		 * 	mordisco = "chocolate"
		 * }
		 * if (mordiscoHecho == "chocolate"){
		 * 	mordisco = "naranja"
		 * }
		 * if (mordiscoHecho == "naranja"){
		 * 	mordisco = "frutilla"
		 }*/
		/*if(mordisco <= 2){
		 * 	    	mordisco +=1
		 * }
		 * if(mordisco == 3){
		 * 	mordisco = 0
		 }*/
		mordiscoHecho++
		gustoActual = [ "frutilla", "chocolate", "naranja" ].get(mordiscoHecho % 3)
	}

	method gusto() {
		return gustoActual
	}

}


import golosinas.*

object mariano {
	var bolsa = []
	var desechado = []
	// para este objeto no damos pistas
	// definimos algunos métodos para que compile el test
	method baniar(unaGolosina){
		bolsa.add(new GolosinaBaniada(golosinaInterior = unaGolosina))
	}
	method comprar(unaGolosina) {
		bolsa.add(unaGolosina)
	}
	method golosinas() {
		/* cambiar por la implementacion correcta */ 
		return bolsa
	}
	method desechadas(){
		return desechado
	}
	method desechar(unaGolosina){ 
		desechado.add(unaGolosina)
		bolsa.remove(unaGolosina)
	}
	method cantidadDeGolosinas(){return bolsa.size()}
	method tieneLaGolosina(unaGolosina){return bolsa.contains(unaGolosina)}
	method probarGolosinas(){
		bolsa.forEach({aProbar => aProbar.mordisco()})
	}
	method hayGolosinaSinTACC() {
		return bolsa.any({ conGluten => conGluten.libreGluten()})
	}
	method preciosCuidados(){
		return bolsa.all({esPrecioCuidado => esPrecioCuidado.precio() < 10})
	}
	method golosinaDeSabor(unSabor){
		return bolsa.find({tieneGusto => tieneGusto.gusto() == unSabor})
	}
	method golosinasDeSabor(unSabor){
		return bolsa.filter({tieneGusto => tieneGusto.gusto() == unSabor})
	}
	method sabores(){
		return bolsa.map({deGusto => deGusto.gusto()}).asSet()
	}
	method golosinaMasCara(){
		return bolsa.max({masCara => masCara.peso()})
	}
	method pesoGolosinas(){
		return bolsa.sum({pesoTotal => pesoTotal.peso()})
	}
	method golosinasFaltantes(golosinasDeseadas){
		return golosinasDeseadas.difference(bolsa.asSet())
	}
	method tiposDeGustosEnBolsa(){
		return bolsa.map({ gustosA => gustosA.gusto()}).asSet()
	}
	method gustosFaltantes(gustosDeseados){
		return gustosDeseados.difference(self.tiposDeGustosEnBolsa())
	}
	method gustosDe(sabor){
		return bolsa.filter({delSabor => delSabor.gusto() == sabor})
	}
	method gastoEn(sabor){
		return self.gustosDe(sabor).sum({suma => suma.peso()})		
	}
	method saborMasPopular(){
		return bolsa.map({gusto => gusto.gusto()}).max()
	}
	method saborMasPesado(){
		return bolsa.max({peso => peso.peso()})
	}
	method comproYDesecho(golosina){
		return desechado.contains(golosina)
	}
}

object heladeraMariano{
	var property humedad = 0.5
}

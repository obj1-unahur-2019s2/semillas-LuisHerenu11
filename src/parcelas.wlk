import semillas.*
class Parcela {
	var property ancho
	var property largo
	var property horasDeSol
	var property plantas = []
	var property cantidadDePlantasAsociadas = 0
	 
	method superficie(){
		return ancho * largo
	}
	method cantidadMaxima(){
		//DE PLANTAS QUE TOLERA.
		if(ancho > largo){
			return self.superficie() / 5
		}else{
			return self.superficie() / 3 + largo
		}
	}
	method tieneComplicaciones(){
		return plantas.any({planta => planta.cuantasHorasDeSolTolera() < self.horasDeSol()})
	}
	method plantar(unaPlanta){
		if(plantas.size() == self.cantidadMaxima() or (self.horasDeSol() >= (unaPlanta.cuantasHorasDeSolTolera() + 2))){
			self.error("no se puede plantar")
		}
		plantas.add(unaPlanta)
	}
	method seAsociaBien(unaPlanta)	
	
	method cantidadDePlantas(){
		return plantas.size()
	}
	method cantidadDePlantasQueSeAsocianBien(){
		return plantas.count({planta => planta.seAsociaBien()})
	}
	
}

class ParcelasEcologicas inherits Parcela{
	//que la parcela no tenga complicaciones y sea ideal para la planta;
	
	override method seAsociaBien(unaPlanta){
			return not self.tieneComplicaciones() and unaPlanta.esIdeal(self)
		}
	
	
}

class ParcelasIndustriales inherits Parcela{
	// que haya como máximo 2 plantas y que la planta en cuestión sea fuerte.
	
	override method seAsociaBien(unaPlanta){
			return plantas.size() <= 2 and unaPlanta.esFuerte()
		}
}



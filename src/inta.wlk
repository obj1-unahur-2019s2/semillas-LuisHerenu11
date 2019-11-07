import semillas.*
import parcelas.*

object inta {
	var property parcelas = []
	
	method promedioDePlantas(){
		// por parcela.
		
		return  self.sumaDePlantasEnParcela() / parcelas.size()
	}
	
	method sumaDePlantasEnParcela(){
		return parcelas.sum({parcela => parcela.cantidadDePlantas()})
	}
	method masAutosustentable(){
		// solo consideraremos aquellas parcelas con más de 4 plantas 
		//y elegiremos aquella que tenga mayor porcentaje de plantas "bien asociadas"
		
		return self.parcelasConMasDeCuatro().max({parcela => parcela.cantidadDePlantasQueSeAsocianBien()})
		
	}
		
	method parcelasConMasDeCuatro(){
		return parcelas.filter({parcela => parcela.cantidadDePlantas() > 4})
	}
}

import parcelas.*

class Planta{
	const property anioDeObtencion //num
	var property altura //num
	var property cuantasHorasDeSolTolera //num
	var property esFuerte //boolean
	var property daSemillas //boolean
	var property espacioQueOcupa //num
	
	method esFuerte(){
		return cuantasHorasDeSolTolera > 10
	}
	
	method daSemillas(){
		return self.esFuerte()
	}
	method esIdeal(unaParcela)
} 

class Menta inherits Planta{
	
	override method cuantasHorasDeSolTolera(){
		return 6
	}
	override method daSemillas(){
		return super() or self.condicionAdicional()
	}
	method condicionAdicional(){
		return altura > 0.4
	}
	override method espacioQueOcupa(){
		return altura * 3
	}
	override method esIdeal(unaParcela){
		return unaParcela.superficie() > 6
	}	
}

class Soja inherits Planta{
	override method cuantasHorasDeSolTolera(){
		if(altura < 0.5){
			return 6
		}else if(altura == 0.5 and altura < 1){
			return 7
		}else{
			return 9
		}
	}	
	override method daSemillas(){
		return super() or self.condicionAdicional()
	}
	method condicionAdicional(){
		return anioDeObtencion > 2007 and altura > 1
	}
	override method espacioQueOcupa(){
		return altura / 2
	}
	override method esIdeal(unaParcela){
		return unaParcela.horasDeSol() == self.cuantasHorasDeSolTolera()
	}
}

class Quinoa inherits Planta{
	override method cuantasHorasDeSolTolera(horas){
		cuantasHorasDeSolTolera = horas
	}
	override method espacioQueOcupa(){
		return 0.5
	}
	override method daSemillas(){
		return super() or self.condicionAdicional()
	}
	method condicionAdicional(){
		return anioDeObtencion < 2005
	}
	override method esIdeal(unaParcela){
		return not unaParcela.plantas().any({planta => planta.altura() > 1.5})
	}	
}

class SojaTransgenica inherits Soja{
	override method daSemillas(){
		return false
	}
	override method esIdeal(unaParcela){
		return unaParcela.cantidadMaxima() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa(){
		return super() * 2
	}	
}





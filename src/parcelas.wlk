import plantas.*

class Parcela{
	const property ancho
	const property largo
	const property horasDeSolPorDia
	var property plantasQueTiene = []
	
	
	method superficie() = ancho * largo
	
	method cantMaxDePlantasToleradas() = if(ancho > largo){self.superficie()/5}else{self.superficie()/3 + largo}
	
	method tieneComplicaciones() = plantasQueTiene.any({ p => p.horasDeSolToleradas() < horasDeSolPorDia })
	
	method plantar(unaPlanta){
		const cantPlantadas = plantasQueTiene.size()
		const diferenciaEntreSol = horasDeSolPorDia - unaPlanta.horasDeSolToleradas()
		
		if (cantPlantadas+1 > self.cantMaxDePlantasToleradas() or diferenciaEntreSol>=2){
			self.error("No se puede plantar")
		} else {
			plantasQueTiene.add(unaPlanta)
		}
	}
	
	method esIdealParaPlanta(unaPlanta) = unaPlanta.esParcelaIdeal(self)
	
	method seAsociaBien(unaPlanta)
	
	method porcentajePlantasAsociadas(){
		const cantPlantas = plantasQueTiene.size()
		
		return 100 * plantasQueTiene.count({ p => p.seAsociaBien(p) }) / cantPlantas
	}
}

class ParcelaEcologica inherits Parcela{
	
	override method seAsociaBien(unaPlanta){
		return not self.tieneComplicaciones() and self.esIdealParaPlanta(unaPlanta)
	}
}

class ParcelaIndustrial inherits Parcela{
	
	override method seAsociaBien(unaPlanta){
		return self.plantasQueTiene().size() <= 2 and unaPlanta.esFuerte()
	}
}


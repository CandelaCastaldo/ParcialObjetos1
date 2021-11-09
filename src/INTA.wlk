import parcelas.*

object inta{
	var property parcelas = #{}
	
	method promedioPlantas(){
		const cantPlantasTotal = parcelas.sum({ p => p.plantasQueTiene().size() })
		const cantParcelas = parcelas.size()
		
		return cantPlantasTotal / cantParcelas
	} 
	
	method parcelaMasAutosustentable(){
		const parcelasConsideradas = parcelas.filter({ p => p.plantasQueTiene().size() > 4 })
		
		return parcelasConsideradas.max({ p => p.porcentajePlantasAsociadas() })
	}
}

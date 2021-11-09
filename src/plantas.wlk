import parcelas.*

//Plantas

class Planta{
	const property anioObtencionSemilla
	var property altura //es variable porque supongo que un futuro podría crecer
	
	method horasDeSolToleradas()
	
	method esFuerte() = self.horasDeSolToleradas() > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacioQueOcupa()	
	
	method esParcelaIdeal(unaParcela)
	
	method seAsociaBien(unaParcela) = unaParcela.seAsociaBien(self)
}

class Menta inherits Planta{
	
	override method horasDeSolToleradas() = 6
	
	override method daNuevasSemillas() = super() or (altura > 0.4)
	
	override method espacioQueOcupa() = altura * 3	
	
	override method esParcelaIdeal(unaParcela) = unaParcela.superficie() > 6
}

class Soja inherits Planta{
	
	override method horasDeSolToleradas(){
		var horas = 0
		
		if (altura < 0.5){
			horas = 6
		} else if (altura.between(0.5,1)) {
			horas = 7
		} else {
			horas = 9
		}
		return horas
	}
	
	override method daNuevasSemillas() = super() or (anioObtencionSemilla > 2007 and altura > 1)
	
	override method espacioQueOcupa() = altura / 2	
	
	override method esParcelaIdeal(unaParcela) = unaParcela.horasDeSolPorDia() == self.horasDeSolToleradas()
}

class Quinoa inherits Planta{
	const horasDeSolToleradas
	
	override method horasDeSolToleradas() = horasDeSolToleradas
	
	override method daNuevasSemillas() = super() or (anioObtencionSemilla < 2005)
	
	override method espacioQueOcupa() = 0.5
	
	override method esParcelaIdeal(unaParcela){
		const plantasParcela = unaParcela.plantasQueTiene()
		
		return plantasParcela.any({ p => not (p.altura() > 1.5) })
	}
}

//Variedades

class SojaTransgenica inherits Soja{
	
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(unaParcela) = unaParcela.cantMaxDePlantasToleradas() == 1
}

class Hierbabuena inherits Menta{
	
	override method espacioQueOcupa() = super() * 2
	
}


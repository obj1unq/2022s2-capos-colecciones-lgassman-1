object rolando{
	
	const property mochila = #{}
	var property capacidad = 2
	const casa = castillo
	const property historial = []
	
	method encontrar(artefacto) {
		
		if (mochila.size() < capacidad) {
			mochila.add(artefacto) // mochila = mochila + #{artefacto}
		}
		historial.add(artefacto)
	}
	
	method tiene(artefacto) {
		return mochila.contains(artefacto)
	}
	
	method irACasa() {
		casa.almacenar(mochila)
		mochila.clear() //mochila = #{}
	}
	
	method posee(artefacto) {
		return self.tiene(artefacto) or casa.tiene(artefacto)
		//return self.poseciones().contains(artefacto)	
	}
	
//	method poseciones(){
//		return mochila + castillo.almacen() 
//	}
	
}

object castillo {
	const property almacen = #{}
	
	method almacenar(artefactos) {
		almacen.addAll(artefactos) // almacen = almacen + artefactos
	}
	
	method tiene(artefacto) {
		return almacen.contains(artefacto)
	}
}


object espada{}
object libro{}
object collar{}
object armadura{}

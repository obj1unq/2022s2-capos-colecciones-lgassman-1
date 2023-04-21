object rolando {

	const property mochila = #{}
	var property capacidad = 2
	const casa = castillo
	const property historial = []
	var property poderBase = 0

	method encontrar(artefacto) {
		if (mochila.size() < capacidad) {
			mochila.add(artefacto)
		}
		historial.add(artefacto)
	}

	method tiene(artefacto) {
		return mochila.contains(artefacto)
	}

	/* Guarda los elementos y vacía la mochila */
	method irACasa() {
		casa.almacenar(mochila)
		mochila.clear()
	}

	method posee(artefacto) {
		return self.tiene(artefacto) or casa.tiene(artefacto)
	}

	method poderDePelea() {
		return poderBase + mochila.sum({ artefacto => artefacto.poderQueAporta(self) })
	}

	// USO FOREACH PORQUE ES UN METODO DE ACCION
	method luchar() {
		poderBase += 1
		mochila.forEach({ artefacto => artefacto.usar()})
	}

}

object castillo {

	const property almacen = #{}

	method almacenar(artefactos) {
		almacen.addAll(artefactos)
	}

	method tiene(artefacto) {
		return almacen.contains(artefacto)
	}

}

object espada {

	var estaSinUsar = true

	method poderQueAporta(personaje) = if (estaSinUsar) personaje.poderBase() else personaje.poderBase() / 2

	method usar() {
		estaSinUsar = false
	}

}

object libro {

	method poderQueAporta(personaje) {
		return 0
	}

	method usar() {
	}

}

object collar {

	var cantidadDeBatallas = 0
	const poderBase = 3

	method poderQueAporta(personaje) = poderBase + if (personaje.poderBase() > 6) cantidadDeBatallas else 0

	method usar() {
		cantidadDeBatallas += 1
	}

}

object armadura {

	method poderQueAporta(personaje) {
		return 6
	}

}


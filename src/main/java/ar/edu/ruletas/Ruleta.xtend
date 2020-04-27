package ar.edu.ruletas

import org.eclipse.xtend.lib.annotations.Accessors

interface IRuleta {
	def void girarNumero()
	def boolean apuestaGanadora(Apuesta apuesta)
}

@Accessors
class Ruleta implements IRuleta {
	Integer numeroGanador

	override void girarNumero() {
		this.numeroGanador = (Math.random * 36).intValue
	}

	override boolean apuestaGanadora(Apuesta apuesta) {
		this.numeroGanador !== null && (this.numeroGanador.intValue === apuesta.numeroApostado)
	}
}

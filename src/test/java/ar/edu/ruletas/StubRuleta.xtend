package ar.edu.ruletas

import static org.mockito.Mockito.*

class StubRuleta {
	
	def static mockearRuleta(int numeroGanador) {
		val ruleta = mock(IRuleta)
		doNothing.when(ruleta).elegirNumero()
		doAnswer [
			val apuesta = arguments.head as Apuesta
			apuesta.numeroApostado === numeroGanador
		].when(ruleta).apuestaGanadora(any(Apuesta))
		return ruleta
	}
}

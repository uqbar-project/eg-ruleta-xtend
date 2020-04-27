package ar.edu.ruletas

import static org.mockito.Mockito.*

class StubRuleta {
	
	def static mockearRuleta(int numeroGanador) {
		val ruleta = mock(IRuleta)
		doNothing.when(ruleta).elegirNumero()
		doAnswer([ invocation |
			val apuesta = invocation.arguments.get(0) as Apuesta
			return apuesta.numeroApostado === numeroGanador
		]).when(ruleta).apuestaGanadora(any(Apuesta))
		return ruleta
	}
}

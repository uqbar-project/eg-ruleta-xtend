package ar.edu.ruletas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static ar.edu.ruletas.StubRuleta.*
import static org.mockito.Mockito.*

@DisplayName("Tests de apuesta")
class TestApuesta {

	Apuesta apuestaGanadora
	Apuesta apuestaPerdedora
	Casino casino
	IMailSender mockedMailSender

	@BeforeEach
	def void init() {
		apuestaPerdedora = new Apuesta() => [
			numeroApostado = 2
			casillaCorreo = "looser@roulette.com" 
		]
		apuestaGanadora = new Apuesta() => [
			numeroApostado = 5
			casillaCorreo = "winner@roulette.com" 
		]
		mockedMailSender = mock(IMailSender)
		casino = new Casino() => [
			//
			mailSender = mockedMailSender
			//
			ruleta = mockearRuleta(apuestaGanadora.numeroApostado)
			apostar(apuestaGanadora)
			apostar(apuestaPerdedora)
		]
	}

	/**
	 * Test de Stub: comportamiento
	 */

	@Test
	@DisplayName("cuando el apostador acierta la apuesta es ganadora y el casino le envía un mail")
	def void apuestaGanadora() {
		// act
		casino.realizarRondaApuestasRuleta()
		
		// Test de comportamiento, le tiene que haber llegado un mail
		verify(mockedMailSender, times(1))
			.sendMail(new Mail(apuestaGanadora.casillaCorreo, "Ganaste!"))
			
		verify(mockedMailSender, never)
			.sendMail(new Mail(apuestaPerdedora.casillaCorreo, "Ganaste!"))

	}

}

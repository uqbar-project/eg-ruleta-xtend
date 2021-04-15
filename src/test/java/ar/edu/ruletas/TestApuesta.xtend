package ar.edu.ruletas

import org.junit.jupiter.api.BeforeEach
import org.junit.jupiter.api.DisplayName
import org.junit.jupiter.api.Test

import static org.junit.jupiter.api.Assertions.assertFalse
import static org.junit.jupiter.api.Assertions.assertTrue

@DisplayName("Tests de apuesta")
class TestApuesta {

	Apuesta apuestaGanadora
	Apuesta apuestaPerdedora
	Casino casino

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
		casino = new Casino() => [
			ruleta = new StubRuleta(5)
			apostar(apuestaGanadora)
			apostar(apuestaPerdedora)
		]
	}

	/**
	 * Test de Stub: estado
	 */
	@Test
	@DisplayName("cuando el apostador acierta la apuesta es ganadora")
	def void apuestaGanadora() {
		val ganadoras = casino.realizarRondaApuestasRuleta()
		assertTrue(ganadoras.contains(apuestaGanadora))
		assertFalse(ganadoras.contains(apuestaPerdedora))
	}

}

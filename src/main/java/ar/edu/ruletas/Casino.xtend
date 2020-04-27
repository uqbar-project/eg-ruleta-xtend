package ar.edu.ruletas

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Casino {
	IRuleta ruleta = new Ruleta
	List<Apuesta> apuestas = newArrayList
	
	def apostar(Apuesta apuesta) {
		apuestas.add(apuesta)
	}

	def List<Apuesta> realizarRondaApuestasRuleta() {
		ruleta.elegirNumero()
		
		apuestas
			.filter [ apuesta | ruleta.apuestaGanadora(apuesta) ]
			.toList
	}
}
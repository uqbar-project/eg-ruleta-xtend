package ar.edu.ruletas

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Casino {
	IRuleta ruleta = new Ruleta
	List<Apuesta> apuestas = newArrayList
	IMailSender mailSender
	
	def apostar(Apuesta apuesta) {
		apuestas.add(apuesta)
	}

	def void realizarRondaApuestasRuleta() {
		ruleta.elegirNumero()
		
		apuestas
			.filter [ apuesta | ruleta.apuestaGanadora(apuesta) ]
			.toList
			.forEach [ apuesta | mailSender.sendMail(new Mail(apuesta.casillaCorreo, "Ganaste!")) ]
	}
}
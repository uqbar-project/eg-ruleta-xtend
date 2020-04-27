package ar.edu.ruletas

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Casino {
	IMailSender emailSender
	IRuleta ruleta = new Ruleta
	List<Apuesta> apuestas = newArrayList
	
	def apostar(Apuesta apuesta) {
		apuestas.add(apuesta)
	}

	def boolean envioMails() {
		return emailSender !== null
	}

	def List<Apuesta> realizarRondaApuestasRuleta() {
		ruleta.girarNumero()
		
		val ganadoras = apuestas
			.filter [ apuesta | ruleta.apuestaGanadora(apuesta) ]
			.toList
			
		// Enviamos mail si está activado
		if (envioMails) {
			ganadoras.forEach [ unaApuesta |
				val mail = new Mail(unaApuesta.casillaCorreo, "Ganaste!")
				emailSender.sendMail(mail)
			]
		}
		
		ganadoras
	}
}
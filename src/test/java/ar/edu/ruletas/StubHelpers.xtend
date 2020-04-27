package ar.edu.ruletas

class StubHelpers implements IRuleta {
	int numeroGanador = 0

	new(int numeroGanador) {
		this.numeroGanador = numeroGanador
	}

	override girarNumero() {
		// no hacemos nada
	}
	
	override apuestaGanadora(Apuesta apuesta) {
		apuesta.numeroApostado === this.numeroGanador
	}
	
}

class StubEMailSender implements IMailSender {
	override sendMail(Mail mail) { }
}

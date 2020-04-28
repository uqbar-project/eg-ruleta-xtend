package ar.edu.ruletas

import org.eclipse.xtend.lib.annotations.Data

interface IMailSender {
	def void sendMail(Mail mail)
}

@Data
class Mail {
	String to
	String subject
}

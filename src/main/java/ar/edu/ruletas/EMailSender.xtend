package ar.edu.ruletas

import org.eclipse.xtend.lib.annotations.Data

@Data
class Mail {
	String to
	String subject
}

interface IMailSender {
	def void sendMail(Mail mail)
}
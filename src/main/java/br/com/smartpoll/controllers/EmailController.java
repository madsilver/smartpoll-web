package br.com.smartpoll.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import br.com.smartpoll.models.User;

public class EmailController {
	
	@Autowired
	private MailSender mailer;
	
	public void sendSmartPollMail(User user){
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("SmartPoll");
		email.setTo(user.getUsername());
		email.setSubject("Confirmação de novo usuário");
		email.setText("Test");
		mailer.send(email);
	}

}

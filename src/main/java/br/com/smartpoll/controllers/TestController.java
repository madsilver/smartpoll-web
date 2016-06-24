package br.com.smartpoll.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.HttpClientErrorException;

import br.com.smartpoll.daos.UserDAO;
import br.com.smartpoll.models.User;

@RequestMapping("test")
@Controller
public class TestController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private MailSender mailer;
	
	@RequestMapping("/")
	public void index(){
	
		try{
			User user = userDAO.searchByUsername("rodrigo.prata@outlook.com");
			sendSmartPollMail(user);
		} catch(HttpClientErrorException e){
			System.out.println(e.getMessage());
		}
		
	}
	
	public void sendSmartPollMail(User user){
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("SmartPoll");
		email.setTo(user.getUsername());
		email.setSubject("Confirmação de novo usuário");
		email.setText("Test");
		mailer.send(email);
	}
	
	
}

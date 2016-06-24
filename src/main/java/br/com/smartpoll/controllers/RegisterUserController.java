package br.com.smartpoll.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.AccountDAO;
import br.com.smartpoll.models.Account;

@Controller
@RequestMapping("register-user")
public class RegisterUserController {
	
	@Autowired
	private AccountDAO accountDAO;

	@RequestMapping("/")
	public String index(){
		return "site/register-user";
	}
	
	@RequestMapping(value = "/save-account")
	@ResponseBody
	public String saveNewAccount(Account account){
		try{
			accountDAO.save(account);
		}
		catch(Exception e){
			return "fail";
		}
		return "ok";
	}
	
	@RequestMapping(value = "/email-exist")
	@ResponseBody
	public String emailExist(String email){

		try{
			Account account = accountDAO.searchByEmail(email);
			if(account != null){
				return "true";
			} else {
				return "false";
			}
		}
		catch(Exception e){
			return "error";
		}
	}
}

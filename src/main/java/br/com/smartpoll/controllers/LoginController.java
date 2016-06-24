package br.com.smartpoll.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.smartpoll.daos.UserDAO;
import br.com.smartpoll.models.User;
import br.com.smartpoll.utils.SpUtils;

@Controller
@RequestMapping("login")
public class LoginController {
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/")
	public String index(){
		return "login";
	}
	
	@RequestMapping("/auth")
	public String auth(User u){
		
		String password = u.getPassword();
		User user = userDAO.searchByUsername(u.getUsername());

		if(user != null){
			if(password.equals(SpUtils.decrypt(user.getPassword()))){
				return "redirect:/dashboard/";
			}
			else{
				return "redirect:/login/?l=1";
			}
		}
		else{
			return "redirect:/login/?l=0";
		}
	}
}

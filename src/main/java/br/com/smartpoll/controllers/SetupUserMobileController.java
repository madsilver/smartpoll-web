package br.com.smartpoll.controllers;

import java.security.NoSuchAlgorithmException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.UserMobileDAO;
import br.com.smartpoll.models.UserMobile;
import br.com.smartpoll.utils.SpUtils;

@Controller
@Transactional
@RequestMapping("setup-user-mobile")
public class SetupUserMobileController {
	
	@Autowired
	UserMobileDAO userMobileDAO;
	
	@RequestMapping("/")
	public String index(){
		return "setup-user-mobile";
	}
	
	@RequestMapping(value = "/table/{account}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object tableUserMobile(@PathVariable int account){
		return userMobileDAO.list(account);
	}
	
	@RequestMapping(value = "/login/{username}/{password}/{imei}", method = RequestMethod.POST)
	@ResponseBody
	public String login(
			@PathVariable String username, 
			@PathVariable String password, 
			@PathVariable String imei) throws NoSuchAlgorithmException{
		UserMobile um = userMobileDAO.searchByUsernamePassword(username, SpUtils.hash(password));
		if(um != null){
			if(um.getImei() == null){ //usuário mobile disponível
				if(imei.equals(um.getLast_imei())){ //verifica se o imei informado já foi descartado
					return "blocked";
				}
				um.setImei(imei);
				userMobileDAO.update(um); //associa o imei informado ao usuário mobile
				return "allow";
			} else {
				if(imei.equals(um.getImei())){ //verifica se o imei informado bate com o imei associado ao usuário mobile
					return "allow";
				} else {
					return "used";
				}
				
			}
		}
		return "denied";
	}
	
	@RequestMapping(value = "/save-user")
	@ResponseBody
	public String saveUserMobile(UserMobile user){
		try{
			UserMobile um = userMobileDAO.searchByUsername(user.getUsername());
			if(um != null)
				return "Este nome de usuário já existe";
			
			user.setPassword(SpUtils.hash(user.getPassword()));
			if(user.getId() > 0)
				userMobileDAO.update(user);
			else
				userMobileDAO.save(user);
		}
		catch(Exception e){
			return e.getMessage();
		}
		return "ok";
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody String deleteUserMobile(@RequestParam(value = "userMobile", required = true) int userMobileId){
		try{
			UserMobile user = userMobileDAO.searchById(userMobileId);
			userMobileDAO.remove(user);
			return "ok";
		}
		catch(Exception e){
			return e.getMessage();
		}
	}
	
	@RequestMapping(value = "/release-device")
	public @ResponseBody String releaseDevice(@RequestParam(value = "userMobile", required = true) int userMobileId){
		try{
			UserMobile user = userMobileDAO.searchById(userMobileId);
			user.setLast_imei(user.getImei());
			user.setImei(null);
			userMobileDAO.update(user);
			return "ok";
		}
		catch(Exception e){
			return e.getMessage();
		}
	}

}

package br.com.smartpoll.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.PollDataDAO;

@Controller
@RequestMapping("map")
public class MapController {
	
	@Autowired
	private PollDataDAO pollDataDAO;
	
	@RequestMapping("/")
	public String index(){
		return "map";
	}
	
	@RequestMapping(value = "/positions", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object getLatLong(@RequestParam(value = "poll", required = true) String poll){
		return pollDataDAO.getLatLng(poll);
	}

}

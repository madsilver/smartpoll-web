package br.com.smartpoll.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.smartpoll.daos.PollDataDAO;


@Controller
@RequestMapping("dashboard")
public class DashboardController{
	
	@Autowired
	private PollDataDAO pollDataDAO;

	@RequestMapping("/")
	public ModelAndView index(){
		ModelAndView modelAndView = new ModelAndView("dashboard");
		String pollId = "1";
		
		try {
			modelAndView.addObject("count",pollDataDAO.getTotalPoll(pollId));
			modelAndView.addObject("days", pollDataDAO.countDays(pollId) );
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return modelAndView;
	}

}

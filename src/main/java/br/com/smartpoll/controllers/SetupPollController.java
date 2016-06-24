package br.com.smartpoll.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.PollDAO;
import br.com.smartpoll.models.Poll;

@Controller
@Transactional
@RequestMapping("setup-poll")
public class SetupPollController {
	
	@Autowired
	private PollDAO pollDAO;
	
	@RequestMapping("/")
	public String poll(){
		return "setup-poll";
	}
	
	@RequestMapping(value = "/table", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object tablePoll(){
		List<Poll> list = new ArrayList<>();
		for(Poll poll : pollDAO.list()){
			poll.setQuestion(null);
			poll.setPollData(null);
			list.add(poll);
		}
		return list;
	}
	
	/**
	 * 
	 * @param poll
	 * @return
	 */
	@RequestMapping(value = "/save-poll")
	@ResponseBody
	public String savePoll(Poll poll){
		try{
			if(poll.getId() > 0)
				pollDAO.update(poll);
			else
				pollDAO.save(poll);
		}
		catch(Exception e){
			return "fail";
		}
		return "ok";
	}
	
	/**
	 * 
	 * @param pollId
	 * @return
	 */
	@RequestMapping(value = "/delete")
	@ResponseBody
	public String deletePoll(@RequestParam(value = "poll", required = true) long pollId){
		try{
			Poll poll = pollDAO.searchById(pollId);
			if(poll.getQuestion().size() > 0){
				return "Atenção, você deve remover as questões desta pesquisa no painel Questões antes de removê-la.";
			}
			pollDAO.remove(poll);
		}
		catch(Exception e){
			return e.getMessage();
		}
		return "ok";
	}

}

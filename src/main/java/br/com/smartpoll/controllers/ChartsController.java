package br.com.smartpoll.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.PollDAO;
import br.com.smartpoll.daos.PollDataDAO;
import br.com.smartpoll.daos.QuestionDAO;
import br.com.smartpoll.models.Poll;
import br.com.smartpoll.models.Question;

@Controller
@Transactional
@RequestMapping("charts")
public class ChartsController {
	
	@Autowired
	private PollDAO pollDAO;
	
	@Autowired
	private PollDataDAO pollDataDAO;
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@RequestMapping("/")
	public String index(){
		return "charts";
	}
	
	
	@RequestMapping(value = "/table", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object tablePoll(){
		List<Poll> list = new ArrayList<>();
		for(Poll p : pollDAO.list()){
			p.setQuestion(null);
			p.setPollData(null);
			list.add(p);
		}
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/multi-question", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object multiQuestion(@RequestParam(value = "poll", required = true) long poll){

		Map<String,List<Object>> chartMap = new HashMap<String,List<Object>>();
		
		for(Question question : questionDAO.listByType(pollDAO.searchById(poll),Question.MULTIPLE_CHOICE)){
			List<Object> list = pollDataDAO.getPollDataByQuestion(String.valueOf(question.getId()), String.valueOf(poll));
			chartMap.put(question.getDescription(), list);
		}
		return chartMap;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/single-question", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object singleQuestion(@RequestParam(value = "poll", required = true) long poll){

		Map<String,List<Object>> chartMap = new HashMap<String,List<Object>>();
		Poll p = pollDAO.searchById(poll);
		for(Question question : questionDAO.listByType(p,Question.SINGLE_CHOICE)){
			String questionId = String.valueOf(question.getId());
			List<Object> list = pollDataDAO.getPollDataBySingleQuestion(String.valueOf(poll), questionId);
			chartMap.put(question.getDescription(), list);
		}
		return chartMap;
	}
	

}

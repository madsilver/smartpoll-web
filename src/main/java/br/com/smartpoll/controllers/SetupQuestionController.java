package br.com.smartpoll.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.PollDAO;
import br.com.smartpoll.daos.QuestionDAO;
import br.com.smartpoll.models.Option;
import br.com.smartpoll.models.Question;
import br.com.smartpoll.models.QuestionForm;

@Controller
@Transactional
@RequestMapping("setup-question")
public class SetupQuestionController {
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private PollDAO pollDAO;
	
	@RequestMapping("/")
	public String question(){
		return "setup-question";
	}
	
	@RequestMapping(value = "/table", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Object tableQuestion(@RequestParam(value = "poll", required = true) long poll){
		List<Question> list = new ArrayList<>();
		for(Question question : questionDAO.list(pollDAO.searchById(poll))){
			question.getPoll().setQuestion(null);
			question.getPoll().setPollData(null);
			
			question.setPollData(null);
			question.setOption(null);
			list.add(question);
		}
		return list;
	}
	
	@RequestMapping(value = "/table-option", produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Object tableOption(@RequestParam(value = "question", required = true) String question){
		Question q = questionDAO.searchById(question);
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> list = new ArrayList<>(); 
		for(Option o : q.getOption()){
			HashMap<String, String> map = new HashMap<>();
			map.put("id", String.valueOf(o.getId()));
			map.put("description", o.getDescription());
			list.add(map);
		}
		return list;
	}
	
	/**
	 * 
	 * @param questionForm
	 * @return
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody String savePoll(QuestionForm questionForm){
		try{
			Question q = new Question();
			if(questionForm.getId() > 0)
				q.setId(questionForm.getId());
			q.setDescription(questionForm.getDescription());
			q.setType(questionForm.getType());
			q.setPoll(pollDAO.searchById(questionForm.getPoll()));

			if(q.getId() > 0)
				questionDAO.update(q);
			else
				questionDAO.save(q);
		}
		catch(Exception e){
			return "fail";
		}
		return "ok";
	}
	
	@RequestMapping(value = "/delete")
	public @ResponseBody String deleteQuestion(@RequestParam(value = "question", required = true) String questionId){
		try{
			Question question = questionDAO.searchById(questionId);
			questionDAO.remove(question);
			return "ok";
		}
		catch(Exception e){
			return e.getMessage();
		}
	}

}

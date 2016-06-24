package br.com.smartpoll.controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.smartpoll.daos.OptionDAO;
import br.com.smartpoll.daos.PollDAO;
import br.com.smartpoll.daos.QuestionDAO;
import br.com.smartpoll.daos.PollDataDAO;
import br.com.smartpoll.daos.TempUploadDAO;
import br.com.smartpoll.daos.UserMobileDAO;
import br.com.smartpoll.models.Option;
import br.com.smartpoll.models.Poll;
import br.com.smartpoll.models.Question;
import br.com.smartpoll.models.PollData;
import br.com.smartpoll.models.TempUpload;
import br.com.smartpoll.models.UserMobile;
import br.com.smartpoll.utils.SpUtils;
import br.com.smartpoll.utils.kXMLElement;

@Controller
@Transactional
@RequestMapping("poll")
public class PollController {
	
	@Autowired
	private PollDAO pollDAO;
	
	@Autowired
	private TempUploadDAO tempUploadDAO;
	
	@Autowired
	private QuestionDAO questionDAO;
	
	@Autowired
	private OptionDAO optionDAO;
	
	@Autowired
	private PollDataDAO pollDataDAO;
	
	@Autowired
	private UserMobileDAO userMobileDAO;
	
	/**
	 * Função que retorna um xml com os dados da pesquisa para o celular
	 * @return xml
	 */
	@RequestMapping(value = "/download/{imei}", method = RequestMethod.POST, produces = "application/xml")
	@ResponseBody
	public Poll getPoll(@PathVariable String imei){
		UserMobile um = userMobileDAO.searchByImei(imei);
		if(um != null){
			List<Poll> pollList = pollDAO.searchByAccount(um.getAccount());
			return pollList.get(0);
		}
		return null;
	}
	
	/**
	 * Função que recebe os dados da pesquisa enviados do celular
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public void saveDataPoll(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String sucess = "{status:1}";
		String fail = "{status:0}";
		try {
			String message = SpUtils.getStringFromStream(request.getInputStream());
			TempUpload tu = new TempUpload(message);
			tempUploadDAO.save(tu);
			response.getOutputStream().write(sucess.getBytes());
			
			kXMLElement element = new kXMLElement();
			element.parseString(tu.getValue());
			
			saveResponse(element);
			
			String imei = element.getProperty("IMEI");
			UserMobile um = userMobileDAO.searchByImei(imei);
			um.setLast_message(new Date());
			userMobileDAO.update(um);
			
			
			tempUploadDAO.remove(tu);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.getOutputStream().write(fail.getBytes());

		} finally {
			response.flushBuffer();
			response.getOutputStream().close();
		}
	}
	
	/**
	 * 
	 * @param tu
	 */
	private void saveResponse(kXMLElement element){
		
		String imei = element.getProperty("IMEI");
		long pollId = element.getLongProperty("ID");
		Poll poll = pollDAO.searchById(pollId);
		
		@SuppressWarnings("unchecked")
		ArrayList<kXMLElement> elementList = new ArrayList<kXMLElement>(element.getChildren());
		for(int i=0; i<elementList.size(); i++) {
			kXMLElement el = elementList.get(i);

			if(el.getTagName().equalsIgnoreCase("question")) {
				String strQuestion = el.getProperty("ID");
				long lDate = el.getLongProperty("DATE");
				Date date = new Date(lDate);
				String strOption = el.getProperty("OPTION-ID","0");
				String text = el.getProperty("OPTION-RESP"); 
				String latitude = el.getProperty("LAT");
				String longitude = el.getProperty("LONG");
				
				Question question = questionDAO.searchById(strQuestion);
				Option option = optionDAO.searchById(strOption);
				
				PollData response = new PollData();
				response.setPoll(poll);
				response.setQuestion(question);
				response.setOption(option);
				response.setText(text);
				response.setDate(date);
				response.setImei(imei);
				response.setLatitude(latitude);
				response.setLongitude(longitude);
				
				pollDataDAO.save(response);
			}
		}
		
	}
	
}

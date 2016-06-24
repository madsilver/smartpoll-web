package br.com.smartpoll.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.smartpoll.models.PollData;

@Repository
public class PollDataDAO {
	
	static final String SMARTPOLL_DB = "smartpoll_db";
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<PollData> list(){
		return manager.createQuery("select pd from PollData pd", PollData.class)
				.getResultList();
	}
	
	public PollData searchById(String id){
		return manager.createQuery("select pd from PollData pd where id = " + id, PollData.class)
				.getSingleResult();
	}
	
	/**
	 * Salva a pesquisa
	 * @param pollData
	 */
	public void save(PollData pollData){
		manager.persist(pollData);
	}
	
	/**
	 * Consulta os dados da pesquisa 
	 * @param questionId - id da questão
	 * @param pollId - id da pesquisa
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List getPollDataByQuestion(String questionId, String pollId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT oq.description, COUNT(pd.question_id) ");
		sb.append("FROM "+SMARTPOLL_DB+".poll_data AS pd ");
		sb.append("LEFT JOIN "+SMARTPOLL_DB+".option_question AS oq ON pd.option_id = oq.id ");
		sb.append("WHERE oq.question_id = " + questionId);
		sb.append(" AND pd.poll_id = " + pollId);
		sb.append(" GROUP BY oq.id");
		return manager.createNativeQuery(sb.toString()).getResultList();
	}
	
	/**
	 * Consulta os dados da pesquisa retornando as questões do tipo Simples
	 * @param pollId
	 * @return
	 */
	@SuppressWarnings({ "rawtypes" })
	public List getPollDataBySingleQuestion(String pollId, String questionId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT pd.text, COUNT(1) FROM "+SMARTPOLL_DB+".poll_data pd ");
		sb.append("WHERE pd.text IS NOT NULL ");
		sb.append(" AND pd.poll_id = " + pollId);
		sb.append(" AND pd.question_id = " + questionId);
		sb.append(" GROUP BY pd.text");
		sb.append(" ORDER BY COUNT(1) DESC");
		return manager.createNativeQuery(sb.toString()).getResultList();
	}
	
	/**
	 * Consulta as datas da pesquisa retornando a minima e a máxima
	 * @param pollId
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getInterval(String pollId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT DATE_FORMAT(min(spd.date),'%d/%m/%Y'), DATE_FORMAT(max(spd.date),'%d/%m/%Y') ");
		sb.append("FROM "+SMARTPOLL_DB+".poll_data AS spd ");
		sb.append("WHERE spd.poll_id = "+ pollId);
		return manager.createNativeQuery(sb.toString()).getResultList();
	}
	
	/**
	 * Retorna o total de dias em que foram feitas as pesquisas
	 * @param pollId
	 * @return
	 */
	public Object countDays(String pollId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(DISTINCT date) FROM "+SMARTPOLL_DB+".poll_data AS pd ");
		sb.append("WHERE pd.poll_id = "+ pollId);
		return manager.createNativeQuery(sb.toString()).getSingleResult();
	}
	
	/**
	 * Retorna o total de pesquisas respondidas
	 * @param pollId
	 * @return
	 */
	public Object getTotalPoll(String pollId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT COUNT(1) AS total FROM "+SMARTPOLL_DB+".poll_data AS pd ");
		sb.append("WHERE pd.poll_id = "+ pollId);
		sb.append(" GROUP BY pd.question_id LIMIT 1 ");
		return manager.createNativeQuery(sb.toString()).getSingleResult();
	}
	
	/**
	 * Retorna a localização de onde foi realizada a pesquisa
	 * @param pollId
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List getLatLng(String pollId){
		StringBuilder sb = new StringBuilder();
		sb.append("SELECT DISTINCT(pd.latitude), pd.longitude ");
		sb.append("FROM "+SMARTPOLL_DB+".poll_data AS pd ");
		sb.append("WHERE pd.poll_id = "+ pollId);
		sb.append(" AND pd.latitude IS NOT NULL");
		return manager.createNativeQuery(sb.toString()).getResultList();
	}

}

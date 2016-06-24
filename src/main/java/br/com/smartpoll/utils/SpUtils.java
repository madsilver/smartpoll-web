package br.com.smartpoll.utils;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.jasypt.util.text.BasicTextEncryptor;

public class SpUtils {
	
	private static String password = "s1lv3rsm4rtpo11";

	/**
	 * 
	 * @param text
	 * @return
	 */
	public static String encrypt(String text) {
		BasicTextEncryptor bte = new BasicTextEncryptor();
		bte.setPassword(password);
		return bte.encrypt(text);
	}
	
	/**
	 * 
	 * @param text
	 * @return
	 */
	public static String decrypt(String text) {
		BasicTextEncryptor bte = new BasicTextEncryptor();
		bte.setPassword(password);
		return bte.decrypt(text);
	}
	
	/**
	 * 
	 * @param text
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String hash(String text) throws NoSuchAlgorithmException{
		MessageDigest md = MessageDigest.getInstance("MD5");
		BigInteger hash = new BigInteger(1, md.digest(text.getBytes()));
		return String.format("%32x", hash);
	}
	
	/**
	 * 
	 * @param is
	 * @return
	 */
	public static String getStringFromStream(InputStream is){
		StringBuffer sb = new StringBuffer();
		
		int byteRead = 0;
		boolean findInit = false;
		try {
			while((byteRead = is.read()) != -1) {
				if(byteRead == 60 && !findInit){
					findInit = true;
				}
				if(findInit){
					sb.append((char) byteRead);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return sb.toString();
	}

}

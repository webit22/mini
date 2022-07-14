package bank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	/*
	 * @param request 요청 객체
	 * @param response 응답 객체
	 * @return forward 시킬 jsp 주소
	 * @throws Exception
	 * */
	String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

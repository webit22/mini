package bank.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bank.login.vo.LoginVO;

public class LoginProcessController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		if(id.equals("user") && password.equals("user")) {
			// 로그인 성공
			LoginVO userVO = new LoginVO();
			userVO.setId(id);
			userVO.setPassword(password);
			userVO.setName("홍길동");
			/* userVO.setName("홍길동"); 
			userVO.setType("U"); */
			
			// session 등록 - request.getSession()으로 session 객체를 얻어와야함
			HttpSession session = request.getSession();
			session.setAttribute("userVO", userVO);
			
			return "redirect:/"; // main 페이지로 이동
//			return "/jsp/board/list.jsp";
		}
		// 로그인 실패
		return "redirect:/login.do"; // 다시 login 페이지로 이동
	}

}

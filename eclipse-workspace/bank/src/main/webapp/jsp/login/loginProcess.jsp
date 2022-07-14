
<%@page import="bank.login.vo.LoginVO"%>
<%@ page import="bank.user.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	/* 나중에 LoginVO/DAO 대신 MemberVO/DAO 로 바꾸기 */
	LoginVO loginVO = new LoginVO();
	loginVO.setId(id);
	loginVO.setPassword(password);
	
	UserDAO dao = new UserDAO();
	UserVO userVO = dao.login(loginVO); // "return LoginVO type" == 회원의 정보를 반환해줌
	
	String msg = "";
	String url = "";
	if(loginVO == null){
		// login failed -> redirect to login page (login.jsp)
		msg = "아이디 또는 패스워드를 잘못 입력했습니다.";
		url = "login.jsp"; // loginProcess.jsp 랑 같은 위치에 있으므로 그냥 상대경로 써도 ㄱㅊ
	} else {
		// login success -> redirect to main page (index.jsp)
		switch(loginVO.getType()){
		case "S" :
			msg = "관리자님 환영합니다";
			break;
		case "U" :
			msg = loginVO.getId() + "님 환영합니다";
			break;
		}
		
		url = "/Mission-Web";
		
		// 로그인 성공 시, 세션에 등록.
		session.setAttribute("userVO", userVO);
	}
	
	// msg, url을 공유영역에 등록시킴
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>

<!-- 
	1. 화면에 출력할게 아니므로 자동완성됐던 html 코드 다 지우고 내가 필요한 script 태그만 작성!
	2. url 값이 성공하면 ${ url } -> /Mission-web 으로 바뀜. 그래서 url 겉에 '' 필수!!
-->
<script>
	alert('${ msg }');
	location.href = '${ url }'; 
</script>
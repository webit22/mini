<%@ page import="java.util.List"%>
<%@page import="bank.board.vo.BoardVO"%>
<%@page import="bank.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function doAction(type) {
		switch(type) {
		case 'U' : 
			location.href = "update.jsp?no=${param.no}"
			break;
		case 'D' : 
			if(confirm('삭제하시겠습니까?')) {
				location.href = "delete.jsp?no=${param.no}"
			}
			break;
		case 'L' :
			location.href = "list.jsp"
			break;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>게시판 상세</h2>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td><c:out value="${ board.title }" /></td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${ board.content }" /></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
		</table>
		<br>
		<button onclick="doAction('U')">수  정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭  제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목  록</button>&nbsp;&nbsp;
	</div>
</body>
</html>










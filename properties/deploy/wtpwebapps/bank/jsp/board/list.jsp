<%@ page import="bank.board.vo.BoardVO"%>
<%@ page import="java.util.List"%>
<%@ page import="bank.board.dao.BoardDAO"%>
<%@ page import="bank.util.JDBCClose"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="bank.util.ConnectionFactory"%>
<%@ page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>

<script src="/bank/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'writeForm.jsp'
		})
	})
	
	function checkLogin(boardNo) {
		<c:choose>
			<c:when test="${ empty userVO }">
				if(confirm('로그인 후 사용가능합니다\n로그인페이지로 이동할까요?')) {
					location.href = "/bank/jsp/login/login.jsp"
				}
			</c:when>
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
		<div align="center">
		<hr>
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:100%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			<c:forEach items="${ list }" var="board" varStatus="loop">
				<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
					<td>${ board.no }</td>
					<td>
						<a href="javascript:checkLogin(${ board.no })">
							<c:out value="${ board.title }" />
						</a>
					<%-- 		
						<a href="detail.jsp?no=${ board.no }">
							<c:out value="${ board.title }" />
						</a>
					 --%>	
					</td>
					<td>${ board.writer }</td>
					<td><c:out value="${ board.regDate }" /></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn">새글등록</button>
		</c:if>
	</div>
	</section>
	<footer>
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>


























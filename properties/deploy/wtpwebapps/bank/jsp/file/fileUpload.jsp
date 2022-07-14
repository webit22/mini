<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	<!-- 
		그냥 form 태그만 작성하면 logo.jpg 파일 자체는 서버로 전송되지 않음. 
		enctype="multipart/form-data" <=> 파일 업로드
	-->
	<form action="uploadInfo.jsp" method="post" enctype="multipart/form-data">
		ID : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile" size="50"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		/* fileUpload.jsp가 보낸 파일을 inputstream을 통해 받아옴 */
		InputStreamReader isr = new InputStreamReader(request.getInputStream(), "utf-8");
		BufferedReader br = new BufferedReader(isr);
		
		while(true){
			String buf = br.readLine();
			if(buf == null) break;
			out.write(buf + " <br> ");
		}
		
	%>
</body>
</html>


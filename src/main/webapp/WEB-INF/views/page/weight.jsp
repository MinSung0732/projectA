<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
</head>
<body>
	<form action="${cp}/page/weight" method="post">
		<textarea rows="2" name="id" placeholder="이름"></textarea>
		<br>
		<textarea rows="2" name="weight" placeholder="몸무게" maxlength="5"></textarea>
		<br>
		<textarea rows="2" name="height" placeholder="키" maxlength="5"></textarea>
		<br>
		<input type="submit" value="작성완료">
	</form>
	
	항히하이하이
</body>
</html>
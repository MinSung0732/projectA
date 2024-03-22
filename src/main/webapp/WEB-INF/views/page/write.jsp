<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 - 작성</title>
<link rel="stylesheet" href="/resources/write.css" >
</head>
<body>
	<form action="${cp}/page/write" method="post">
		<textarea rows="2" name="B_TITLE" placeholder="제목"></textarea>
		<br>
		<textarea rows="3" name="B_ID" placeholder="작성자"></textarea>
		<br>
		<textarea rows="5" name="B_TEXT" placeholder="글내용"></textarea>
		<br>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>
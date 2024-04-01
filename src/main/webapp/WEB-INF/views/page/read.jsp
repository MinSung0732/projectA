<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${read.b_TITLE}</title>
</head>
<body>
글 제목: ${read.b_TITLE}
<br>
글 작성자: ${read.b_ID} / 작성시간: ${read.b_DATETIME}
<br>
글 내용: ${read.b_TEXT}
<br>
조회수 : ${read.b_HIT}
<br>
<a href="${cp}/page/mainWeb"><button type="button">뒤로가기</button></a>
</body>
</html>
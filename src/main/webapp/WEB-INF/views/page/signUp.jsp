<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<p>회원가입</p>
	<br><br>
	<form action="${cp}/page/createId" method="Post">
		아이디 입력: <input type="text" maxlength="20" name="id"><br>
		비밀번호 입력: <input type="text" maxlength="255" name="pw"><br>
		<input type="submit" value="회원가입">
	</form>
	
	<br><br>
	<p>로그인</p>
	<br><br>
	<form action="${cp}/page/signIn" method="Post">
		아이디 입력: <input type="text" maxlength="20" name="id"><br>
		비밀번호 입력: <input type="text" maxlength="255" name="pw"><br>
		<input type="submit" value="로그인">
	</form>
	
	<br><br>
	
	<fieldset>
		<legend>현재 목록</legend>
		<c:forEach var="sign" items="${loginList}">
			[${sign.no}. ID: ${sign.id} PW: ${sign.pw}]
			<br> 
		</c:forEach>
	</fieldset>

</body>
</html>
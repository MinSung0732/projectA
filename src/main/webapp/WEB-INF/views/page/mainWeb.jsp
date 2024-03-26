<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/mainWeb.css" >
</head>
<body>
	들어오기 성공
	<br><br>

	
	
	현재 회원 : ${myLogin}
	
	<br>
	<br>
	<button id="toggleButton">게시글 목록 토글</button>
	<div id="list" style="display:none;">
		<fieldset id="listFieldSet">
			<legend>게시글 목록</legend>
			<c:forEach var="list" items="${list}">
				${list.b_NO} / 
				<a href="${cp}/page/read?b_NO=${list.b_NO}">${list.b_TITLE}</a> / 
				${list.b_ID} / 
				${list.b_HIT}
				<br>
			</c:forEach>
		</fieldset>
	</div>
	<br>
	<a href="${cp}/page/write"><button type="button">글작성하기</button></a>
	<br>
	<a href="${cp}/page/weight"><button type="button">내정보 입력</button></a>
	<br>
	
	<form action="${cp}/page/graph">
		<input type="text" name="id" placeholder="이름">
		<input type="submit" value="검색">
	</form>
	
	<br><br>
	<a href="${cp}/page/signUp"><button type="button">회원가입 / 로그인</button></a>
	
	<script>
		var toggleButton = document.getElementById('toggleButton');
		var listDiv = document.getElementById('list');
		
		toggleButton.addEventListener('click', function() {
		    if (listDiv.style.display === 'block') {
		        listDiv.style.display = 'none';
		    } else {
		        listDiv.style.display = 'block';
		    }
		});
		
		
	</script>
</body>
</html>
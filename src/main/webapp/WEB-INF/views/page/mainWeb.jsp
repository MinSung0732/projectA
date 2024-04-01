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
	<br>
	<br>
	<div id="login">
	<form action="${cp}/page/signIn" method="Post">
		아이디 입력: <input type="text" maxlength="20" name="id"><br>
		비밀번호 입력: <input type="password" maxlength="255" name="pw">
		<br><br>
		<input type="submit" value="로그인"> &nbsp;
		<a href="${cp}/page/signUp"><button type="button">회원가입</button></a>
	</form>
	</div>
	<br>
	<div id="status" style="display:flex;">
	현재 회원 : ${myLogin} 
	&nbsp; <button type="button" id="logOut" style="display: none;">로그아웃</button> 
	&nbsp; <button type="button" id="myPage" style="display: none;">마이 페이지</button>
	</div>
	<br>
	<br>
	<div id="mainMenu" style="display:flex;">
	<button id="toggleButton">게시글 목록 토글</button> &nbsp;
	<a href="${cp}/page/write"><button type="button">글작성하기</button></a>&nbsp;
<%-- 	<a href="${cp}/page/weight"><button type="button">내정보 입력</button></a>&nbsp; --%>
<%-- 	<form action="${cp}/page/graph"> --%>
<%-- 		<input type="hidden" name="id" value="${myLogin}"> --%>
<!-- 		<input type="submit" value="내 체중변화 보러가기"> -->
<!-- 	</form> -->
	</div>
	<hr>
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
	<hr>
	<fieldset>
		<legend>현재 목록</legend>
		<c:forEach var="sign" items="${loginList}">
			[${sign.no}. ID: ${sign.id} PW: ${sign.pw}]
			<br> 
		</c:forEach>
	</fieldset>
	
	
	<!-- 글목록 토글 이벤트 -->
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
		
		var logOut = document.getElementById('logOut');
		var myPageBtn = document.getElementById('myPage');
		var loginStat = document.getElementById('login');
		
		logOut.addEventListener('click', function() {
			
			var xhr = new XMLHttpRequest();
			xhr.open('GET','/page/signOut', true);
			xhr.onreadystatechange = function () {
				if (xhr.readyState === XMLHttpRequest.DONE) {
					if (xhr.status === 200) {
						window.location.href = '/page/mainWeb';
					} else {
						console.error('로그아웃 실패');
					}
				}
			};
			xhr.send();
		});
		
		document.addEventListener("DOMContentLoaded", function() {
		    var xhr = new XMLHttpRequest();
		    
		    // 세션 상태 확인을 위한 GET 요청
		    xhr.open('GET', '/page/checkSession', true);
		    xhr.onreadystatechange = function () {
		        if (xhr.readyState === XMLHttpRequest.DONE) { // 올바른 XMLHttpRequest 상수 사용
		            if (xhr.status === 200) {
		                var isLoggedIn = xhr.responseText;
		                
		                // 서버에서 반환한 결과에 따라 로그아웃 버튼 표시 여부 결정
		                if (isLoggedIn === 'true') {
		                    logOut.style.display = 'inline-block';
		                    myPageBtn.style.display = 'inline-block';
		                    loginStat.style.display = 'none';
		                } else {
		                    logOut.style.display = 'none';
		                    myPageBtn.style.display = 'none';
		                    loginStat.style.display = 'inline-block';
		                }
		            } else {
		                console.error('확인 요청 실패');
		            }
		        }
		    };
		    xhr.send();
		});
		
		myPageBtn.addEventListener('click', function() {
			window.location.href = '${cp}/myhome/myPage?id=${myLogin}';
		});
		
		
		
	</script>
</body>
</html>
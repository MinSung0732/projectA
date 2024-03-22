<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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
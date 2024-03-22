<%@ page contentType="text/html;charset=UTF-8" language="java"%>
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

</body>
</html>
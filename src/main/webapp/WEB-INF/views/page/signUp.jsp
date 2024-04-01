<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<p>회원가입</p>
	<br><br>
	<form id="signupForm" action="${cp}/page/createId" method="Post">
		아이디 입력: <input type="text" maxlength="20" id="userId" name="id">
		<br>
		<label id="checkText"></label>
		<br>
		비밀번호 입력: <input type="password" maxlength="20" id="userPw" name="pw">
		<br>
		<label id="checkTextPw"></label>
		<br>
		비밀번호 재입력: <input type="password" maxlength="20" id="userRePw" name="rePw">
		<br>
		<label id="checkRePw"></label>
		<br>
		<input id="submitBtn" type="submit" value="회원가입">
	</form>
	
	<script>
		$(document).ready(function() {
			$("#userId").on("focusout", function() {
				
				var id = $("#userId").val();
				
				if(id == '' || id.length == 0){
					$("#checkText").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
					return false;
				}
				
				$.ajax({
					url : '/page/ConfirmId',
					data : {
						id : id
					},
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						if (result == true) {
							$("#checkText").css("color", "green").text("사용 가능한 ID 입니다.");
						} else {
							$("#checkText").css("color", "red").text("사용 불가능한 ID 입니다.");
							$("#id").val('');
						}
					}
				});
			});
			
			$("#userPw").on("focusout", function() {
			    var pw = $("#userPw").val();
			    
			    if (pw === '' || pw.length === 0) {
			        $("#checkTextPw").css("color", "red").text("공백은 PW로 사용할 수 없습니다.");
			        return false;
			    }
			    
			    if (pw.length < 8) {
			        $("#checkTextPw").css("color", "orange").text("8자 미만 비밀번호는 설정할 수 없습니다.");
			    }
			    
			    if (pw.length > 8) {
			        $("#checkTextPw").css("color", "green").text("사용가능한 비밀번호입니다.");
			    }
			});
			
			$("#userRePw").on("focusout", function(){
				var pw = $("#userPw").val();
				var rePw = $("#userRePw").val();
				
				if (rePw === '' || rePw === 0) {
					$("#checkRePw").css("color", "red").text("비밀번호를 다시 입력해주세요.");
					return false;
				}
				
				if (pw !== rePw) {
					$("#checkRePw").css("color", "red").text("비밀번호가 일치하지 않습니다.");
				} else {
					$("#checkRePw").css("color", "green").text("비밀번호가 일치합니다.")
				}
			});
			
			function getParameterByName(name, url) {
			    if (!url) url = window.location.href;
			    name = name.replace(/[\[\]]/g, "\\$&");
			    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
			        results = regex.exec(url);
			    if (!results) return null;
			    if (!results[2]) return '';
			    return decodeURIComponent(results[2].replace(/\+/g, " "));
			}

			// error 파라미터에서 오류 메시지 가져오기
			var errorMessage = getParameterByName('error');

			// 오류 메시지가 존재하면 알림창으로 표시
			if (errorMessage) {
			    alert(errorMessage);
			}
		
		})

	</script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<link rel="stylesheet" href="${root}/assets/css/login.css" />
<style>
/* 나중에 지우기 */
.login-logo {
  width: 90px;
  height: 100px;
  margin-left: 220px;
  margin-top: 100px;
  margin-bottom: 70px;
}
</style>
<body>
	<main class="container box">
		<c:if test="${cookie.ssafy_id.value ne null}">
			<c:set var="idck" value=" checked" />
			<c:set var="saveid" value="${cookie.ssafy_id.value}" />
		</c:if>
		<div class="login-page" style="margin-top: 100px">
			<div class="title">
				<img src="${root}/assets/img/qq.png" class="login-logo" />
			</div>
			<div class="form">
				<form name="login-form" class="login-form" method="POST" action="">
					<input type="hidden" name="action" value="login">
					<div>
						<input id="userId" name="userId" type="text" placeholder="ID"
							value="${saveid}" required />
					</div>
					<div>
						<input id="password" name="password" type="password"
							placeholder="password" />
					</div>
					<input class="form-check-input" type="checkbox" value="ok"
						id="saveid" name="saveid" ${idck} /> <label
						class="form-check-label" for="saveid"> 아이디저장 </label>
					<div>
						<button class="login-btn" type="button">login</button>
					</div>
					<!-- <button onclick="location.href='register.html'" type="button">회원가입</button> -->
					<div class="go">
						<a href="${root}/user/register.jsp" class="last">회원가입&nbsp;</a>|
						<a href="#" class="last">&nbsp;아이디 찾기&nbsp;</a>| <a href="#"
							class="last">&nbsp;비밀번호 찾기</a>
					</div>
				</form>
			</div>
		</div>
	</main>
</body>
<!--------------------------------------------------------------------------->
<script>
	document.querySelector(".login-btn").addEventListener("click", function() {
		if (!document.querySelector("#userId").value) {
			alert("아이디 입력!!");
			return;
		} else if (!document.querySelector("#password").value) {
			alert("비밀번호 입력!!");
			return;
		} else {
			let form = document.querySelector(".login-form");
			form.setAttribute("action", "${root}/user");
			form.submit();
		}
	});
</script>
</html>
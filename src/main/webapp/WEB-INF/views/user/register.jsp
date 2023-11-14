<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<link rel="stylesheet" href="${root}/assets/css/register.css" />
<style>
#userId {
	width: 100%;
}
#pwdcheck {
	border: 1px solid #a1ccd1;
	border-radius: 20px;
	height: 42px;
	margin-bottom: 20px;
	padding-left: 15px;
}
.form-select {
	height: 42px;
}

</style>
<body>
	<main class="container box">
	<div class="register-page" style="margin-top: 100px">
		<div class="title">
			<img src="${root}/assets/img/qq.png" class="login-logo" />
		</div>
		<div class="form">
			<form name="register-form" id="register-form" class="register-form"
				method="POST" action="">
				<input type="hidden" name="action" value="join"> 
				<div> <input id="name" name="name" type="text" placeholder="name" required />
				</div>
				<input id="userId" name="userId" type="text" placeholder="id" required />
				<div id="result-view" class="mb-3"></div>
				<div>
					<input id="password" name="password" type="password"
						placeholder="password" required />
				</div>
				<input type="password" class="form-control" id="pwdcheck"
					placeholder="password check" />
				<div class="mb-3">
					<div class="input-group">
						<input type="text" class="form-control" id="emailid" name="emailid" style="border-radius: 20px;" placeholder="email id" /> 
						<div style="padding: 7px;">@</div>
						<select class="form-select" style="border-radius: 20px;"
							id="emaildomain" name="emaildomain" aria-label="이메일 도메인 선택">
							<option selected>선택</option>
							<option value="ssafy.com">ssafy.com</option>
							<option value="google.com">google.com</option>
							<option value="naver.com">naver.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
				<button type="button" id="btn-join" class="regi-btn">회원 등록</button>
			</form>
		</div>
	</div>
	</main>

</body>
</html>
<!--------------------------------------------------------------------------->
<script>
	let isUseId = false;
	let input = document.querySelector("#userId");
	let resultDiv = document.querySelector("#result-view");
	// userId에 키보드로 칠 때
	input.addEventListener("keyup", function () {
	  let checkid = input.value;
	  let len = checkid.length;
	  if (len < 4 || len > 16) {
	    isUseId = false;
	    resultDiv.setAttribute("class", "mb-3 fw-bold text-dark");
	    resultDiv.innerHTML = "아이디는 4자이상 16자이하입니다.";
	  } else {
	    let url = "${root}/user?action=idcheck&checkid=" + checkid;
	    fetch(url)
	      .then((response) => response.text())
	      .then((data) => resultViewText(data));
	  }
	});
	
	function resultViewText(data) {
	  let val = data.split(",");
	  let id = val[0];
	  let cnt = val[1];
	  if (cnt == 0) {
	    isUseId = true;
	    resultDiv.setAttribute("class", "mb-3 text-success");
	    resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 있습니다.";
	  } else {
	    isUseId = false;
	    resultDiv.setAttribute("class", "mb-3 text-danger");
	    resultDiv.innerHTML = "<span class='fw-bold'>" + id + "</span>은 사용할 수 없습니다.";
	  }
	}
	
	function resultViewJSON(data) {
	  if (data.cnt == 0) {
	    isUseId = true;
	    resultDiv.setAttribute("class", "mb-3 text-primary");
	    resultDiv.innerHTML =
	      "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 있습니다.";
	  } else {
	    isUseId = false;
	    resultDiv.setAttribute("class", "mb-3 text-warning");
	    resultDiv.innerHTML =
	      "<span class='fw-bold'>" + data.checkid + "</span>은 사용할 수 없습니다.";
	  }
	}
	
	document.querySelector("#btn-join").addEventListener("click", function () {
	  if (!document.querySelector("#name").value) {
	    alert("이름 입력!!");
	    return;
	  } else if (!document.querySelector("#userId").value) {
	    alert("아이디 입력!!");
	    return;
	  } else if (!isUseId) {
	    alert("아이디 중복 확인!!");
	    return;
	  } else if (!document.querySelector("#password").value) {
	    alert("비밀번호 입력!!");
	    return;
	  } else if (
	    document.querySelector("#password").value != document.querySelector("#pwdcheck").value
	  ) {
	    alert("비밀번호 확인!!");
	    return;
	  } else {
	    let form = document.querySelector("#register-form");
	    form.setAttribute("action", "${root}/user");
	    form.submit();
	  }
	});
	
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<link rel="stylesheet" href="${root}/assets/css/login.css" />
<style>
.modal1-title {
	font-size: 20px;
	font-weight: bold;
}
.modal {
	margin-top: 100px;
}
.modal2-body {
	font-size: 17px;
}
#currUser-email {
	width: 70%;
}
.for-email {
	display: flex;
	flex-direction: row;
}

.email-update {
	height: 30px;
	display: block;
	margin-left: 5px;
}
#curPw, #newPw1, #newPw2 {
	width: 50%;
}
.make > div {
	margin-top: 10px;
	display: flex;
	justify-content: center;
}
.make > div > div {
	margin-top: 10px;
	width: 40%;
}
.btns {
	width: 70px;
	height: 35px;
	border: 2px solid #F1EFEF;
	border-radius: 20px;
}
.btns:hover {
	background-color: #D0E7D2;
	color: white;
}
.delete-btn:hover {
	background-color: #B4B4B3;
}
.form-select {
	width: 140px;
}
#emailid {
	width: 130px;
	margin-top: 20px;
}
.for-email2 {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}
.login-page {
  max-width: 600px;
}
</style>
<body>
	<main class="container box">
	<div class="login-page mypage" style="margin-top: 100px">
		<div class="title">
			<div class="top">My Page</div>
		</div>
		<div id="client-information">
			<table class="table">
				<thead>
					<tr>
						<div class="info">회원 정보 🥨</div>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="padding-top: 32px">Name</td>
						<td style="padding-top: 32px">${loginUser.userName}</td>
					</tr>
					<tr>
						<td style="padding-top: 32px">ID</td>
						<td id="currUser-userId"
							style="padding-top: 30px; text-align: left">${loginUser.userId}</td>
					</tr>
					<tr>
						<td style="padding-top: 32px">PW</td>
						<td id="currUser-userpw"
							style="padding-top: 30px; text-align: left">
							<button data-bs-target="#for-update" data-bs-toggle="modal" id="update-user-btn"
						 class="btns">변경</button></td>
					</tr>
					<tr>
						<td style="padding-top: 32px">E-mail</td>
						<td>
							<div class="for-email">
								<form name="updateEmail-form" id="updateEmail-form" method="POST" action="">
								<input type="hidden" name="action" value="updateEmail">
								<div class="for-email2">
									<input type="text" class="form-control" id="emailid" name="emailid" style="border-radius: 20px;" value= "${loginUser.emailId}" /> 
									<div style="padding: 7px;">@</div>
									<select class="form-select" style="border-radius: 20px;"
										id="emaildomain" name="emaildomain" aria-label="이메일 도메인 선택">
										<option selected>${loginUser.emailDomain}</option>
										<option value="ssafy.com">ssafy.com</option>
										<option value="google.com">google.com</option>
										<option value="naver.com">naver.com</option>
										<option value="kakao.com">kakao.com</option>
									</select>
									<div><button class="email-update btns">변경</button></div>
								</div>
								</form>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="form" style="width: 90%;">
			<form name="login-form" class="login-form">
				<div>
					<button class="delete-btn" data-bs-target="#for-delete"
						data-bs-toggle="modal" type="button">
						탈퇴하기 😢</button>
				</div>
			</form>
		</div>
	</div>
	<!-- 모달 start -->
	<div class="modal fade" id="for-update" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal1-title">❗ 비밀번호 변경</div>
				</div>
				<form name="updatePwd-form" id="updatePwd-form" method="POST" action="">
					<input type="hidden" name="action" value="updatePwd"> 
					<input type="hidden" name="curId" value="${loginUser.userId}"> 
					<div class="modal-body make">
						<div><div>현재 비밀번호</div><input type="password" id="curPw" name="curPw" required></div>
						<div><div>변경할 비밀번호</div><input type="password" id="newPw1" name="newPw1" required></div>
						<div><div>변경할 비밀번호 확인</div><input type="password" id="newPw2" name="newPw2" required></div>
						<div class="new-pw-check"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="button" onclick="updatePwd()"
							class="btn btn-primary updatePwdBtn">변경하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 모달 end --> 
	<!-- 모달 start -->
	<div class="modal fade" id="for-delete" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<div class="modal2-title">❗</div>
				</div>
				<div class="modal-body">
					<div class="modal2-body">정말 탈퇴하시겠습니까 ?</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" onclick="deleteUser()"
						class="btn btn-danger">탈퇴</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달 end --> 
	</main>
	<!--------------------------------------------------------------------------->
</body>
</html>
<script>
let newPwd = false;
let input1 = document.querySelector("#newPw1");
let input2 = document.querySelector("#newPw2");
let resultDiv = document.querySelector(".new-pw-check");

input1.addEventListener("keyup", function () {
	if (input1.value !== input2.value) {
		newPwd = false;
		resultDiv.textContent = "변경할 비밀번호가 일치하지 않습니다.";
	} else {
		newPwd = true;
		resultDiv.textContent = "";
	}
});
input2.addEventListener("keyup", function () {
	if (input1.value !== input2.value) {
		newPwd = false;
		resultDiv.textContent = "변경할 비밀번호가 일치하지 않습니다.";
  	} else {
		newPwd = true;
    	resultDiv.textContent = "";
  	}
});

//---------------수정 제출 전에 빈 input없애기, 비밀번호 8자 이상으로 하기,???
//------제출 후에 현재 비밀번호랑 맞는지 확인.
document.querySelector(".updatePwdBtn").addEventListener("click", function () {
	if (!document.querySelector("#curPw").value) {
		alert("현재 비밀번호를 입력해주세요.");
	    return;
	} else if (!document.querySelector("#newPw1").value) {
		alert("변경할 비밀번호를 입력해주세요.");
		return;
	} else if (!document.querySelector("#newPw2").value) {
		alert("변경할 비밀번호 확인을 입력해주세요.");
		return;
	} else if(!newPwd) {
		alert("변경할 비밀번호가 일치하지 않습니다.");
	} else {
		let form = document.querySelector("#updatePwd-form");
	    form.setAttribute("action", "${root}/user");
	    form.submit();
	}
});
//---------- 탈퇴
function deleteUser() {
	location.href = '${root}/user?action=deleteUser';
}

//------------- 이메일 수정
window.onload = function() {
    const emailInput = document.getElementById('emailid');
    const emailDomainSelect = document.getElementById('emaildomain');
    const emailUpdateBtn = document.querySelector('.email-update');
    let isUpdating = false; // 현재 이메일을 업데이트 중인지 확인하는 플래그
    
    // 초기 상태에서는 emailInput과 emailDomainSelect를 비활성화
    emailInput.disabled = true;
    emailDomainSelect.disabled = true;

    emailUpdateBtn.addEventListener('click', function() {
    	event.preventDefault(); // 기본 동작(여기서는 form 제출) 방지
        if (isUpdating) { 
            // 등록 버튼을 누른 경우, form을 서버로 전송
            let form2 = document.querySelector("#updateEmail-form");
	    	form2.setAttribute("action", "${root}/user");
	    	form2.submit();
            return;
        }

        // 변경 버튼을 누른 경우, Input 및 Select 활성화 및 버튼 텍스트 수정
        emailInput.disabled = false;
        emailDomainSelect.disabled = false;
        emailUpdateBtn.textContent = "등록";
        isUpdating = true;
    });
};

</script>

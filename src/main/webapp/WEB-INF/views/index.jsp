<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${root}/assets/css/main.css" />
<style>
body {
	background-image: url(./assets/img/jeju1.jpg);
	background-size: cover; /* 이미지를 화면에 꽉 채우도록 크기 조정 */
	background-repeat: no-repeat; /* 배경 이미지 반복 없음 */
	background-attachment: fixed; /* 스크롤 시 배경 이미지 고정 */
}

</style>

<body>
	<%@ include file="/include/head.jsp"%>
	<!-- 메인 페이지 start-->
	<!-- <main class="container box">
	<div class="admin-form" style="margin-top: 100px">
		<div class="title">
			<div class="top">공지사항</div>
		</div>
		<div id="announcements" class="text-area">
			모달로 공지사항 표시하게 만들기
		</div>
		<div class="title">
			<div class="top">진행중인 투표</div>
		</div>
		<div id="survey" class="text-area">
			<div id="poll-area"></div>
		</div>
	</div> -->
	<!-- 모달 start -->
	<!-- <div class="modal" id="for-delete" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<p>회원 정보를 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">아니오</button>
					<button type="button" onclick="deleteUser()"
						class="btn btn-primary">네</button>
				</div>
			</div>
		</div>
	</div> 
	</main>-->
	<!-- 모달 end --> 
	<!-- 메인 페이지 end-->

</body>
</html>

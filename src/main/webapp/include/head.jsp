<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test='${!empty param.msg}'>
	<c:set var='msg' value="${param.msg}" />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Enjoy trip</title>
<%-- 부트스트랩 사용을 위한 코드 --%>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" />
<%-- request 객체에 msg가 들어있을 때 해당 내용 알림창 띄우기 --%>
</head>
<style>
.fixed-top {
	background-color: white;
	font-weight: bold;
}
</style>
<body>
	<!-- 상단 navbar start -->
	<nav
		class="navbar navbar-expand-lg navbar-light fixed-top">
		<div class="container">
			<a class="navbar-brand text-black fw-bold" href="${root}/">
				<img src="${root}/assets/img/qq.png" alt="" style="width: 30px; margin-right: 10px;" />
          		<img src="${root}/assets/img/et.png" alt="" style="width: 80px; margin-right: 20px;" />
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav me-auto">
					<!-- <li class="nav-item">
                <a class="nav-link" href="#">공지사항</a>
              </li> -->
					<li class="nav-item"><a class="nav-link"
						href="${root}/hotPlace/hotPlaceMain">핫플찾기🚗</a></li>
					<li class="nav-item"><a class="nav-link" href="${root}/plan/planMain">여행계획🎈</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${root}/board/boardMain">정보공유✨</a></li>
				</ul>
				<!-- 로그인 전 -->
				<c:if test="${empty loginUser}">
					<ul class="navbar-nav mb-2 me-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${root}/user/register">회원가입 ✍🏻</a></li>
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="${root}/user/login">로그인</a></li>
					</ul>
				</c:if>
				<!-- 로그인 후 -->
				<c:if test="${!empty loginUser}">
				
					<ul class="navbar-nav mb-2 me-2 mb-lg-0">
						<li class="nav-item after"><a class="nav-link"
							aria-current="page" href="${root}/user/logout">로그아웃</a></li>
						<li class="nav-item after"><a class="nav-link"
							aria-current="page" href="${root}/user/mypage">마이페이지</a></li>
							
				</c:if>
				<%-- <c:if test="${empty userinfo}">
					<!-- 만약에 내가 관리자라면 -->
					<li class="nav-item dropdown admin"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							관리자 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#" data-bs-toggle="modal"
								data-bs-target="#pollModal">투표만들기</a></li>
							<li><a class="dropdown-item" data-bs-toggle="modal"
								data-bs-target="#announce-register" href="#">공지사항 등록</a></li>
							<li><a class="dropdown-item" href="#">회원관리</a></li>
						</ul></li>
				</c:if> --%>
				</ul>
			</div>
		</div>
	</nav>
	<!-- 상단 navbar end -->

	<!-- 설문조사 modal start -->
	<div class="modal fade" id="pollModal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<i class="bi bi-chat-left-dots-fill text-info"> 투표 만들기</i>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="">
						<div class="row mb-3 mt-3">
							<div class="col-md-6">
								<i class="bi bi-calendar2-date text-primary"></i> <label
									for="start-date" class="form-label">시작일:</label> <input
									type="date" class="form-control" id="start-date"
									name="start-date" />
							</div>
							<div class="col-md-6">
								<i class="bi bi-calendar2-date text-danger"></i> <label
									for="end-date" class="form-label">종료일:</label> <input
									type="date" class="form-control" id="end-date" name="end-date" />
							</div>
						</div>
						<div class="mb-3">
							<i class="bi bi-patch-question" style="color: rgb(121, 2, 119)"></i>
							<label for="question" class="form-label">질문제목:</label> <input
								type="text" class="form-control" id="question"
								placeholder="질문제목 입력..." name="question" />
						</div>
						<div class="mb-3">
							<i class="bi bi-pencil-square" style="color: rgb(14, 2, 121)"></i>
							<label for="question" class="form-label">답변항목:</label>
							<button type="button" id="btn-answer-add"
								onclick="addNewChecklist()"
								class="btn btn-outline-primary btn-sm">
								<i class="bi bi-plus-square-fill"></i> 추가
							</button>
						</div>
						<div id="poll-answer-list" class="row mb-3">
							<div class="row mb-1 poll-answer-list-item">
								<div class="col-md-10">
									<input type="text" class="form-control" name="answer" />
								</div>
							</div>
						</div>
					</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btn-poll-create" onclick="makeSurvey()"
						class="btn btn-primary btn-sm">투표생성</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 설문조사 modal end -->

	<!-- 공지사항 modal start -->
	<div class="modal fade" id="announce-register"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<i class="bi bi-chat-left-dots-fill text-info"> 공지사항 등록</i>
					</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form action="">
						<div class="mb-3">
							<i class="bi" style="color: rgb(121, 2, 119)"></i> <label
								for="announce-title" class="form-label">제목:</label> <input
								type="text" class="form-control" id="announce-title"
								placeholder="제목 입력..." name="announce-title" />
						</div>
						<div class="mb-3">
							<i class="bi" style="color: rgb(121, 2, 119)"></i> <label
								for="announce-content" class="form-label">내용:</label> <input
								type="text" class="form-control" id="announce-content"
								placeholder="내용 입력..." name="announce-content" />
						</div>
					</form>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id="btn-poll-create"
						onclick="makeAnnouncement()" class="btn btn-primary btn-sm">
						공지사항 등록</button>
					<button type="button" class="btn btn-outline-danger btn-sm"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 공지사항 modal end -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
	<script src="${root}/assets/js/admin.js"></script>
	<script>
	<c:if test="${!empty msg}">
		alert("${msg}");
	</c:if>
</script>
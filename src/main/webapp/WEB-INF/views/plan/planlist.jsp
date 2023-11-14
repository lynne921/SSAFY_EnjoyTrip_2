<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/head.jsp"%>
<style>
.big {
	margin-top: 120px;
}
.title {
	padding-top: 50px;
	margin-bottom: 30px;
	font-size: 25px;
	font-weight: bold;
	text-align: center;
}
.info {
	text-align: center;
	color: gray;
	font-size: 14px;
	margin-bottom: 30px;
}
</style>
<body>
	<%-- 
	<section id="about" class="about"
		style="background-color: #f5f9fc; padding-bottom: 60px">
		<div class="container" data-aos="fade-up">
			<div class="row" style="background-color: white">
				<div class="row-lg-6 mt-5">
					<div class="row-lg-6">
						<h2 class="text-center fw-bold">나의 여행 계획🚗</h2>
						<p class="text-center fst-normal">나만의 여행길을 그려보세요!</p>
						<!-- 관광지 검색 start -->
						<form id="search-form" class="d-flex mt-3 justify-content-center"
							role="search">
							<select name="areacode" id="search-area" class="form-select m-2"
								aria-label="Default select example" style="width: 20%;">
								<option value="0" selected>지역</option>
							</select> <select name="sigunguCode" id="search-sigungu"
								class="form-select m-2" aria-label="Default select example"
								style="width: 20%;">
								<option value="0" selected>시/군/구</option>
							</select> <select name="content" id="search-content-id"
								class="form-select m-2" aria-label="Default select example"
								style="width: 20%;">
								<option value="12">관광지</option>
								<option value="14">문화시설</option>
								<option value="15">축제공연행사</option>
								<option value="25">여행코스</option>
								<option value="28">레포츠</option>
								<option value="32">숙박</option>
								<option value="38">쇼핑</option>
								<option value="39">음식점</option>
							</select>
							<button id="btn-search" class="btn btn-outline-success m-2"
								type="submit" style="width: 10%;">검색</button>
						</form>
					</div>
				</div>
				<div class="row-lg-6 about-content">
					<div id="map" style="width: 100%; height: 600px"></div>
				</div>
			</div>
		</div>
	</section>
--%>
	<main id="main">
		<!-- 메인 컨텐츠 시작 -->
		<div class="container big">
			<!-- 관광지 조회 섹션 -->
			<section id="search" class="search">
				<!-- 관광지 조회 타이틀 -->
				<div class="row d-flex justify-content-center">
					<div class="title">나의 여행 계획🚗</div>
					<div class="info">나만의 여행길을 그려보세요!</div>
				</div>
				<!-- 타이틀 종료 -->
<%-- 
				<div class="row d-flex justify-content-center ">
					<div class="col-lg-10 text-center">
						<form class="d-flex my-3" onsubmit="return false;" role="search">
							<select id="search-area" class="form-select me-2">
								<option value="0" selected>검색 할 지역 선택</option>
								<c:forEach var="article" items="${sido}">
									<option value="${article.sidoCode}" id="">${article.sidoName}</option>
								</c:forEach>
							</select> <select id="search-area-area" class="form-select me-2">
								<option value="0" selected>검색 할 세부지역 선택</option>
							</select> <select id="search-content-id" class="form-select me-2">
								<option value="0" selected>관광지 유형</option>
								<option value="12">관광지</option>
								<option value="14">문화시설</option>
								<option value="15">축제공연행사</option>
								<option value="25">여행코스</option>
								<option value="28">레포츠</option>
								<option value="32">숙박</option>
								<option value="38">쇼핑</option>
								<option value="39">음식점</option>
							</select>
							<button id="btn-search" class="btn btn-outline-success"
								type="button">검색</button>
						</form>
					</div>
				</div> 
				--%>
				<!-- kakao map start -->
				<div id="map" class="mt-3" style="width: 100%; height: 550px">

				</div>
				<!-- kakao map end -->

			</section>
			<!-- End 관광지 조회 섹션 -->
		</div>
		<!-- 메인 컨텐츠 -->
	</main>
	<!-- End #main -->


	<%@ include file="/include/footer.jsp"%>

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>


	<%--                       --%>
	<!-- Kakao Map-->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc9467904205bd5cecf5ff8eff0b4713&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="${root}/assets/js/plan.js"></script>

</body>

</html>

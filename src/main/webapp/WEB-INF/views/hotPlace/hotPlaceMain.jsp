<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/include/head.jsp"%>
<style>
.big {
	margin-top: 120px;
}
#btn-search{
	width: 200px;
}
.title {
	padding-top: 50px;
	margin-bottom: 30px;
	font-size: 25px;
	font-weight: bold;
}
.col-3 {
	border-radius: 20px;
	box-shadow: 0 0 3px gray;
}
.title2 {
	margin-top: 30px;
	margin-bottom: 30px;
	font-weight: bold;
	font-size: 17px;
	background-color: white;
	height: 40px;
	width: 170px;
	text-align: center;
	padding-top: 6px;
	border: 1px solid lightgray;
	border-radius: 20px;
}
.nemo {
	border: 2px solid pink;
	width: 100%;
	height: 100%;
}
.myplace {
	display: flex;
	justify-content: center;
	align-content: center;
}
</style>
<body>
	<main id="main">
		<!-- 메인 컨텐츠 시작 -->
		<div class="container big">
			<!-- 관광지 조회 섹션 -->
			<section id="search" class="search">
				<!-- 관광지 조회 타이틀 -->
				<div class="row d-flex justify-content-center title">
					<div class="col-lg-6 text-center">
						<div>지역별 핫플 ✨</div>
					</div>
				</div>
				<!-- 타이틀 종료 -->

				<div class="container">
		            <div class="row">
		                <div class="col-9">
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
						<!-- kakao map start -->
						<div id="map" class="mt-3" style="width: 100%; height: 550px">
							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc9467904205bd5cecf5ff8eff0b4713"></script>
						</div>
						<!-- kakao map end -->
		                </div>
		                <div class="col-3">
		                	<div class="row myplace">
		                		<div class="title2">상세정보💡 </div>
		                	</div>
		                	<div class="row myplace">
			                	<!-- <div class="nemo" style="height: 100px;">네모</div>
			                	<div class="nemo">네모</div>
			                	<div class="nemo">네모</div> -->
		                	</div>
		                </div>
		            </div>
		        </div>
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


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc9467904205bd5cecf5ff8eff0b4713&libraries=services,clusterer,drawing"></script>
	<script type="module" src="${root}/assets/js/map.js"></script>
</body>

</html>

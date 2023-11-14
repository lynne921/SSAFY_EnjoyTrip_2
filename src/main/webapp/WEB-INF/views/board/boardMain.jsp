<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<link rel="stylesheet" href="${root}/assets/css/board.css" />
<!--------------------------------------------------------------------------->
</head>
<body>
	<!--------------------------------------------------------------------------->
	<div class="board-title" style="margin-top: 150px;">정보 공유 게시판</div>
	<div class="info">여러분의 경험을 공유해주세요 👀 ❣</div>
	<div class="btn-cls">
		<button type="button" class="btn write-btn" data-bs-toggle="modal"
			data-bs-target="#myModal">
			<!-- onclick="check_login()"  -->
			글쓰기 ✍🏻
		</button>
	</div>

	<div id="board-container"></div>
	<!-- 모달창 --------------------------------------------->
	<!-- The Modal -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">글쓰기 ✍🏻</h5>
				</div>
				<!-- Modal body -->
				<form action="${root}/board/insertReview" name="rb" id="rb"
					method="post" enctype="multipart/form-data">
					<div class="modal-body">
						<div class="mb-3">
							<i class="bi bi-pencil-square" style="color: rgb(121, 2, 119)"></i>
							<label for="question" class="form-label">Title</label> <input
								type="text" class="form-control" id="b-title"
								placeholder="제목을 입력해주세요" name="subject" />
						</div>
						<div class="mb-3">
							<i class="bi bi-pencil-square" style="color: rgb(14, 2, 121)"></i>
							<label for="question" class="form-label">Content</label>
						</div>
						<div id="poll-answer-list" class="row mb-3">
							<textarea class="form-control" rows="5" id="b-content"
								placeholder="내용을 입력해주세요" name="content"></textarea>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-success">등록</button>
					</div>
				</form>

			</div>
		</div>
	</div>

	<!--------------------------------------------------------------------------->
	<%-- <script src="${root}/assets/js/board.js"></script> --%>
</body>
</html>

<script>
	/* localStorage.setItem('userId', 'sss'); */
</script>
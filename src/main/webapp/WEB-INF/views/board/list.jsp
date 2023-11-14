<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/head.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/assets/css/board.css" />
<body>
	<div class="pt-4 container">
		<div class="mb-4 text-center">
			<div class="board-title" style="margin-top: 150px;">정보 공유 게시판</div>
			<div class="info">여러분의 경험을 공유해주세요 👀 ❣</div>
			<div class="mt-4 container">
				<div class="row mb-2 justify-content-between">
					<div class="mr-auto ml-2 col-auto">
						<button type="button"
							onclick="location.href='${root}/article?action=mvwrite'"
							class="btn btn-secondary">글쓰기 ✍</button>
					</div>
					<div class="mr-2 col-auto">
						<form class="row row-cols-lg-auto g-3 align-items-center"
							id="form-search" action="">
							<input type="hidden" name="action" value="list" /> <input
								type="hidden" name="pgno" value="1" />
							<div class="col-auto">
								<label class="visually-hidden" for="inlineFormSelectPref">Preference</label>
								<select class="form-select" name="key" id="key">
									<option selected>검색조건</option>
									<option value="article_no">글번호</option>
									<option value="subject">제목</option>
									<option value="user_id">작성자</option>
								</select>
							</div>

							<div class="col-auto">
								<input type="text" name="word" id="word"
									class="mr-1 form-control" placeholder="검색어 입력" />
							</div>

							<div class="col-auto">
								<button type="button" id="btn-search"
									class="btn btn-outline-primary">검색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<table class="table" id = "boardLst">
						<thead>
							<tr>
								<th onclick="BsortList(0)" style="cursor: pointer" scope="col" id="artiNo">글번호</th>
								<th scope="col">제목</th>
								<th onclick="BsortList(1)" style="cursor: pointer" scope="col" id="writer">작성자</th>
								<th onclick="QsortList(2)" style="cursor: pointer" scope="col" id="viewCnt">조회수</th>
								<th onclick="QsortList(3)" style="cursor: pointer" scope="col" id="regTime">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="article" items="${articles}">
								<tr class="text-center"
									onclick="location.href='${root}/article?action=view&articleno=${article.articleNo}'">
									<th scope="row">${article.articleNo}</th>
									<td class="text-start"><a href="#"
										class="article-title link-dark" data-no="${article.articleNo}"
										style="text-decoration: none"> ${article.subject} </a></td>
									<td>${article.userId}</td>
									<td>${article.hit}</td>
									<td>${article.registerTime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="row">${navigation.navigator}</div>
			</div>
		</div>
	</div>
	<form id="form-param" method="get" action="">
		<input type="hidden" id="p-action" name="action" value=""> 
		<input type="hidden" id="p-pgno" name="pgno" value=""> 
		<input type="hidden" id="p-key" name="key" value=""> 
		<input type="hidden" id="p-word" name="word" value="">
	</form>
	<script>
		document.querySelector("#btn-search").addEventListener("click",
				function() {
					let form = document.querySelector("#form-search");
					form.setAttribute("action", "${root}/article");
					form.submit();
				});

		let pages = document.querySelectorAll(".page-link");
		pages.forEach(function(page) {
			page.addEventListener("click", function() {
				console.log(this.parentNode.getAttribute("data-pg"));
				document.querySelector("#p-action").value = "list";
				document.querySelector("#p-pgno").value = this.parentNode
						.getAttribute("data-pg");
				document.querySelector("#p-key").value = "${param.key}";
				document.querySelector("#p-word").value = "${param.word}";
				document.querySelector("#form-param").submit();
			});
		});
		
		function BsortList(item){
            var table, rows, switching, o, x, y, shouldSwitch, dir, switchCount = 0;
            table = document.getElementById("boardLst");
            switching = true;
            dir = "asc";
            console.log("sort value " + item);
            
            while(switching){
                switching = false;
                rows = table.getElementsByTagName("tr");

                for(o = 1; o < (rows.length -1); o++){
                    shouldSwitch = false;
                    x = rows[o].getElementsByTagName("td")[item];
                    y = rows[o+1].getElementsByTagName("td")[item];
                    console.log(x.innerHTML)
                    
                    if (dir == "asc"){
                        if(x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()){
                            shouldSwitch = true;
                            break;
                        }
                    } else if (dir == "desc"){
                        if(x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()){
                            shouldSwitch = true;
                            break;
                        }
                    }
                }
                
                if(shouldSwitch){
                    rows[o].parentNode.insertBefore(rows[o+1], rows[o]);
                    switching = true;
                    switchCount++;
                }else{
                    if(switchCount == 0 && dir == "asc"){
                        dir = "desc";
                        switching = true;
                    }
                }
            }
        } 
		
		function QsortList(item) {
		    var table = document.getElementById("boardLst");
		    var rows = Array.from(table.getElementsByTagName("tr")).slice(1); // Ignore the header

		    rows = quickSort(rows, item);

		    for (var i = 0; i < rows.length; i++) {
		        table.appendChild(rows[i]);
		    }
		}

		function quickSort(rows, item) {
		    if (rows.length <= 1) {
		        return rows;
		    }

		    var pivotRow = rows[rows.length - 1];
		    var pivotValue = pivotRow.getElementsByTagName("td")[item].innerHTML.toLowerCase();

		    var left = [];
		    var right = [];

		    for (var i = 0; i < rows.length - 1; i++) {
		        var rowValue = rows[i].getElementsByTagName("td")[item].innerHTML.toLowerCase();
		        if (rowValue < pivotValue) {
		            left.push(rows[i]);
		        } else {
		            right.push(rows[i]);
		        }
		    }
		    return quickSort(left, item).concat(pivotRow, quickSort(right, item));
		}
		
	</script>

	<main id="main"></main>
	<!-- End #main -->


	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

</body>

</html>
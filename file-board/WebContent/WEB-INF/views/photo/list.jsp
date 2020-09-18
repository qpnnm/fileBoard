<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
h2 {
	text-align: center;
	color: blue;
}

button {
	float: right;
}

td {
	color: link;
}

table {
	
}

#choice {
	width: 30px;
}

#cc {
	display: inline;
	width: 200px;
}
</style>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사진게시판</h2>
	<div class="search">
		<form method="GET" action="/photo/list">
			제목 : <input class="form-control form-control-sm" type="text"
				name="pbTitle" value="${param.pbTitle}" id="cc"> 내용 : <input
				class="form-control form-control-sm" type="text" name="pbContent"
				value="${param.pbContent}" id="cc"><br> 일자 : <input
				class="form-control form-control-sm" type="Date" name="credat1"
				value="${param.credat1}" id="cc"> - <input
				class="form-control form-control-sm" type="date" name="credat2"
				value="${param.credat2}" id="cc"><br> <input
				class="form-control" type="hidden" name="page.pageNum" value="1">
			<button class="btn btn-info">검색</button>
		</form>
	</div>
	<form method="POST" action="/photo/delete">
		<table class="table table-bordered">

			<thead>
				<tr>
					<th id="choice"><input type="checkbox"
						onchange="allCheck(this)" id="allChk"></th>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>파일이름</th>
					<th>파일경로</th>
					<th>작성일</th>
					<th>작성시간</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${empty pbList}">
					<tr>
						<td>내용이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty pbList}">
					<c:forEach items="${pbList}" var="pb">
						<tr>
							<td id="choice"><input type="checkbox" name=pbNums
								value="${pb.pbNum}"></td>
							<td>${pb.pbNum}</td>
							<td scope="row"><a href="/photo/update">${pb.pbTitle}</a></td>
							<td>${pb.pbContent}</td>
							<td>${pb.pbPhotoName}</td>
							<td><c:if test="${pb.pbPhotoPath!=null}">
									<a href="/resources/${pb.pbPhotoPath}" target=blank> <img
										src="/resources/${pb.pbPhotoPath}" width="50px">${pb.pbPhotoPath}</a>
								</c:if></td>
							<td>${pb.credat}</td>
							<td>${pb.cretim}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>


		</table>
		<div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link"
						href="/photo/list?page.pageNum=${page.pageNum-1}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${param.credat1}&credat2=${param.credat2}"
						tabindex="-1" aria-disabled="true">Previous</a></li>
					<c:forEach begin="${page.startBlock}" end="${page.endBlock}"
						var="idx">

						<li class="page-item"><a class="page-link"
							href="/photo/list?page.pageNum=${idx}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${param.credat1}&credat2=${param.credat2}"><c:choose>
									<c:when test="${idx eq page.pageNum}">
										<b>${idx}</b>
									</c:when>

									<c:when test="${idx ne page.pageNum}">${idx}</c:when>
								</c:choose> </a></li>

					</c:forEach>
					<li class="page-item"><a class="page-link"
						href="/photo/list?page.pageNum=${page.pageNum+1}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${param.credat1}&credat2=${param.credat2}">Next</a></li>
				</ul>
			</nav>
		</div>
		<button class="btn btn-danger">삭제</button>

	</form>
	<a href="/photo/write"><button class="btn btn-success ">글쓰기</button></a>
	<!-- <a href="update.jsp"><button class="btn btn-link">수정하기</button></a> -->
	<script>
		function allCheck(obj) {

			var chkObjs = document.querySelectorAll('input[name=pbNums]');
			for (var i = 0; i < chkObjs.length; i++) {
				chkObjs[i].checked = obj.checked;

			}
		}
	</script>
</body>
</html>
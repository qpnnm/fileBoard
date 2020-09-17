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
</style>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>사진게시판</h2>

	<table class="table">
		<thead>
			<tr>

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
						<td>${pb.pbNum}</td>
						<td>${pb.pbTitle}</td>
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
				<li class="page-item disabled"><a class="page-link" href="#"
					tabindex="-1" aria-disabled="true">Previous</a></li>
				<c:forEach begin="${page.startBlock}" end="${page.endBlock}"
					var="idx">

					<li class="page-item"><a class="page-link"
						href="/photo/list?page.pageNum=${idx}"><c:choose>
								<c:when test="${idx eq page.pageNum}">
									<b>${idx}</b>
								</c:when>

								<c:when test="${idx ne page.pageNum}">${idx}</c:when>
							</c:choose> </a></li>

				</c:forEach>
				<li class="page-item"><a class="page-link"
					href="/photo/list?page.pageNum=${page.pageNum+1}">Next</a></li>
			</ul>
		</nav>
	</div>
	<a href="/photo/write"><button class="btn btn-primary ">글쓰기</button></a>
</body>
</html>
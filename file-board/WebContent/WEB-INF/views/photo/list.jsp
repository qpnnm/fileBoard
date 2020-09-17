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

color:link;

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

	<a href="/photo/write"><button class="btn btn-primary ">글쓰기</button></a>
</body>
</html>
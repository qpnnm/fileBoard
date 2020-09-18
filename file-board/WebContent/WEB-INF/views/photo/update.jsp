<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hi

	<form method="POST" action="/photo/update">
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>번호</th>
					<th>번호</th>
					<th>번호</th>
					<th>번호</th>
				</tr>
			</thead>


			<tbody>
				<tr>
					<td>${pbList}</td>
					<td>${pbList}</td>
					<td>${pbList}</td>
					<td>${pbList}</td>
					<td>${pbList}</td>

				</tr>


			</tbody>
		</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/head.jsp"></jsp:include>
<style>
input {
	width: 300px;
	display: block;
}

textarea {
	display: block;
	width: 4000px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="/photo/write" enctype="multipart/form-data">
		제목:<input type="text" name="pbTitle"><br> 내용:
		<textarea name="pbContent"></textarea><br> 
		사진:<input type="file" name="pbFile"><br>
		<button class="btn btn-link">업로드</button>
	</form>
</body>
</html>
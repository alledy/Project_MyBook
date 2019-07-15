<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지명</title>
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm fixed-top">
		<a class="my-0 mr-md-auto"
			href="${pageContext.request.contextPath}/main"><img class="logo" src="images/logo.svg" width="38" height="37"></a>
		<nav class="my-2 my-md-0 mr-md-3">
			<a class="p-2 text-dark" href="${pageContext.request.contextPath}/readBook?action=readBook&id=4">내 서재</a> 
			<a class="p-2 text-dark" href="#">내 정보</a>
		</nav>
		<nav class="my-2 my-md-0 mr-md-3">
			<a class="btn btn-outline-primary"
				href="${pageContext.request.contextPath}/signIn?action=signIn&id=2">로그인</a>
			<a class="btn btn-outline-primary"
				href="${pageContext.request.contextPath}/signUp?action=signUp&id=1">회원가입</a>
		</nav>
	</div>
</body>
</html>
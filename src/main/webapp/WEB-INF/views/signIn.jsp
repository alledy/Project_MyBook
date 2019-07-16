<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>홈페이지명</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/signin.css">
<style>
.divider-text {
	position: relative;
	text-align: center;
	margin-top: 15px;
	margin-bottom: 15px;
}

.divider-text span {
	padding: 7px;
	font-size: 12px;
	position: relative;
	z-index: 2;
}

.divider-text:after {
	content: "";
	position: absolute;
	width: 100%;
	border-bottom: 1px solid #ddd;
	top: 55%;
	left: 0;
	z-index: 1;
}

.row{
	margin: 0 auto;
}

.logo{
	margin : 16px 0px 12px 80px;
}
</style>
<!-- Custom styles for this template -->
</head>
<body class="text-center">

<div class="card bg-light">
	<article class="card-body mx-auto" style="max-width: 400px;">
	<div class="row">
		<a href="/book/"><img class="logo" src="images/logo.svg" width="38" height="37"></a>
		<h4 class="card-title mt-3 text-center">로그인</h4>
	</div>
			<!-- 네이버 로그인 버튼 -->
			<a href="${url}" class="btn btn-block " ><img src="images/naverbutton.PNG" width="210px" height="40px"></a>
		<p class="divider-text">
			<span class="bg-light">OR</span>
		</p>
		
		<!-- 로그인 폼태그 시작 -->
		<form action="/book/signin" method="POST" >
			<!-- 이메일 아이디 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-envelope"></i>
					</span>
				</div>
				<input id="userId" name="userId" class="form-control" placeholder="example@exam.com" type="email" required autofocus>
				<span class="check_font" id="id_check"></span>
			</div>
			
			<!-- 비밀번호 -->
			<div class="form-group input-group">
				<div class="input-group-prepend">
					<span class="input-group-text"> <i class="fa fa-lock"></i>
					</span>
				</div>
				<input id="userPass" name="userPass" class="form-control" placeholder="비밀번호를 입력해주세요." type="password">
				<span class="check_font" id="pass_check"></span>
			</div>
			
			<!-- 로그인 버튼 -->
			<div class="form-group">
				<input id="signin" type="submit" class="btn btn-primary btn-block" value="로그인">
			</div>
			
			<!-- 회원가입 링크 -->
			<p class="text-center">
				아직 회원가입을 안하셨나요?
				<a href="/book/signup?action=signup&id=2"> 회원가입</a>
			</p>
			
			<!-- 아이디, 비밀번호 찾기 링크 -->
			<p class="text-center">
				<!-- <a href="#"> 아이디 찾기/비밀번호 찾기</a> -->
				<button id="searchId" onclick="search()">아이디/비밀번호 찾기</button>
			</p>
		</form>
		<!-- 로그인 폼태그 끝 -->
		
	</article>
</div>



<script>
 function search(cv) {
	window.open("/book/search", "아이디 찾기", "width=500, height=620, left=100, top=50");
} 

//이메일아이디 검사 정규식 : -_특수문자 가능하며 중앙에 @ 필수 그리고 . 뒤에 2~3글자 필요
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
/* String regexp = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$"; //이메일 정규 표현식 */
//비밀번호 정규식 : A~Z, a~z,,0~9로 시작하는 4~12자리 비밀번호 가능
var pwJ = /^[A-Za-z0-9]{4,16}$/;
var text;
var check;
//이메일아이디 정규식
$("#userId").keyup(function() {
	var val = $("#userId").val();
	if(val != "") {
		if(mailJ.test(val)) {
			text="";
			check=false;
		} else {
			text="유효하지 않은 양식입니다.";
			check=true;
		}
		$("#id_check").text(text);
		$("#id_check").css("color", "red");
		$("#signin").attr("disabled", check);	
	}
});

//비밀번호 유효성 검사(숫자, 문자로만 4~12자리)
$("#userPass").keyup(function() {
	var val = $("#userPass").val();
	if(val != "") {
		if(pwJ.test(val)) {
			text="";
			check=false;
		} else {
			text="숫자 or 문자로만 4~12자리 입력가능합니다.";
			check=true;
		}
		$("#pass_check").text(text);
		$("#pass_check").css("color", "red");
		$("#signin").attr("disabled", check);	
	}
});

function searchFunc(e) {  
	var keyword = $('input[name=keyword]').val();

    var url = "bookList.do?keyword=" + keyword;
    if(e.type == "keydown" && e.keyCode != 13) { return; } 
    
    $.ajax({
        url: url,
        type: 'GET', 
        success: function(data){
        	$('body').html(data);
            $('#myModal').modal('show'); 
        }
    });
}

$(function(){
    $('#submitForm').on('click', searchFunc);   
    $('input[name=keyword]').on('keydown', searchFunc);   
    $('.close').on('click', function() {
    	$.ajax({
            url: "bookList.do",
            type: 'GET', 
            success: function(data){
            	$('body').html(data);
            }
        });
    });   
});


</script>
</body>
</html>
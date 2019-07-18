<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>ㅊㅊ</title>

	<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS CDN -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="css/style.css?a">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

    <!-- Font Awesome JS -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>
	<script src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
</head>

<body>

    <div class="wrapper">
    
         <div style="z-index:500">
	        <a href="${pageContext.request.contextPath}/" class="brand-logo-main" >
				<div class="container">
					<div class="row" id="tooltip">
						<div class="col-sm-auto pr-0 mt-2">		
							CHACK<br>CHECK
						</div>
						<div class="col-sm-auto pl-1">
							<img src="images/book.jpg" style="width: 55px">
						</div>
					</div>	
					<div class="p-3" id="tooltiptext">안녕하세요! 책첵은 처음인가요?<br>회원가입 후 첫 서평을 작성해보세요:)</div>
				</div>
			</a>		
         </div>
    
  		<!-- left Sidebar 시작 -->
        <nav id="sidebar">

            <div class="sidebar-header p-3">
            	<a href="${pageContext.request.contextPath}/" class="brand-logo">
					CHACKCHECK
				</a>
            </div>

            <ul class="list-unstyled components">
                <!-- <p>Dummy Heading</p> -->
                <li>
                	<form id="leftSideBar" action="${pageContext.request.contextPath}/" method="get">
	                	<input id="leftSideBarColor" type="submit" value="메인">
	                </form>
                </li>
                <c:choose>
	                <c:when test="${ !empty status }">
		                <li class="active">
		                	<form id="leftSideBar" action="readBook" method="get">
			                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
			                		<input id="leftSideBarColor" type="submit" value="내 서재">
			                	</a>
			               	</form>
		                    <ul class="collapse list-unstyled" id="bookSubmenu">
		                        <li>
		                        	<form id="leftSideBar" action="readBook" method="post">
			                			<input id="leftSideBarColor" type="submit" value="읽은 책">
			                		</form>
		                        </li>
		                        <li>
		                        	<form id="leftSideBar" action="interestBook" method="get">
			                			<input id="leftSideBarColor" type="submit" value="관심 책">
			                		</form>
		                        </li>
		                    </ul>
		                </li>
		                <li>
		                	<form id="leftSideBar" action="myPage" method="get">
			                	<input id="leftSideBarColor" type="submit" value="내 정보">
			                </form>
		                </li>
	                </c:when>
	                <c:otherwise>
	                	<li class="active">
		                	<form id="leftSideBar" action="readBook" method="get">
			                	<a href="#bookSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
			                		<input id="leftSideBarColor" type="submit" value="내 서재">
			                	</a>
			               	</form>
		                    <ul class="collapse list-unstyled" id="bookSubmenu">
		                        <li>
		                        	<form id="leftSideBar" action="signIn" method="post">
			                			<input id="leftSideBarColor" type="submit" value="읽은 책">
			                		</form>
		                        </li>
		                        <li>
		                        	<form id="leftSideBar" action="signIn" method="get">
			                			<input id="leftSideBarColor" type="submit" value="관심 책">
			                		</form>
		                        </li>
		                    </ul>
		                </li>
		                <li>
		                	<form id="leftSideBar" action="signIn" method="get">
			                	<input id="leftSideBarColor" type="submit" value="내 정보">
			                </form>
		                </li>
	                </c:otherwise>
                </c:choose>
            </ul>
        </nav>
		<!-- left Sidebar 끝 -->
	
        <!-- Page Content 시작 -->
        <div id="content">

			<!-- navbar 시작 -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-outline-secondary">
                        <i class="fas fa-align-left"></i>
                        <span>메뉴</span>
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <c:if test="${empty status}">
		                            <li class="nav-item active">
		                            	<form action="signIn" method="get">
			                                <input id="signColor" type="submit" value="로그인" class="nav-link">
			                            </form>
		                            </li>
		                            <li class="nav-item active">
			                            <form action="signUp" method="get">
			                                <input id="signColor" type="submit" value="회원가입" class="nav-link">
			                            </form>
		                            </li>
	                            </c:if>
	                            <c:if test="${!empty status}">
	                            	<li class="nav-item active">
		                            	<form action="${pageContext.request.contextPath}/signOut" method="get">
			                                <input id="signColor" type="submit" value="로그아웃" class="nav-link">
			                            </form>
		                            </li>
	                            </c:if>                        
                        </ul>
                    </div>
                </div>
            </nav>
			<!-- navbar 끝 -->
			
			<!-- 컨텐트 추가 시작 -->
            <h2>활동로그</h2>
            <p>추후에 활동로그 추가</p>

            <div class="line"></div> <!-- 구분선 -->

            <h2>트렌드</h2>
            <p>추후에 트렌드 추가</p>

            <div class="line"></div>
            <!-- 컨텐트 추가 끝 -->

        </div>
        <!-- Page Content 끝 -->
        <div class="overlay"></div>
        
    </div>
    
    <!-- jQuery Custom Scroller CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	

    <script type="text/javascript">
    	
        $(document).ready(function () {
        	// hide sidebar when refresh the page
            $('#sidebar').toggleClass('active');
 
        	$("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });
            
            $('#sidebarCollapse').on('click', function () {
            	// open sidebar when clicked
                $('#sidebar, #content').toggleClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
            
            $('#tooltip').hover(function(){
            	//$( '#tooltiptext' ).removeClass( 'invisible' );
            	$( '#tooltiptext' ).animate({opacity: "1"}, 1000);
      
            });
            $('#tooltip').mouseleave(function(){
            	$( '#tooltiptext' ).animate({opacity: "0"}, 500);
            	//$( '#tooltiptext' ).fadeTo("fast", 0);
            	//$( '#tooltiptext' ).addClass( 'invisible' );
             });
        });
    </script>
</body>
</html>
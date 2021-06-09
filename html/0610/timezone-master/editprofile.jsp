<%@page import="memberPackege.MemberDAO"%>
<%@page import="memberPackege.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>DIT Computer Shop</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/flaticon.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style type = "text/css">
    	table {
    		font-size : 16pt;
    	}
    	
    </style>
    
    <style>
    	.dropdown {
    		position: relative;
    		display: inline-block;
    	}
    	
    	.dropdown-content {
    		display: none;
    		position: absolute;
			background-color: #f1f1f1;
			min-width: 100px;
			box-shadow: 0px 4px 12px 0px rgba(0,0,0,0.2);
			z-index: 1;
    	}
    	.dropdown-content a {
    		font-size: 12px;
    		color: black;
			padding: 8px 12px;
			text-decoration: none;
			display: block;
    	}
    	.dropdown-content a:hover {background-color: #ddd;}

		.dropdown:hover .dropdown-content {display: block;}
		
		.section_padding {
			padding-bottom : 0px;
		}
		.btn_3 {
			width : 410px;
			height : 0px;
			text-align : center;			
			vertical-align : middle;
			padding-bottom : 36px;
		}
		
	
    </style>
    
</head>
<%	
	String sessionId = (String)session.getAttribute("sessionId");
	MemberDTO dto = new MemberDTO();
	MemberDAO dao = new MemberDAO();
	dto = dao.SetEditProfile(sessionId);	// 로그인할 때 받은 id세션값 삽입
%>

<body>
    <!--? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/ditlogo.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <header>
        <!-- Header Start -->
        <div class="header-area">
            <div class="main-header header-sticky">
                <div class="container-fluid">
                    <div class="menu-wrapper">
                        <!-- Logo -->
                        <div class="logo"> <a href="index.jsp"><img src="assets/img/logo/ditlogo.png" width = "80" height = "50"></a>
                        </div>
                        <!-- Main-menu -->
                        <div class="main-menu d-none d-lg-block">
                            <nav>                                                
                                <ul id="navigation">  
                                    <li><a href="welcome.jsp">회사소개</a>
                                    	<ul class="submenu">
                                        <li><a href="welcome.jsp">인사말</a></li>
                                        <li><a href="howto.jsp">오시는길</a></li>
                                    </ul>
                                    </li>
                                    <li><a href="shop.jsp">PC주요부품</a></li>
                                    <li><a href="vshop.jsp">PC견적</a></li>
                                    <li><a href="about.jsp">커뮤니티</a></li>
                                    <li><a href="admin.jsp">관리자</a>
                                    	<ul class="submenu">
                                        <li><a href="admininsert.jsp">등록</a></li>
                                        <li><a href="admin.jsp">수정</a></li>
                                    	</ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                            <ul>
                                <% // 세션에 로그인 값이 존재할경우
                                if(dao.SessionCheck(sessionId)) {	
                                %>
                            	 
	                            <li>
	                                <div class = "dropdown"><span class="flaticon-user"></span>
	                                	<div class = "dropdown-content">
	                                		<a href = "editprofile.jsp">개인정보수정</a>
	                                		<a href = "buylist.jsp">주문조회</a>
	                                		<a href = "Logout.jsp">로그아웃</a>
	                                	</div>
                                	</div>
                                </li>
                                <%	 
                                }
                                else { // 로그인 상태가 아닐경우
                                %>
                                <li> <a href="login.jsp"><span class="flaticon-user"></span></a></li>
                                <%
                                }
                                %>
                                <li><a href="cart.jsp"><span class="flaticon-shopping-cart"></span></a> </li>
                            </ul>
                            
                        </div>
                    </div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
    </header>
     <main>
        <!-- Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>My Profile</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End-->
        <!--================login_part Area =================-->
        <section class="login_part section_padding">
            <div class="container">
                <div class="d-flex justify-content-center">
                    <div class="col-lg10 col-md-10">
                    <div class="d-flex justify-content-center">
                        <div class="login_part">
                            <div class="login_part_form_iner">
                                
                                <form class="row contact_form" action="EditProfilePro.jsp" method="post" novalidate="novalidate">
                                
                                <table>
                    	            <tr>
                	    	            <td>아이디</td>
                            	    	<td>
                                    	    <input type="text" class="form-control" id="edit_id" name="edit_id" value="<%=dto.getId()%>" readonly>
                                	    </td>
                                    </tr>
                                    <tr>
            	                        <td>비밀번호</td>
                                    	<td>
                                        	<input type="password" class="form-control" id="edit_pwd" name="edit_pwd" placeholder="PassWord">
                                    	</td>
                                    <tr>
    		                            <td>이름</td>
	                                	<td>	
                                        	<input type="text" class="form-control" id="edit_name" name="edit_name" value="<%=dto.getName()%>">
                                    	</td>
                                    </tr>
                                    <tr>
                                		<td>주소</td>
                                		<td>
                                        	<input type="text" class="form-control" id="edit_address" name="edit_address" value="<%=dto.getAddress()%>">
                                    	</td>
                                    </tr>
                                    <tr>
                                		<td>e-mail</td>
                                		<td>
                                        	<input type="text" class="form-control" id="edit_email" name="edit_email" value="<%=dto.getEmail()%>">
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<th colspan = "2">
                                        	<button type="submit" value="submit" class="btn_3">수정</button>
                                    	</th>
                                    </tr>
                                    <tr>
                                    	<th colspan = "2">
                                       		<button type = "button" onclick="location = 'index.jsp'" class = "btn_3">취소</button>
                                    	</th>
                                    </tr>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                    </div>
                    
                    <div class="col-lg-2">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title">마이페이지</h4>
                                <ul class="list cat-list">
                                    <li>
                                        <a href="editprofile.jsp" class="d-flex">
                                            <p>개인정보수정</p>
                                        </a>
                                    </li>
									<li>
                                        <a href="buylist.jsp" class="d-flex">
                                            <p>주문조회</p>
                                        </a>
                                    </li>
                                </ul>
                                </aside>
                               </div>
                        </div>
                    </div>
                </div>
            
        </section>
        <!--================login_part end =================-->
    </main>
        
    

    <!-- JS here -->

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    
    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
    
</body>
</html>
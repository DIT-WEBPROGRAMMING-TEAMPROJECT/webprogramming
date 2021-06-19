<%@page import="boardPackege.BoardListDTO"%>
<%@page import="boardPackege.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="boardPackege.BoardDAO"%>
<%@page import="memberPackege.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Watch shop | eCommers</title>
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
		
		.blog_img {
			width : 200px;
			height : 200px;
			padding : 0px;
			display : block;
		}

		
    </style>
</head>

<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	out.println(sessionId);
	
	MemberDAO dao = new MemberDAO();
	BoardDAO boardDAO = new BoardDAO();
	
	int numOfRecords = 10;   // 한 page의 게시글 수
	int numOfPages = 10;   // 한 화면의 페이지 수
	int p = 1;            // 첫 페이지
	   
    String p_ = request.getParameter("p");
    if(p_ != null && !p_.equals("")) {
       p = Integer.parseInt(p_);
    }
    ArrayList<BoardListDTO> dtos = boardDAO.getListBoardAll(p, numOfRecords);
    int count = boardDAO.getCount();
    
    int startNum = p - (p-1) % numOfPages;
    int lastNum = (int) Math.ceil((double) count/numOfRecords);
%>
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
                                    <li><a href="review.jsp">커뮤니티</a></li>
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
        <!--? Hero Area Start-->
        <div class="slider-area ">
            <div class="single-slider slider-height2 d-flex align-items-center">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>커뮤니티</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--? Hero Area End-->
        <!--================Blog Area =================-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <div class="blog_left_sidebar">
                            <article class="blog_item">
                            <%for(BoardListDTO dto : dtos){ %>
                            <div class = "row">
	                            <div class="col-md-3 blog_img" >
	                            
	                            	<img class="card-img rounded-0" src="<%=request.getContextPath()%> <%=dto.getThumbnailLink()%>" width = "200" height = "200">
	                            
	                            </div>
						        <div class="col-md-7">
						        	<h2><%=dto.getProductName()%></h2>
                                    
                                    <p><%=dto.getContent()%></p>
						        </div>
						        <div class="col-md-2">
						        	<ul>
                                        <li><%=dto.getMemberId()%></li>
                                    </ul>
                                    <ul>
                                        <li><%=dto.getRegtime()%></li>
                                    </ul>
						        </div>
						        </div>
						     <%} %>
                            </article>

                         <!-- 페이지네이션 -->
		                 <div class="d-flex just justify-content-center">
		                  <ul class="pagination">
		                  <%if(startNum <= 1) { //Previous%>
		                       <li class="page-item"><a class="page-link" style="color:gray" onclick="alert('앞 페이지가 더 이상 없음')">Previous</a></li>
		                    <%} else { // startNum가 6, 11...일 경우%>
		                       <li class="page-item"><a class="page-link" href="?p=<%=startNum - 1%>">Previous</a></li>
		                    <%}%>
		                    <%for(int i=0; i<numOfPages; i++) { //숫자 링크 부분%>
		                    <%if(startNum + i <= lastNum) { 
		                         if(p == (startNum+i)) {
		                    %>
		                       <li class="page-item active"><a class="page-link" href="?p=<%=startNum + i%>"><%=startNum + i %></a></li>
		                    <%} else { %>
		                       <li class="page-item"><a class="page-link" href="?p=<%=startNum + i%>"><%=startNum + i %></a></li>
		                    <%}}}%>
		                    <%if(startNum+numOfPages > lastNum) { %>
		                       <li class="page-item"><a class="page-link" style="color:gray" onclick="alert('앞 페이지가 더 이상 없음')" href="#">Next</a></li>
		                    <%} else { %>
		                       <li class="page-item"><a class="page-link" href="?p=<%=startNum + numOfPages%>">Next</a></li>
		                    <%}%>
		                  </ul>
		               </div> 
		               <!-- 페이지네이션 끝 -->
                       </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="blog_right_sidebar">

                            <aside class="single_sidebar_widget post_category_widget">
                                <h4 class="widget_title">Category</h4>
                                <ul class="list cat-list">
									<li>
                                        <a href="#" class="d-flex">
                                            <p>구매후기</p>
                                            <p>(0)</p>
                                        </a>
                                    </li>
                                </ul>
                            </aside>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--================Blog Area =================-->
    </main>
    
    <!-- Search model end -->

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
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

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
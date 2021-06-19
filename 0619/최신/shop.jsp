<%@page import="java.text.DecimalFormat"%>
<%@page import="productPackege.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="productPackege.ProductDAO"%>
<%@page import="memberPackege.MemberDAO"%>
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

		
    </style>
</head>
<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	DecimalFormat decimalFormat = new DecimalFormat("###,###");
	MemberDAO dao = new MemberDAO();
	ProductDAO productDao = new ProductDAO();
	int numOfRecords = 6; // 한페이지에 records 6개
	int numOfPages = 5;
	int p = 1;
	
	String p_ = request.getParameter("p");
	if(p_ != null && !p_.equals("")) {
		p = Integer.parseInt(p_);
	}
	
	ArrayList<ProductDTO> dtos = null; 
	
	int count = productDao.getCount();
	
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
                                <h2>PC주요부품</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Area End-->
        <!-- Latest Products Start -->
        <section class="popular-items latest-padding">
            <div class="container">
                <div class="row product-btn justify-content-between mb-40">
                    <div class="properties__button">
                        <!--Nav Button  -->
                        <nav>                                                      
                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <a class="nav-item nav-link active" id="nav-cpu-tab" data-toggle="tab" href="#nav-cpu" role="tab" aria-controls="nav-cpu" aria-selected="true">CPU</a>
                                <a class="nav-item nav-link" id="nav-memory-tab" data-toggle="tab" href="#nav-memory" role="tab" aria-controls="nav-memory" aria-selected="false"> 메모리</a>
                                <a class="nav-item nav-link" id="nav-mainboard-tab" data-toggle="tab" href="#nav-mainboard" role="tab" aria-controls="nav-mainboard" aria-selected="false"> 메인보드 </a>
								<a class="nav-item nav-link" id="nav-ssd-tab" data-toggle="tab" href="#nav-ssd" role="tab" aria-controls="nav-ssd" aria-selected="false"> SSD </a>
								<a class="nav-item nav-link" id="nav-hdd-tab" data-toggle="tab" href="#nav-hdd" role="tab" aria-controls="nav-hdd" aria-selected="false"> HDD </a>
								<a class="nav-item nav-link" id="nav-graphicCard-tab" data-toggle="tab" href="#nav-graphicCard" role="tab" aria-controls="nav-graphicCard" aria-selected="false"> 그래픽카드 </a>
								<a class="nav-item nav-link" id="nav-case-tab" data-toggle="tab" href="#nav-case" role="tab" aria-controls="nav-case" aria-selected="false"> 케이스 </a>
								<a class="nav-item nav-link" id="nav-power-tab" data-toggle="tab" href="#nav-power" role="tab" aria-controls="nav-power" aria-selected="false"> 파워 </a>
                            </div>
                        </nav>
                        <!--End Nav Button  -->
                    </div>
                    <!-- Grid and List view -->
                    <div class="grid-list-view">
                    </div>
                    <!-- Select items -->
                </div>
                <!-- Nav Card -->
                <div class="tab-content" id="nav-tabContent">
                    <!-- card one -->
                    <div class="tab-pane fade show active" id="nav-cpu" role="tabpanel" aria-labelledby="nav-cpu-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct( 1); // 1 = cpu
                        		for(ProductDTO dto : dtos) { %>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span class="price_class"><%=decimalFormat.format(dto.getPrice())%>&#8361;</span><!-- 세자리마다,붙이기-->
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                    <!-- Card two -->
                    <div class="tab-pane fade" id="nav-memory" role="tabpanel" aria-labelledby="nav-memory-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(2); // 2 = memory
                        		for(ProductDTO dto : dtos) { %>                        	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                    <!-- Card three -->
                    <div class="tab-pane fade" id="nav-mainboard" role="tabpanel" aria-labelledby="nav-mainboard-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(3);
                        		for(ProductDTO dto : dtos) { %>
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                	<div class="tab-pane fade" id="nav-ssd" role="tabpanel" aria-labelledby="nav-ssd-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(4); 
                        		for(ProductDTO dto : dtos) { %>                        	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-hdd" role="tabpanel" aria-labelledby="nav-hdd-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(5);
                        		for(ProductDTO dto : dtos) { %>                        	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                	<div class="tab-pane fade" id="nav-graphicCard" role="tabpanel" aria-labelledby="nav-graphicCard-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(6);
                        		for(ProductDTO dto : dtos) { %>   	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                	<div class="tab-pane fade" id="nav-case" role="tabpanel" aria-labelledby="nav-case-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(7);
                        		for(ProductDTO dto : dtos) { %>                        	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-power" role="tabpanel" aria-labelledby="nav-power-tab">
                        <div class="row">
                        	<%  dtos = productDao.getListProduct(8);
                        		for(ProductDTO dto : dtos) { %>                        	
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            	<a href="item.jsp?id=<%=dto.getProductId()%>">
                                <div class="single-popular-items mb-50 text-center">
                                    <div class="popular-img">
                                        <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="">
                                        <div class="img-cap">
                                            <span>제품정보</span>
                                        </div>
                                        <div class="favorit-items">
                                            <span class="flaticon-heart"></span>
                                        </div>
                                    </div>
                                    <div class="popular-caption">
                                        <h3><%=dto.getName()%></h3>
                                        <span><%=decimalFormat.format(dto.getPrice())%>&#8361;</span>
                                        <span>stock : <%=dto.getStock()%></span>
                                    </div>
                                </div>
                            </div><%}%>
                        </div>
                    </div>
                </div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->
<!-- JS here -->
    <!-- All JS Custom Plugins Link Here here -->
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

    <!-- Scroll up, nice-select, sticky -->
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
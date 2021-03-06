<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
		
		.card_area .product_count .product_count_item {
		    width: 30px;
		    height: 30px;
		    line-height: 30px;
		    text-align: center;
		    display: inline-block;
		}
		
		.table {
			width : 1008px;
		}
		
		#td2 a {
			color : black;
		}
		#td3 a {
			color : black;
		}
		
		.counting {
			width : 30px;
			height : 30px;
			text-align : center;
			background-color : #BBDEFB;
			
		}
		
		.product_count_item {
			background-color : white!important;
			color : black!important;
		}
		
		.btt {
			background-color : blue;
		}

    </style>
    
    
</head>

<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	out.println(sessionId);
	
	MemberDAO dao = new MemberDAO();
	
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
                                    <li><a href="welcome.jsp">????????????</a>
                                    	<ul class="submenu">
                                        <li><a href="welcome.jsp">?????????</a></li>
                                        <li><a href="howto.jsp">????????????</a></li>
                                    </ul>
                                    </li>
                                    <li><a href="shop.jsp">PC????????????</a></li>
                                    <li><a href="vshop.jsp">PC??????</a></li>
                                    <li><a href="about.jsp">????????????</a></li>
                                    <li><a href="admin.jsp">?????????</a>
                                    	<ul class="submenu">
                                        <li><a href="admininsert.jsp">??????</a></li>
                                        <li><a href="admin.jsp">??????</a></li>
                                    	</ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- Header Right -->
                        <div class="header-right">
                            <ul>
                                <% // ????????? ????????? ?????? ???????????????
                                if(dao.SessionCheck(sessionId)) {	
                                %>
                            	 
	                            <li>
	                                <div class = "dropdown"><span class="flaticon-user"></span>
	                                	<div class = "dropdown-content">
	                                		<a href = "editprofile.jsp">??????????????????</a>
	                                		<a href = "buylist.jsp">????????????</a>
	                                		<a href = "Logout.jsp">????????????</a>
	                                	</div>
                                	</div>
                                </li>
                                <%	 
                                }
                                else { // ????????? ????????? ????????????
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
        
        <!--================Blog Area =================-->
        <section class="blog_area section-padding">
            <div class="container">
                <div class="row">
                	 <form action="InsertPro.jsp" method="post" enctype="multpart/form-data">
                    	<div class="col-lg-5 mb-5 mb-lg-0">
                        	<div class="blog_left_sidebar">
                            	<article class="blog_item">
                                	<div class="blog_item_img">                       			
                       				<!-- ???????????? -->
                       				<input type = "file" class = "btn-outline-primary"  value = "????????????" id="thumbnailLink" name="thumbnailLink"> 
                       		    	</div>                           
                            	</article>
   
                        	</div>
                    	</div>
                    <div class="col-lg-6">
                        <div class="blog_right_sidebar">
                            <aside class="single_sidebar_widget post_category_widget">
                          
                                	<ul class="list cat-list">
	                                	<li>
	                                		????????? : <input type = "text" id="name" name="name" class="form-control" >	                                
	                                	</li>
	                                	<li>
	                                		?????? : 
                                        	<select class="form-control" id="productcode" name="productcode">
										  	<option value="01" >CPU</option>
				  							<option value="02">RAM</option>
				  							<option value="03">????????????</option>
				  							<option value="04">???????????????</option>
				  							<option value="05">SSD</option>
				  							<option value="06">HDD</option>
				  							<option value="07">?????????</option>
				  							<option value="08">??????</option>		
										    
											</select>
                                    	</li>
                                    	<li>
                                        	?????? : <input type = "text" class="form-control" id="price" name="price">
                                    	</li>
										<li>
											???????????? : <input type = "text" class="form-control" id="stock" name="stock">				
                                    	</li>                                    
                                    	<li>
                                    		<input type = "submit" class = "btn btn-danger"  value = "????????????">
                                    	</li>
                                	</ul>
                            	</aside>
                        	</div>
                    	</div>
                    	<div class="blog_details">
                    		<table class = "table table-bordered">
                    			<tr style = "text-align:center;">
                    				<td id = "td1">????????????</td>
                    			</tr>
                    			<tr>
                    				<td><input type = "file" class = "btn-outline-primary"  value = "??????????????????" id="detailedLink" name="detailedLink"></td>
                    			</tr>
                    		</table>
                    	</div>
                    </form>
                </div>
            </div>
        </section>
        <!--================Blog Area =================-->
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
    
    <!-- Scrollup, nice-select, sticky -->
    <script src="./assets/js/jquery.scrollUp.min.js"></script>
    
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
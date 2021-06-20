<%@page import="java.util.Map"%>
<%@page import="orderPackege.OrderDTO"%>
<%@page import="productPackege.ProductDAO"%>
<%@page import="basketPackege.BasketDTO"%>
<%@page import="java.util.ArrayList"%>
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
		
		.counting {
			width : 30px;
			height : 30px;
			text-align : center;
		}
		
		.product_count_item {
			background-color : white!important;
			color : black!important;
			width : 30px;
			height : 30px;
			text-align : center;
		}

		
    </style>
</head>
<body>
<%
	String sessionId = (String)session.getAttribute("sessionId");
	out.println("로그인 : " + sessionId);
	MemberDAO dao = new MemberDAO();
	ProductDAO productDAO = new ProductDAO();
	ArrayList<BasketDTO> dtos = null; 
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
      <!-- Hero Area Start-->
      <div class="slider-area ">
          <div class="single-slider slider-height2 d-flex align-items-center">
              <div class="container">
                  <div class="row">
                      <div class="col-xl-12">
                          <div class="hero-cap text-center">
                              <h2>Cart List</h2>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!--================Cart Area =================-->
      <section class="cart_area section_padding">
        <div class="container">
          <div class="cart_inner">
            <div class="table-responsive">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">Product</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                  </tr>
                </thead>
                <tbody>
                <%dtos = productDAO.basketSetting(sessionId);
                ArrayList<Integer> priceArrayList = new ArrayList<>();
                int count = 0;
                  for(BasketDTO dto : dtos) {
                	  int i = dto.getCount();
                	  priceArrayList.add(dto.getPrice()); //순서대로 가격 값을 받음
                  %>
                  <tr>
                    <td>
                      <div class="media">
                        <div class="d-flex">
                          <img src="<%=request.getContextPath()%><%=dto.getThumbnailLink()%>" alt="" />
                        </div>
                        <div class="media-body">
                          <p class="productNameAll"><%=dto.getName()%></p>
                        </div>
                      </div>
                    </td>
                    <td>
                      <h5>&#8361;<%=dto.getPrice()%></h5>
                    </td>
                    <td>
                      <span class="card_area">
                      <%switch(i) {
                      		case 1:%>
					      <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
					        <option value="1" selected>1</option>
					        <option value="2">2</option>
					        <option value="3">3</option>
					        <option value="4">4</option>
					        <option value="5">5</option>
					        <option value="6">6</option>
					        <option value="7">7</option>
					        <option value="8">8</option>
					        <option value="9">9</option>
					        <option value="10">10</option>
    					  </select>
    				 <%			break;
                      		case 2: %>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2" selected>2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 3:%> 
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3" selected>3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 4:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4" selected>4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 5:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5" selected>5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 6:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6" selected>6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 7:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7" selected>7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 8:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8" selected>8</option>
  					        <option value="9">9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 9:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9" selected>9</option>
  					        <option value="10">10</option>
      					  </select>
                      		<%	break;
                      		case 10:%>
      					  <select id="<%=dto.getName()%>_<%=dto.getPrice()%>_<%=count%>" name="order" form="myForm" onchange="changeSelect(this.id); costAllSet();">
  					        <option value="1">1</option>
  					        <option value="2">2</option>
  					        <option value="3">3</option>
  					        <option value="4">4</option>
  					        <option value="5">5</option>
  					        <option value="6">6</option>
  					        <option value="7">7</option>
  					        <option value="8">8</option>
  					        <option value="9">9</option>
  					        <option value="10" selected>10</option>
      					  </select>
                      		<%	break;} %>
                      </span>
                    </td>
                    <td>
                      <h5 style="float: left;">&#8361;</h5>
                      <h5 class="onePrice" id="<%=dto.getName()%>_price" onclick="alertTest(this.id)"><%=dto.getPrice()*dto.getCount()%></h5><!-- [Modify] - 합계금액 -->
                    </td>
                  </tr>
                    <script type="text/javascript">
                    	function changeSelect(id) {
                    		var testarray = id.split("_");
                    		var array = testarray[0] + "_price";
                    		var cost = testarray[1];
                    		var count = testarray[2];//넘버
                    		var select = document.getElementById(id);
							var selectValue = select.options[select.selectedIndex].value;
							
							document.getElementById("productQuantity"+count).value = selectValue;
							document.getElementById(array).innerText = cost*selectValue;
						}
					</script>
                  <% count++;
                  }%>
                  <tr>
                    <td></td>
                    <td></td>
                    <td>
                      <h5>Subtotal</h5>
                    </td>
                    <%
                    	int totalAmount = 0;
                    	for(int i=0; i<dtos.size(); i++) {
                    		totalAmount += dtos.get(i).getCount() * dtos.get(i).getPrice();
                    	}
                    %>
                    <td>
                      <h5 style="float: left;">&#8361;</h5>
                      <h5 id="setCostAll"><%=totalAmount%></h5>
                    </td>
                  </tr>
                  <script type="text/javascript">
                  	function costAllSet() {
                  		var costAll = 0;
                  		for(var i=0; i<$(".onePrice").length; i++)
    						costAll += Number($(".onePrice").eq(i).text());
    					$("#setCostAll").text(costAll);
					}
				  </script>
                </tbody>
              </table>
              <%if(dao.SessionCheck(sessionId)) {%>
              <div class="checkout_btn_inner float-right">
              	<form action="cart_buy.jsp" method="post"><!-- 폼  -->
              		<input id="dtosSize" name="dtosSize" type="hidden" value="<%=dtos.size()%>">
              	<%for(int i=0; i<dtos.size(); i++) {%>
              		<input id="productId<%=i%>" name="productId<%=i%>" type="hidden" value="<%=dtos.get(i).getProductId()%>">
              		<input id="productQuantity<%=i%>" name="productQuantity<%=i%>" type="hidden" value="<%=dtos.get(i).getCount()%>">
              	<%}%>
                	<input type="submit" class="btn_1 checkout_btn_1" value="Buy">
              	</form>
              </div>
              <%} else{%>
              <div class="checkout_btn_inner float-right">
                <button class="btn_1 checkout_btn_1" id="btnBuy" onclick="alertLogin()">Buy</button>
              </div>
              <%}%>
              <script type="text/javascript">
					function alertLogin() { alert("로그인을 해주세요"); }
              </script>
            </div>
          </div>
      </section>
      <!--================End Cart Area =================-->
  </main>>

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
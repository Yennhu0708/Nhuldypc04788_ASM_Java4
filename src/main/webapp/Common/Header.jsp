<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
    <!-- Page Loader -->
    <div id="loader-wrapper">
        <div id="loader"></div>

        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>

    </div>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="<c:url value='/index'/>">
                <i class="fas fa-film mr-2"></i>
               	SARAH VIDEOS
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
            	<c:choose>
            		<c:when test = "${not empty sessionScope.currentUser}">
            		 		 <!-- Đã Đăng Nhập -->	
		                <li class="nav-item">
		                    <a class="nav-link nav-link-1 active" aria-current="page" href="">Welcome, ${sessionScope.currentUser.username}</a>
		                </li>
		                 <li class="nav-item">
		                    <a class="nav-link nav-link-1" href="Myfavorites">My favorites</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link nav-link-2" href="Myhistory">My History</a>
		                </li>
		                <li class="nav-item">
		                    <a class="nav-link nav-link-3" href="Logout">Log out</a>
		                </li>
            		</c:when>
            		
            		<c:otherwise>
			            		<!-- Chưa Đăng Nhập -->
			                <li class="nav-item">
			                    <a class="nav-link nav-link-2" href="Login">Login</a>
			                </li>
			                <li class="nav-item">
			                    <a class="nav-link nav-link-3" href="Register">Register</a>
			                </li>
			                <li class="nav-item">
			                    <a class="nav-link nav-link-4" href="Forgot Password">Forgot Password</a>
			                </li>
            		</c:otherwise>
            	</c:choose>
          			
                     
            </ul>
            </div>
        </div>
    </nav>

    <div class="tm-hero d-flex justify-content-center align-items-center" data-parallax="scroll" data-image-src="<c:url value = '/Templates/User/img/hero.jpg'/>"></div>
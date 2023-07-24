<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/Common/Taglib.jsp" %>
		<!-- Page Loader -->
		<div id="loader-wrapper">
			<div id="loader"></div>

			<div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div>

		</div>
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<a class="navbar-brand" href="Index">
					<i class="fa-brands fa-docker"></i>
					VIETSUB PHIM
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mb-2 mb-lg-0">
						<c:choose>
							<c:when test="${not empty sessionScope.currentUser}">
								<!-- Đã Đăng Nhập -->
								<li class="nav-item">
									<a class="nav-link nav-link-1 active" aria-current="page" href="">Welcome,
										${sessionScope.currentUser.username}</a>
								</li>
								<li class="nav-item">
									<a class="nav-link nav-link-1" href="Favorites">My favorites</a>
								</li>
								<li class="nav-item">
									<a class="nav-link nav-link-1" href="ChangePass">Change Password</a>
								</li>
								<li class="nav-item">
									<a class="nav-link nav-link-2" href="History">My History</a>
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
									<a class="nav-link nav-link-4" href="Forgotpassword">Forgot Password</a>
								</li>
							</c:otherwise>
						</c:choose>


					</ul>
				</div>
			</div>
		</nav>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value = '/Templates/User/img/hero.jpg'/>" class="d-block w-100" alt="..." style="Height: 500px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value = '/Templates/User/img/hero1.jpg'/>" class="d-block w-100" alt="..." style="Height: 500px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value = '/Templates/User/img/hero2.jpg'/>" class="d-block w-100" alt="..." style="Height: 500px">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
				data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
				data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
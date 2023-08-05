<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SARAH VIDEOS</title>
<%@ include file="/Common/Admin/HeadAd.jsp"%>
</head>
<body>
	<!-- Preloader - style you can find in spinners.css -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- Main wrapper - style you can find in pages.scss -->
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<!-- Topbar header - style you can find in pages.scss -->
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin6">

					<!-- Logo -->
					<a class="navbar-brand" href="index.html"> <!-- Logo text --> <span
						class="logo-text"> <!-- dark Logo text --> <img
							width="220px"
							src="<c:url value ='Templates/Amind//assets/images/logo-text.png'/> "
							alt="homepage" class="dark-logo" />

					</span>
					</a>

					<!-- End Logo -->

					<!-- toggle and nav items -->
					<a
						class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<!-- End Logo -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">
					<!-- toggle and nav items -->
					<ul class="navbar-nav me-auto mt-md-0 ">
						<!-- Search -->
						<li class="nav-item hidden-sm-down">
							<form class="app-search ps-3">
								<input type="text" class="form-control"
									placeholder="Search for..."> <a class="srh-btn"><i
									class="ti-search"></i></a>
							</form>
						</li>
					</ul>
					<!-- Right side toggle and nav items -->
					<ul class="navbar-nav">
						<!-- User profile and search -->
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle waves-effect waves-dark" href="#"
							id="navbarDropdown" role="button" data-bs-toggle="dropdown"
							aria-expanded="false"> <strong>${sessionScope.currentUser.username}</strong> 
						</a>
						
						</li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- End Topbar header -->

		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<aside class="left-sidebar" data-sidebarbg="skin6">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<!-- User Profile-->
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="Admin" aria-expanded="false"><i
								class="me-3 far fa-clock fa-fw" aria-hidden="true"></i><span
								class="hide-menu">Trang chủ</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="UserList" aria-expanded="false"> <i
								class="me-3 fa fa-user" aria-hidden="true"></i><span
								class="hide-menu">Thông Tin Người Dùng</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="VideoList" aria-expanded="false"><i
								class="me-3 fa fa-table" aria-hidden="true"></i><span
								class="hide-menu">Thông Tin Video</span></a></li>
								<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="FavoritesAD" aria-expanded="false"><i
								class="me-3 fa fa-table" aria-hidden="true"></i><span
								class="hide-menu">Video Yêu Thích</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="CreateVideo" aria-expanded="false"><i
								class="me-3 fa fa-columns" aria-hidden="true"></i><span
								class="hide-menu">Thêm Video Mới</span></a></li>
								<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="ShareList" aria-expanded="false"><i
								class="me-3 fa fa-columns" aria-hidden="true"></i><span
								class="hide-menu">Danh Sách Share Video</span></a></li>
						<li class="text-center p-20 upgrade-btn"><a
							href="Logout"
							class="btn btn-danger text-white mt-4" target="_blank">Thoát</a></li>
					</ul>

				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- Page wrapper  -->
		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row align-items-center">
					<div class="col-md-6 col-8 align-self-center">
						<h3 class="page-title mb-0 p-0">Trang Chủ</h3>
						<div class="d-flex align-items-center">
						</div>
					</div>
					<div class="col-md-6 col-4 align-self-center">
						<div class="text-end upgrade-btn">
							<a href="Index"
								class="btn btn-success d-none d-md-inline-block text-white"
								target="_blank">Quay Lại</a>
						</div>
					</div>
				</div>
			</div>
	
			<!-- End Page wrapper  -->
		</div>
		</div>
		<script>
			$(document).ready(function() {
				$('#userTable').DataTable();
			});
		</script>
</body>
</html>
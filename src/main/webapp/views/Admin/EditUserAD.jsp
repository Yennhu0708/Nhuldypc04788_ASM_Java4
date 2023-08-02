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
	<%@ include file="/Common/Admin/HeaderAD.jsp"%>

	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin6"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">

		<div class="page-wrapper">
			<form action="edituser" method="post">
				<section class="vh-100" style="background-color: #f4f5f7;">

					<div class="container py-5 h-100">

						<div
							class="row d-flex justify-content-center align-items-center h-100">

							<div class="col col-lg-6 mb-4 mb-lg-0">

								<div class="card mb-3" style="border-radius: .5rem;">

									<div name="editCheck" class="row g-0">

										<div
											class="col-md-4 gradient-custom text-center text-white p-3"
											style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">

											<img src='<c:url value='/Templates/User/img/logo.png' />'
												alt="Avatar" class="img-fluid my-5" style="width: 100px;" />
											<br>
											<button type="submit" class="btn btn-outline-info">Lưu
												Thông Tin</button>
											<button type="submit" class="btn btn-outline-success m-3">Làm
												Mới</button>


										</div>

										<div class="col-md-8">

											<div class="card-body p-4">
												<div class="row">
													<div class="col-6 mb-3">
														<h6>Thông tin</h6>
													</div>
												</div>

												<hr class="mt-0 mb-4">
												<div class="row pt-1">
													<div class="col-6 mb-3">
														<h6>Tên Đăng Nhập:</h6>
														<input type="text" value="${user.username}"
															name="username" class="form-contro"
															placeholder="Họ và Tên" readonly>
													</div>
													<div class="col-6 mb-3">
														<h6>Mật Khẩu:</h6>
														<input type="Password" class="form-control "
															name="password" placeholder="email"
															value="${user.password}" readonly>
													</div>
													<div class="col-6 mb-3">
														<h6>Email:</h6>
														<input type="text" class="form-control " name="email"
															placeholder="email" value="${user.email}">
													</div>
												</div>

												<hr class="mt-0 mb-4">

												<div class="pt-1 text-center">
													<h6>Điểm Tích Lũy</h6>
													<p>2000 điểm</p>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
			</form>
		</div>
	</div>
</body>
</html>

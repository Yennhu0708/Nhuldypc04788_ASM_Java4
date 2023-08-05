<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SARAH VIDEOS</title>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/Common/Header.jsp"%>

		<section class="vh-100" style="background-color: #f4f5f7;">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">

				<div class="col col-lg-8 mb-4 mb-lg-0">

					<div class="card mb-3 rounded-0">

						<div name="editCheck" class="row g-0">

							<div class="col-md-4 gradient-custom text-center text-white p-3"
								style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">

								<img src='<c:url value='/Templates/User/img/logo.png' />'
									alt="Avatar" class="img-fluid my-5" style="width: 100px;" />
								<br>

							</div>

							<div class="col-md-8">
								<div class="card-body p-4">
									<div class="row">
										<form action="EditProfile" method="post">
											<div class="col-12 mb-3">
												<h6>Thông tin</h6>
											</div>
											<hr class="mt-0 mb-4">
											<div class="form-group col-12 mb-3">
												<label for="username">Tên Đăng Nhập:</label>
												<input type="text" value="${username}" name="username"
													class="form-control" id="username" placeholder="Họ và Tên" readonly>
											</div>
											<div class="form-group col-12 mb-3">
												<label for="password">Mật Khẩu:</label>
												<input type="password" class="form-control"
													name="password" id="password" placeholder="email" value="${password}" readonly>
											</div>
											<div class="form-group col-12 mb-3">
												<label for="email">Email:</label>
												<input type="email" class="form-control" name="email"
													id="email" placeholder="email" value="${email}">
												<c:if test="${param.error == 'TrungMail'}">
													<p class="text-danger">Email đã được sử dụng!</p>
												</c:if>
											</div>
											<div class="form-group col-12 mb-3">
												<button type="submit" class="btn btn-primary">Đổi</button>
											</div>
										</form>
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
	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
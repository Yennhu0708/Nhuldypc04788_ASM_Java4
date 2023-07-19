<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/Common/Header.jsp"%>

	<div
		class="d-flex flex-column min-vh-100 justify-content-center align-items-center">

		<div class="container">

			<div class="row justify-content-center">

				<div class="col-md-8 m-5">

					<form action="Register" method="POST" class="row shadow-lg p-3"
						style="background-color: white;">

						<div class="m-2 text-center">

							<h1 class="">Đăng Ký Tài khoản</h1>

						</div>
						<!-- First name and last name -->
						<div class="col-md-12 m-2">

							<!-- First Name -->
							<div class="col">

								<label for="user" class="form-label">Tên đăng nhập<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" placeholder="Nguyễn Văn A" id="username"
									name="username" required />

								<div class="valid-feedback">Username validated</div>

								<div class="invalid-feedback">Vui Lòng Nhập Họ Và Tên</div>

							</div>

						</div>

						<!-- Password -->
						<div class="col-md-12 m-2">

							<label for="password" class="form-label"> Mật Khẩu <span
								class="text-danger">*</span></label> <input type="password"
								class="form-control" placeholder="Mật Khẩu" id="password"
								name="password" required />

							<div class="valid-feedback">Password validated</div>

							<div class="invalid-feedback">Vui Lòng Nhập Mật Khẩu</div>

						</div>
						<div class="col-md-12 m-2">

							<label for="ag-password" class="form-label">Nhập Lại Mật
								Khẩu <span class="text-danger">*</span>
							</label> <input type="password" class="form-control"
								placeholder="Nhập Lại Mật Khẩu" id="ag-password"
								name="ag-password" required />

							<div class="valid-feedback">Password validated</div>

							<div class="invalid-feedback">Vui Lòng Nhập Mật Khẩu</div>

						</div>
						<!-- Email -->
						<div class="col-md-12 m-2">

							<label for="email" class="form-label">Email <span
								class="text-danger">*</span></label> <input type="email"
								class="form-control" placeholder="Email" id="email" name="email"
								required />

							<div class="valid-feedback">Email validated</div>

							<div class="invalid-feedback">Vui Lòng Nhập Email</div>
							
						</div>
						<c:if test="${not empty errorMessage}">
								<p class="error">${errorMessage}</p>
							</c:if>
						<!-- submit button -->
						<div class="col-md-12 m-2">

							<button id="submitBtn" class="btn btn-info" type="submit">
								Đăng Ký</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đổi Mật Khẩu</title>
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
					<form class="row shadow-lg p-3" action="ChangePass" method="post"
						style="background-color: white;">
						
						<div class="m-2 text-center">
							<h1 class="">Đổi Mật Khẩu</h1>
						</div>
						<!-- First name and last name -->

						<div class="col-md-12 m-2">
							<!-- First Name -->
							<div class="col">
								<label for="user" class="form-label">Tên đăng nhập: <a
									class="fw-bold font-monospace text-dark">${sessionScope.currentUser.username}</a>
								</label>
							</div>
						</div>

						<!-- Old Password -->

						<div class="col-md-12 m-2">
							<label for="oldPassword" class="form-label">Mật Khẩu Cũ <span
								class="text-danger">*</span></label>
							<div class="input-group">
								<input type="password" class="form-control"
									placeholder="Mật Khẩu" id="oldPassword" name="oldPassword"
									required />
								<div class="input-group-append">
									<span class="input-group-text"> <!-- Icon ẩn/hiện mật khẩu -->
										<i class="fa fa-eye-slash show-password-icon"
										id="oldPasswordIcon" data-input="oldPassword"></i>
									</span>
								</div>
							</div>

						</div>
						<!-- New Password -->

						<div class="col-md-12 m-2">
							<label for="newPassword" class="form-label">Mật Khẩu Mới
								<span class="text-danger">*</span>
							</label>
							<div class="input-group">
								<input type="password" class="form-control"
									placeholder="Mật Khẩu" id="newPassword" name="newPassword"
									required />
								<div class="input-group-append">
									<span class="input-group-text"> <!-- Icon ẩn/hiện mật khẩu -->
										<i class="fa fa-eye-slash show-password-icon"
										id="newPasswordIcon" data-input="newPassword"></i>
									</span>
								</div>
							</div>
							<div class="valid-feedback">Password validated</div>
							<div class="invalid-feedback">Vui Lòng Nhập Mật Khẩu</div>
						</div>
						<!-- submit button -->
						<div class="col-md-12 m-2">
							<button id="changePassBtn" class="btn btn-info" type="submit">Đổi
								Mật Khẩu</button>
						</div>
						<h5 style="color: red" id="messageChange"></h5>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>
	<!-- Your existing HTML content ... -->

	<!-- Add the following script after the HTML content -->
	<script>
		// Function to toggle password visibility
		function togglePasswordVisibility(oldPassword, oldPasswordIcon) {
			var passwordInput = document.getElementById(oldPassword);
			var icon = document.getElementById(oldPasswordIcon);

			if (passwordInput.type === "password") {
				passwordInput.type = "text";
				icon.classList.remove("fa-eye-slash");
				icon.classList.add("fa-eye");
			} else {
				passwordInput.type = "password";
				icon.classList.remove("fa-eye");
				icon.classList.add("fa-eye-slash");
			}
		}

		// Attach event listeners to the eye icons
		var showPasswordIcons = document
				.querySelectorAll(".show-password-icon");
		showPasswordIcons.forEach(function(icon) {
			var inputId = icon.getAttribute("data-input");
			icon.addEventListener("click", function() {
				togglePasswordVisibility(inputId, this.id);
			});
		});
		
	</script>

</body>
</html>

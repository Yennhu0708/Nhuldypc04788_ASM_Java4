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

					<form action="Forgotpassword" method="POST" class="row shadow-lg p-3"
						style="background-color: white;">

						<div class="m-2 text-center">

							<h1 class="">Quên Mật Khẩu</h1>

						</div>
						<!-- Email -->
						<div class="col-md-12 m-2">

							<label for="email" class="form-label">Email <span
								class="text-danger">*</span></label> <input type="email"
								class="form-control" placeholder="Email" id="email" name="email"
								required />
							<%-- <c:if test="${param.error != 'EmailAlreadyExists'}">
								<p>Email không tồn tại. Vui lòng nhập email khác.</p>
							</c:if> --%>
							<div class="valid-feedback">Email validated</div>
							<div class="invalid-feedback">Vui Lòng Nhập Email</div>
						</div>

						<!-- submit button -->
						<div class="col-md-12 m-2">

							<button id="submitBtn" class="btn btn-info" type="submit">
								Gửi Mail</button>

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
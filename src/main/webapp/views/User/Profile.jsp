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

			<div
				class="row d-flex justify-content-center align-items-center h-100">

				<div class="col col-lg-12 mb-4 mb-lg-0">

					<div class="card mb-3" style="border-radius: .5rem;">

						<div class="row g-0">

							<div class="col-md-4 gradient-custom text-center text-white"
								style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem;">

								<img src='<c:url value='/Templates/User/img/logo.png' />'
									alt="Avatar" class="img-fluid my-5" style="width: 100px;" /> <br>
							<a href ="EditProfile" type="submit" class="btn btn-outline-info">Chỉnh Sửa</a>
							</div>

							<div class="col-md-8">

								<div class="card-body p-4">
									<h6>Thông tin</h6>
									<hr class="mt-0 mb-4">
									<div class="row pt-1">
										<div class="col-6 mb-3">
											<h6>Tên Đăng Nhập:</h6>
											<h6 class="text-dark mt-4">${username}</h6>
										</div>
										<div class="col-6 mb-3">
											<h6>Email:</h6>
											<h6 class="text-dark mt-4">${email}</h6>
										</div>
										<div class="col-6 mb-3">
											<h6>Mật Khẩu:</h6>
											<h6 class="text-dark mt-4">******</h6>
										</div>
										<div class="col-6 mb-3">
											<div class="col-6 mb-3">
                                        <h6>Trạng thái:</h6>
                                        <h6 class="text-dark mt-4">${status}</h6>
                                    </div>
										</div>
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
	</section>
	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
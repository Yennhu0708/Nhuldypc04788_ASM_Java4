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



			<div class="container-fluid">
				<div class="row">
					<!-- column -->
					<div class="col-sm-12">
						<div class="card">
							<div class="card-body">
								<form action="ShareList" method="get">
									<h4 class="card-title mb-3">Danh Sách Share</h4>
									<select name="href" id="selectVideo"
										class="form-select form-select-sm rounded-2 fs-5 mt-3">
										<option selected disabled>Tên phim</option>
										<c:forEach items="${video}" var="item">
											<option value="${item.href}"
												${videoHref == item.href ? 'selected' : ''}>${item.title}</option>
										</c:forEach>
									</select>
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-outline-info  me-md-2 mt-3 mb-3">Tìm kiếm</button>
									</div>
									<div class="table-responsive">
										<table class="table user-table no-wrap" id="userTable">
											<thead>
												<tr>
													<th class="border-top-0">#</th>
													<th class="border-top-0">Họ và tên:</th>
													<th class="border-top-0">Email Gửi</th>
													<th class="border-top-0">Email Nhận</th>
													<th class="border-top-0">Ngày gửi</th>
													<th class="border-top-0">Giờ gửi</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${user}" var="users">
													<c:forEach items="${users.share}" var="shares">
														<tr>
															<td scope="row"></td>
															<td>${users.username}</td>
															<td>${users.email}</td>
															<td>${shares.email}</td>
															<td><fmt:formatDate value="${shares.shareDate}"
																	pattern="dd/MM/yyyy" /></td>
															<td><fmt:formatDate value="${shares.shareDate}"
																	pattern="HH:mm:ss" /></td>
														</tr>
													</c:forEach>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
							</div>
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
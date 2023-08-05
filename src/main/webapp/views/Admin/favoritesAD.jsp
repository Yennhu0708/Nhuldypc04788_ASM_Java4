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
							<div class="card-body mb-3">
								<form action="FavoritesAD" method="get">
									<h4 class="card-title">Video Yêu Thích Theo Người Dùng</h4>
									<select class="form-select mb-3" name="href"
										aria-label="Default select example">
										<option selected disabled>Video Yêu Thích</option>
										<c:forEach items="${videos}" var="item">
											<option value="${item.href}">${item.title}</option>
										</c:forEach>
									</select>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="submit" class="btn btn-outline-info  me-md-2 mt-3 mb-3">Chọn</button>
									</div>
								</form>
								<div class="table-responsive">
									<table class="table user-table no-wrap" id="userTable">
										<thead>
											<tr><th class="border-top-0">#</th>
												<th class="border-top-0">Tên Người dùng</th>
												<th class="border-top-0">Email</th>
												<th class="border-top-0">Trạng thái</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${user}" var="item" varStatus="loop">
												<tr>
													<td scope="row">${loop.index + 1}</td>
													<td>${item.username}</td>
													<td>${item.email}</td>
													<td><c:choose>
															<c:when test="${item.isActive}">Đang hoạt động</c:when>
															<c:otherwise>Ngưng hoạt động</c:otherwise>
													</c:choose></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Page wrapper  -->

		</div>
	</div>
	<script>
	/* 	$(document).ready(function() {
			$('#userTable').DataTable();
		}); */
		
		 $(document).ready(function() {
		        // Khởi tạo DataTables với cài đặt tìm kiếm
		        var dataTable = $('#userTable').DataTable({
		            "searching": true // Cho phép tìm kiếm trong bảng
		        });
		        
		        // Bắt sự kiện khi người dùng nhập vào ô tìm kiếm
		        $('#userTable_filter input').on('keyup', function() {
		            dataTable.search(this.value).draw();
		        });
		    });
	</script>
</body>
</html>
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

		  <form action="UserList" method="post">

                <div class="container-fluid">
                    <div class="row">
                        <!-- column -->
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Danh Sách Video</h4>
                                    <div class="table-responsive">
                                        <table class="table user-table no-wrap" id="">
                                            <thead>
                                            <tr>
                                                <th class="border-top-0">Id</th>
                                                <th class="border-top-0">Tên Video</th>
                                                <th class="border-top-0">Href</th>
                                                <th class="border-top-0">Lượt thích</th>
                                                <th class="border-top-0">#</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${videos}" var="item">
                                                <tr>
                                                    <td>${item.videoId}</td>
                                                    <td>${item.title}</td>
                                                    <td> <a href = "video?action=watch&id=${item.href}" >${item.href}</a></td>
													<td>${item.totalLike}</td>
													<td><a href="EditVideo?id=${item.videoId}" class="btn btn-outline-info">Edit</a></td>
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
            </form>
		</div>
		</div>
		<script>
			$(document).ready(function() {
				$('#userTable').DataTable();
			});
		</script>
</body>
</html>
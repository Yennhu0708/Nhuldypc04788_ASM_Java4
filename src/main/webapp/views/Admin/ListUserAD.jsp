<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/Common/Taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SARAH VIDEOS</title>
    <%@ include file="/Common/Admin/HeadAd.jsp" %>
</head>
<body>
    <%@ include file="/Common/Admin/HeaderAD.jsp" %>

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
                                    <h4 class="card-title">Thống kê Danh Sách Người Dùng</h4>
                                    <div class="table-responsive">
                                        <table class="table user-table no-wrap" id="userTable">
                                            <thead>
                                            <tr>
                                                <th class="border-top-0">Id</th>
                                                <th class="border-top-0">Tên Đăng Nhập</th>
                                                <th class="border-top-0">Mật Khẩu</th>
                                                <th class="border-top-0">Email</th>
                                                <th class="border-top-0">Trạng Thái</th>
                                                <th class="border-top-0">Admin/User</th>
                                                <th class="border-top-0">#</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${users}" var="user">
                                                <tr>
                                                    <td>${user.id}</td>
                                                    <td>${user.username}</td>
                                                    <td>*********</td>
                                                    <td>${user.email}</td>
                                                    <td>${user.isActive ? 'Active' : 'Inactive'}</td>
                                                    <td>${user.isAdmin ? 'Admin' : 'User'}</td>
                                                     <td>
													<a href ="edituser?id=${user.id}" type="submit" class="btn btn-outline-info">Sửa</a>
													<button type="submit" class="btn btn-outline-danger">Xóa</button>
													</td>
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

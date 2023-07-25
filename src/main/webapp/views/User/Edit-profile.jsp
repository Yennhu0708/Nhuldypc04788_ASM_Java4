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

                <div class="col col-lg-6 mb-4 mb-lg-0">

                    <div class="card mb-3" style="border-radius: .5rem;">

                        <div name="editCheck" class="row g-0">

                            <div class="col-md-4 gradient-custom text-center text-white p-3"
                                style="border-top-left-radius: .5rem; border-bottom-left-radius: .5rem; ">

                                <img src='<c:url value='/Templates/User/img/logo.png' />'
									alt="Avatar" class="img-fluid my-5" style="width: 100px;" />
									<br>
								<button type="button" class="btn btn-outline-info">Lưu Thông Tin</button>


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
                                            <fieldset disabled>
                                                <h6> Tên Đăng Nhập:</h6>
                                                <input type="text" class="form-control" ng-model="quiz.fullname"
                                                    placeholder="Họ và Tên">
                                            </fieldset>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <fieldset disabled>
                                                <h6>Email:</h6>
                                                <input type="text" class="form-control disable" ng-model="quiz.email"
                                                    placeholder="email">
                                            </fieldset>
                                        </div>
                                        <div class="col-6 mb-3">
                                            <h6>Số Điện Thoại:</h6>
                                            <input type="number" class="form-control" ng-model="quiz.phone"
                                                placeholder="số điện thoại">
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
	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
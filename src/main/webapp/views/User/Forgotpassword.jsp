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

					<div class="row shadow-lg p-3"
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
								<div class="valid-feedback">Email validated</div>
								<div class="invalid-feedback">Vui Lòng Nhập Email</div>
								<!-- submit button -->
								<div class="col-md-12 m-2">
									<button id="sendBtn" class="btn btn-info" type="submit">
										Gửi Mail</button>
										
										
								</div>
								<h5 style="color: red" id="messageReturn">sssss</h5>
							
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
<script type="text/javascript">
    $('#sendBtn').click(function() {
        $('#messageReturn').text(''); 
        var email = $('#email').val();
        var formData = {'email': email};
        $.ajax({
            url: 'Forgotpassword', 
            type: 'POST', 
            data: formData
        }).then(function(data) { 
            $('#messageReturn').text('Đã Gửi lại mật khẩu, Vui lòng đăng nhập lại');
            setTimeout(function() {
                window.location.href = 'http://localhost:8080/Nhuldypc04788_ASM_SOF301/Index'; 
            }, 5 * 1000);
        }).fail(function(error) {
            $('#messageReturn').text('Email mail chưa được đăng ký, Vui lòng nhập lại Email'); 
        });
    });
</script>
</html>
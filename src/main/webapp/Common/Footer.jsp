<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<footer class="tm-bg-gray pt-5 pb-3 tm-text-gray tm-footer">
	<div class="container-fluid tm-container-small">
		<div class="row">
			<div class="col-lg-6 col-md-12 col-12 px-5 mb-5">
				 <h1 class="tm-text-primary mb-4 tm-footer-title">Chào mừng đến với VietSub phim!</h1>
				 <p>
					<strong>Tất cả Phim đều Miễn phí!</strong>
					<br>
					 Bạn có thể thưởng thức
					tất cả các bộ phim trên trang web của chúng tôi cho cả mục đích cá
					nhân lẫn thương mại mà không phải trả bất kỳ chi phí nào và không
					cần đề cập nguồn gốc.
				</p>
				<p>Hãy tham gia ngay và bắt đầu cuộc hành trình điện ảnh chưa
					từng có!</p>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
				<img src='<c:url value='/Templates/User/img/logo.png' />' alt="Avatar" class="img-fluid my-5" style="width: 500px;" />
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 col-12 px-5 mb-5">
			<h3 class="tm-text-primary mb-4 tm-footer-title">Liên Hệ Với Chúng Tôi</h3>
				<ul class="tm-social-links d-flex justify-content-end pl-0 mb-5">
					<li class="mb-2"><a href="https://facebook.com"><i
							class="fab fa-facebook"></i></a></li>
					<li class="mb-2"><a href="https://twitter.com"><i
							class="fab fa-twitter"></i></a></li>
					<li class="mb-2"><a href="https://instagram.com"><i
							class="fab fa-instagram"></i></a></li>
					<li class="mb-2"><a href="https://pinterest.com"><i
							class="fab fa-pinterest"></i></a></li>
				</ul>
				
			</div>
		</div>
		
	</div>
</footer>
<script src="<c:url value = '/Templates/User/js/plugins.js'/>"></script>
<script>
	$(window).on("load", function() {
		$('body').addClass('loaded');
	});
</script>
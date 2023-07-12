<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${video.title}</title>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/Common/Header.jsp"%>

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-12 tm-text-primary">${video.title}</h2>
			<p>${video.description}</p>
		</div>
		<div class="row tm-mb-90">
			<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
				<iframe id="tm-video"
					src="https://www.youtube.com/embed/${video.href}"></iframe>
			</div>
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12"
				style="padding-left: 60px; padding-right: 60px;">
				<div class="row mb-4">
					<h2 class="col-12 tm-text-primary">Phim mới nổi bật</h2>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5"
					style="width: 400px;">
					<h5 class="tm-text-secondary"
						style="white-space: nowrap; overflow: hidden;">
						${video.title}</h5>
					<figure class="effect-ming tm-video-item">
						<iframe id="tm-video"
							src="https://www.youtube.com/embed/${video.href}"></iframe>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Xem Thêm</h2>
							<a href="<c:url value ='/video?action=watch&id=${video.href}'/>">Xem
								Thêm</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.shares}Share </span> <span>
							${video.view}views</span>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5"
					style="width: 400px;">
					<h5 class="tm-text-secondary"
						style="white-space: nowrap; overflow: hidden;">
						${video.title}</h5>
					<figure class="effect-ming tm-video-item">
						<iframe id="tm-video"
							src="https://www.youtube.com/embed/${video.href}"></iframe>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Xem Thêm</h2>
							<a href="<c:url value ='/video?action=watch&id=${video.href}'/>">Xem
								Thêm</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.shares}Share </span> <span>
							${video.view}views</span>
					</div>
				</div>

				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5"
					style="width: 400px;">
					<h5 class="tm-text-secondary"
						style="white-space: nowrap; overflow: hidden;">
						${video.title}</h5>
					<figure class="effect-ming tm-video-item">
						<iframe id="tm-video"
							src="https://www.youtube.com/embed/${video.href}"></iframe>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Xem Thêm</h2>
							<a href="<c:url value ='/video?action=watch&id=${video.href}'/>">Xem
								Thêm</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">${video.shares}Share </span> <span>
							${video.view}views</span>
					</div>
				</div>
			</div>
		</div>
		<div class=" mb-3 tm-gallery">

			<div class="tm-bg-gray tm-video-details">
				<div class=" mb-5">
					<c:if test="${ not empty sessionScope.currentUser}">
						<div class="btn-group" role="group" aria-label="Basic example">
							<button id="likeOrUnlike" class="btn btn-primary">
								<c:choose>
									<c:when test="${flagLikeBtn == true}">
										UnLike
									</c:when>
									<c:otherwise>Like</c:otherwise>
								</c:choose>

							</button>
							<a class="btn btn-primary">Share</a> <a class="btn btn-primary">DownLoad</a>
						</div>
					</c:if>
				</div>
				<input id="videoInHdn" type="hidden" value="${video.href}">
				<div class="mb-4 d-flex flex-wrap">
					<div class="mr-4 mb-2">
						<span class="tm-text-gray-dark">Resolution: </span>
						<span class="tm-text-primary">1920x1080</span>
					</div>
					<div class="mr-4 mb-2">
						<span class="tm-text-gray-dark">Format: </span><span
							class="tm-text-primary">MP4</span>
					</div>
					<div>
						<span class="tm-text-gray-dark">Duration: </span><span
							class="tm-text-primary">00:00:20</span>
					</div>
				</div>
				<div class="mb-4">
					<h3 class="tm-text-gray-dark mb-3">License</h3>
					<p>Free for both personal and commercial use. No need to pay
						anything. No need to make any attribution.</p>
				</div>
			</div>


			<!-- row -->
		</div>
	</div>
	<hr style="color: aliceblue;">

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>
	<script>
		$('#likeOrUnlike').click(function() {
			var videoId = $('#videoInHdn').val();
			$.ajax({
				url : 'video?action=like&id=' + videoId
			}).then(function() {
				var text = $('#likeOrUnlike').text();
				if (text.indexOf('Like') != -1) {
					$('#likeOrUnlike').text('Unlike');
				} else {
					$('#likeOrUnlike').text('Like');
				}
			}).fail(function(error) {
				alert('Vui Lòng Thử Lại')
			})
		});
	</script>
</body>
</html>
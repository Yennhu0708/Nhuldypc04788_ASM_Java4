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
	<div class="container-fluid tm-container-content tm-mt-60 mb-5">
		<div class="row">
			<h2 class="col-12 tm-text-primary">${video.title}</h2>
			<p>${video.description}</p>
			<div class="col-lg-8">
				<div class="frame9">
					<div class="bbb mb-3 mt-3">
						<iframe src="https://www.youtube.com/embed/${video.href}"
							frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
				</div>

			</div>
			<div class="col-lg-4 mb-2">
				<div class="scrollable-div">
					<div class="input-group rounded">
						<input type="search" class="form-control rounded"
							placeholder="Search" aria-label="Search"
							aria-describedby="search-addon" /> <span
							class="input-group-text border-0" id="search-addon"> <i
							class="fas fa-search"></i>
						</span>
					</div>
					<div class="video-container mb-3 mt-3">
						<!-- Video 1 -->
						<iframe src="https://www.youtube.com/embed/uK65CKmpWSQ"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
					<div class="video-container mb-3 mt-3">
						<!-- Video 2 -->
						<iframe src="https://www.youtube.com/embed/FxHdbyGDyBo"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
					<div class="video-container mb-3 mt-3">
						<!-- Video 3 -->
						<iframe src="https://www.youtube.com/embed/HHsJxaLHsIU"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>
					</div>
					<!-- Thêm video khác nếu cần -->
				</div>
			</div>
		</div>
		<div class="  mb-5 tm-gallery">
			<div class="tm-bg-gray tm-video-details">
				<div class=" mb-5">
					<c:if test="${ empty sessionScope.currentUser}">
						<div class="btn-group" role="group" aria-label="Basic example">
							<button type="button" class="btn btn-secondary">Like</button>
							<button type="button" class="btn btn-secondary">Share</button>
							<button type="button" class="btn btn-secondary">DownLoad</button>
						</div>
					</c:if>
					<c:if test="${ not empty sessionScope.currentUser}">
						<div class="btn-group" role="group" aria-label="Basic example">
							<button id="likeOrUnlike" class="btn btn-danger">
								<c:choose>
									<c:when test="${flagLikeBtn == true}">
										UnLike
									</c:when>
									<c:otherwise>Like</c:otherwise>
								</c:choose>

							</button>
							<a class="btn btn-warning">Share</a> <a class="btn btn-success">DownLoad</a>
						</div>
					</c:if>
				</div>
				<input id="videoInHdn" type="hidden" value="${video.href}">
				<div class="mb-4 d-flex flex-wrap">
					<div class="mr-4 mb-2"></div>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${sessionScope.currentUser.username}'s favorites</title>
<%@ include file="/Common/Head.jsp"%>
</head>
<body>
	<!-- Header -->
	<%@ include file="/Common/Header.jsp"%>

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">
			<h2 class="col-6 tm-text-primary">Phim Yêu Thích Của Bạn</h2>
			<div class="col-6 d-flex justify-content-end align-items-center">
				<form action="" class="tm-text-primary">
					Page <input type="text" value="1" size="1"
						class="tm-input-paging tm-text-primary"> of 200
				</form>
			</div>
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach items="${videos}" var="video">
			 <div class="col-sm-6 col-md-3 col-lg-2 mb-4">
				<h5 class="tm-text-secondary" style="white-space: nowrap; overflow: hidden;" >
								${video.title}
				</h5>
				
					<figure class="effect-ming tm-video-item">
						<img src="<c:url value = '/Templates/User/img/img-03.jpg'/>"
							alt="Image" class="img-fluid">
						<%-- <c:if test="${ not empty sessionScope.currentUser}"> --%>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>View more</h2>
							<a href="<c:url value = '/video?action=watch&id=${video.href}'/>">View more</a>
						</figcaption>
					<%-- 	</c:if> --%>
					</figure>
					
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light"> ${video.shares} shares</span> 
						<span>${video.view} views</span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
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

	<div class="container-fluid tm-container-content tm-mt-60">
		<div class="row mb-4">

			<h2 class="col-6 tm-text-primary">
				<i class="fas fa-film mr-2"></i> Phim Mới Năm 2023
			</h2>
			<div class="col-6 d-flex justify-content-end align-items-center">
				<form action="" class="tm-text-primary">
				 Page <span id="currentPage">${currentPage}</span> of <span id="totalPages"> ${maxPage}</span>
					
				</form>
			</div>
		</div>
		<div class="row tm-mb-90 tm-gallery">
			<c:forEach items="${videos}" var="video">
				<div class="col-sm-12 col-md-6 col-lg-4 mb-4">
					<h5 class="tm-text-secondary"
						style="white-space: nowrap; overflow: hidden;">
						${video.title}</h5>

					<figure class="effect-ming tm-video-item">
						<img src="${video.poster}" alt="Image" class="img-fluid">
						<%-- <c:if test="${ not empty sessionScope.currentUser}"> --%>
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>View more</h2>
							<a href="<c:url value = '/video?action=watch&id=${video.href}'/>">View
								more</a>
						</figcaption>
						<%-- 	</c:if> --%>
					</figure>

					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light"> ${video.shares} shares</span> <span>${video.view}
							views</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- row -->
		<div class="row tm-mb-90">
			<div
				class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
				<c:if test="${currentPage == 1}">
				<a href="javascript:void(0);" ><i class="fa-solid fa-backward-fast fa-2xl" style="color: #d4dddd;"></i></a>
				</c:if>
				<c:if test="${currentPage > 1}">
				<a href="Index?page=${currentPage - 1}"><i class="fa-solid fa-backward-fast fa-2xl" style="color: #24e7f5;"></i></a>
				</c:if>
				
				<div class="tm-paging d-flex">
					<c:forEach varStatus="i" begin="1" end="${maxPage}">
						<a href="Index?page=${i.index}" class="tm-paging-link ${currentPage == i.index ? 'active' : '' }">${i.index}</a>
					</c:forEach>
				</div>
				<c:if test="${currentPage == maxPage}">
				<a href="javascript:void(0);"><i class="fa-solid fa-forward-fast fa-2xl disabled" style="color: #d4dddd;"></i></a>
				</c:if>
				<c:if test="${currentPage < maxPage}">
				<a href="Index?page=${currentPage + 1}"><i class="fa-solid fa-forward-fast fa-2xl disabled" style="color: #24e7f5;"></i></a>
				</c:if>
				
			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@ include file="/Common/Footer.jsp"%>

</body>
</html>
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
			${video.title}
		</div>
		<div class="row tm-mb-90">
			<div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
				<iframe id="tm-video"
					src="https://www.youtube.com/embed/${video.href}"></iframe>
			</div>
			<div class="col-xl-4 col-lg-5 col-md-6 col-sm-12"
				style="padding-left: 60px; padding-right: 60px;">
				<div class="row mb-4">
					<h2 class="col-12 tm-text-primary">Related Videos</h2>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<figure class="effect-ming tm-video-item">
						<img src="img/img-01.jpg" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Hangers</h2>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">12 Oct 2020</span> <span>12,460
							views</span>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<figure class="effect-ming tm-video-item">
						<img src="img/img-02.jpg" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Perfumes</h2>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">18 Oct 2020</span> <span>11,402
							views</span>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<figure class="effect-ming tm-video-item">
						<img src="img/img-03.jpg" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Clocks</h2>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">16 Oct 2020</span> <span>9,906
							views</span>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<figure class="effect-ming tm-video-item">
						<img src="img/img-04.jpg" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>Plants</h2>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">12 Oct 2020</span> <span>16,100
							views</span>
					</div>
				</div>
				<div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
					<figure class="effect-ming tm-video-item">
						<img src="img/img-08.jpg" alt="Image" class="img-fluid">
						<figcaption
							class="d-flex align-items-center justify-content-center">
							<h2>New York</h2>
							<a href="#">View more</a>
						</figcaption>
					</figure>
					<div class="d-flex justify-content-between tm-text-gray">
						<span class="tm-text-gray-light">9 Sep 2020</span> <span>11,300
							views</span>
					</div>
				</div>
			</div>
		</div>
		<div class=" mb-3 tm-gallery">

			<div class="tm-bg-gray tm-video-details">
				<p class="mb-4"></p>
				<div class=" mb-5">
					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-primary">Like</button>
						<button type="button" class="btn btn-primary">Share</button>
						<button type="button" class="btn btn-primary">DownLoad</button>
					</div>
				</div>
				<div class="mb-4 d-flex flex-wrap">
					<div class="mr-4 mb-2">
						<span class="tm-text-gray-dark">Resolution: </span><span
							class="tm-text-primary">1920x1080</span>
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

</body>
</html>
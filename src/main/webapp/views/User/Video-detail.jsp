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
<style>
    .video-title2 {
        display: block;
        margin-top: 5px;
        color: black; /* Change to black */
        font-weight: bolder;
    }

    .video-title2:hover {
        color: #007f46; /* Change to green */
    }

    .modal {
        display: flex;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.6); /* Make it slightly darker */
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        position: relative;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .close {
        color: black; /* Change to black */
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: red;
        text-decoration: none;
    }

    .modal-content {
        background-color: rgba(255, 255, 255, 0.8); /* Make it slightly more transparent */
    }

    .modal-content form {
        border-radius: 10px;
        border: none; /* Remove the border */
        padding: 10px;
    }

    .modal-content form button {
        background-color: #24c5aba6;
        color: #242424;
        border: none;
        padding: 8px 16px;
        cursor: pointer;
        outline: none;
        float: right; /* Move the button to the right */
    }

    .modal-content form button:hover {
        background-color: #00ffd6a6;
         color: white;
    }
</style>

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
				 <h1 class="text-info">${video.title}</h1>
				 <input id="videoInHdn" type="hidden" value="${video.href}">
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
							<a class="btn btn-warning" onclick="openModal()">Share</a> 
							<a class="btn btn-success">DownLoad</a>
						</div>
					</c:if>
				</div>
				<div class="mb-4">
					<h3 class="tm-text-gray-dark mb-3">Nội dung phim: </h3>
					<p class="text-white">${video.description}</p>
					
				</div>
			</div>


			<!-- row -->
		</div>
	</div>
	<hr style="color: aliceblue;">
<div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class=" row justify-content-center align-items-center">
                <form action="video" method="POST">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="fw-bold" for="profilePass">Title: </label> 
                                <input type="text" class="form-control mt-2 mb-2" name="sharetitle" 
                                value="${video.title}" readonly>
                                <input type="text" class="form-control mt-2 mb-2" name="sharehref" 
                                value="${video.href}" readonly>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <label class="fw-bold" for="profileID">TO: </label> 
                                <input type="email" class="form-control mt-2 mb-2" name="toEmail" required>
                            </div>
                        </div>                                                
                    </div>
                    <hr>
                    <div class="text-center">
                        <button type="submit" class="btn btn-lg courseHover">Chia Sẻ</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
		
		

		// Lấy tham chiếu đến modal
        var modal = document.getElementById("myModal");

        // Mở modal
        function openModal() {
            modal.style.display = "block";
        }

        // Đóng modal
        function closeModal() {
            modal.style.display = "none";
        }
		
        // Tắt hiện modal khi trang load xong
        window.onload = function() {
          closeModal();
        };
        
        // Đóng modal khi nhấn bên ngoài modal
        window.onclick = function (event) {
            if (event.target == modal) {
                closeModal();
            }
        };
	</script>
</body>
</html>
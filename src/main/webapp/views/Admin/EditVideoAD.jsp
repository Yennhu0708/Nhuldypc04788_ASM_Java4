<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/Common/Taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SARAH VIDEOS</title>
<%@ include file="/Common/Admin/HeadAd.jsp"%>
</head>
<body>
	<%@ include file="/Common/Admin/HeaderAD.jsp"%>

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
		     <div class="container-fluid"> 
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title"> Chỉnh Sửa Video </h4>
								<p class="card-description"></p>
								<form action="EditVideo" class="forms-sample" method="post">
									<div class="form-group">
										<label for="exampleInputName1">Youtube ID</label> <input
											type="text" value="${video.href}" class="form-control"
											id="exampleInputName1" name="href">
									</div>
									<div class="form-group">
										<label for="exampleInputEmail3">Video Title</label> <input
											type="text" value="${video.title}" class="form-control"
											id="exampleInputEmail3" name="title">
									</div>
									<div class="form-group">
										<label for="exampleInputName1">Image Link</label> <input
											type="text" value="${video.poster}" class="form-control"
											id="exampleInputName1" name="poster"
											onchange="previewImage(this.value)">
									</div>
									<div class="form-group">
										<label for="imagePreview">Image Preview:</label>
										<div class="image-container">
											<img alt="" src="${video.poster}" class="img-fluid w-50"
												id="previewImg">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-sm-3 col-form-label">Status</label>
										<div class="col-sm-4">
											<div class="form-check">
												<label class="form-check-label"> 
												<input type="radio" ${video.isActive == true ? 'checked' : ''}
													class="form-check-input" name="status"
													id="membershipRadios1" value="true" checked> Active
												</label>
											</div>
										</div>
										<div class="col-sm-5">
											<div class="form-check">
												<label class="form-check-label"> 
												<input type="radio" ${video.isActive == false ? 'checked' : ''}
													class="form-check-input" name="status"
													id="membershipRadios2" value="false"> Inactive
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="exampleTextarea1">Description</label>
										<textarea value="description" class="form-control"
											id="exampleTextarea1" rows="4description" name="description">${video.description}</textarea>
									</div>
									<input type="hidden" value="${video.id}" class="form-control" name="id">
									<button type="submit" class="btn btn-outline-info">Chỉnh Sửa</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

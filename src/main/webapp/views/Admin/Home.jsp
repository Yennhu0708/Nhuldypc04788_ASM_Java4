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
		
		<div style="width: 80%; margin: auto;">
        <canvas id="videoChart"></canvas>
    </div>

    <%-- Dữ liệu lượt xem video từ máy chủ JSP --%>
    <%
        // Giả sử bạn có một danh sách lượt xem video từ cơ sở dữ liệu.
        // Ở đây, tôi sẽ sử dụng một mảng giả định để đại diện cho dữ liệu.
        int[] videoViews = {100, 200, 300, 400, 500}; // Số lượt xem video theo thời gian.

        // Chuyển dữ liệu lượt xem video sang định dạng JSON để sử dụng trong JavaScript.
        StringBuilder data = new StringBuilder("[");
        for (int i = 0; i < videoViews.length; i++) {
            data.append(videoViews[i]);
            if (i < videoViews.length - 1) {
                data.append(",");
            }
        }
        data.append("]");
    %>

    <script>
        // Dữ liệu lượt xem video từ máy chủ JSP được chuyển sang JavaScript.
        var videoViewsData = <%= data.toString() %>;

        // Vẽ biểu đồ bằng Chart.js
        var ctx = document.getElementById('videoChart').getContext('2d');
        var videoChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Ngày 1', 'Ngày 2', 'Ngày 3', 'Ngày 4', 'Ngày 5'], // Các nhãn trục x (có thể tùy chỉnh theo dữ liệu thực tế).
                datasets: [{
                    label: 'Lượt xem video',
                    data: videoViewsData,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
		
		
		</div>
	</div>

</body>
</html>
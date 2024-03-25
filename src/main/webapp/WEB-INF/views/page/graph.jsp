<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>[${graph[0].id}]님 프로필</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-datalabels/2.2.0/chartjs-plugin-datalabels.min.js" integrity="sha512-JPcRR8yFa8mmCsfrw4TNte1ZvF1e3+1SdGMslZvmrzDYxS69J7J49vkFL8u6u8PlPJK+H3voElBtUCzaXj+6ig==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <div id="chartContainer" style="position: relative; width: 600px; height: 400px;">
        <canvas id="myChart" width="400" height="400"></canvas>
    </div>
    <br>
    ${graph[0].id} 님의 체중변화 그래프
    <br><br>
    <c:forEach var="graph" items="${graph}">
    	일자: ${graph.datetime}
    	<button type="button" class="delBtn" data-id="${graph.no}">삭제</button>
    	<br>
    	체중 : ${graph.weight} kg / 신장 : ${graph.height} cm
    	<br><br>
    </c:forEach>
    
    <!-- 차트 그려주는 스크립트 -->
    <script>

        var ctx = document.getElementById('myChart').getContext('2d');
        
        var dates = [];
        var weights = [];
        var heights = [];
        var bmis = [];

        const skipped = (ctx, value) => ctx.p0.skip || ctx.p1.skip ? value : undefined;
        const down = (ctx, value) => ctx.p0.parsed.y > ctx.p1.parsed.y ? value : undefined;
        
        
        <c:forEach var="graph" items="${graph}">
            dates.push('${graph.datetime}');
            weights.push('${graph.weight}');
            heights.push('${graph.height}');
        </c:forEach>

        function calculateBMI(weight, height) {
            var heightInMeter = height / 100;
            var bmi = weight / (heightInMeter * heightInMeter);
            return Math.round(bmi * 10) / 10;
        }

        for (var i = 0; i < weights.length; i++) {
            var bmi = calculateBMI(parseFloat(weights[i]), parseFloat(heights[i]));
            bmis.push(bmi);
        }

        const topLabels={
        		id: 'topLabels',
        		afterDatasetsDraw(chart, args, pluinOptions){
        			const {ctx, scales:{x,y}}=chart; 
        			chart.data.datasets[0].data.forEach((datapoint, index)=>{
        				const datasetArray=[];
        				chart.data.datasets.forEach((dataset)=>{
        					datasetArray.push(dataset.data[index])
        				})
        			})
        			ctx.font='bold 12px sans-serif';
        			ctx.fillStyle='blue';
        			ctx.textAlign='end';
        		}
        }
        
        
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: dates,
                datasets: [{
                    label: 'Weight (kg)',
                    data: weights,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1,
//                     yAxisID: 'left-y-axis',
                    barThickness: 15,
                    datalabels: {
                        color: 'red',
                        align: 'end',
                        anchor: 'end',
                        font: { weight: 'bold' },
                      }
                }, 
                {
                    label: 'BMI',
                    data: bmis,
                    type: 'line',
                    fill: false,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 2,
                    segment: {
                        borderColor: ctx => skipped(ctx, 'rgb(0,0,0,0.2)') || down(ctx, 'rgb(192,71,75)'),
                        borderDash: ctx => skipped(ctx, [6, 6]),
                      },
                      datalabels: {
                          color: 'blue',
                          align: 'end',
                          anchor: 'end',
                          font: { weight: 'bold' },
                        }
//                     yAxisID: 'right-y-axis'
                }]
            },            
//             plugins:[ChartDataLabels],
            plugins:[ChartDataLabels, topLabels],

            options: {
                maintainAspectRatio: false,
                aspectRatio: 1,
                scales: {
                    yAxes: [{
//                         id: 'left-y-axis',
                        type: 'linear',
                        position: 'left',
                        ticks: {
                            beginAtZero: true
                        }
                    }, {
//                         id: 'right-y-axis',
                        type: 'linear',
                        position: 'right',
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
            }
        });
    </script>

	<!-- 데이터 삭제 스크립트 -->
	<script>
		$(document).ready(function() {
		    // 삭제 버튼 클릭 이벤트
		    $('.delBtn').click(function() {
		        var id = $(this).data('id'); // 삭제할 데이터의 식별자 가져오기
		        $.ajax({
		            url: '/page/delete/' + id,
		            type: 'DELETE',
		            success: function(response) {
		                console.log('데이터가 성공적으로 삭제되었습니다.');
		                window.location.reload();
		            },
		            error: function(xhr, status, error) {
		                console.error('데이터 삭제 중 오류가 발생했습니다.');
		            }
		        });
		    });
		});
	</script>
</body>
</html>

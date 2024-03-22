<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <title>곡선 차트</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <canvas id="myChart" width="400" height="400"></canvas>

    <script>
        // 날짜와 BMI 데이터
        var dates = [];
        var weights = [];
        var heights = [];
        var bmis = [];

        // 날짜와 몸무게, 키 데이터를 서버에서 받아오기
        <c:forEach var="graph" items="${graph}">
            dates.push('${graph.datetime}');
            weights.push('${graph.weight}');
            heights.push('${graph.height}');
        </c:forEach>

        // BMI 계산 함수
        function calculateBMI(weight, height) {
            // 키를 미터로 변환
            var heightInMeter = height / 100;
            // BMI 계산
            var bmi = weight / (heightInMeter * heightInMeter);
            // 소수점 첫째 자리까지 반올림
            return Math.round(bmi * 10) / 10;
        }

        // 날짜별 BMI 계산
        for (var i = 0; i < weights.length; i++) {
            var bmi = calculateBMI(parseFloat(weights[i]), parseFloat(heights[i]));
            bmis.push(bmi);
        }

        // Chart.js를 사용하여 곡선 차트 생성
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: dates,
                datasets: [{
                    label: 'BMI',
                    data: bmis,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }]
            },
            options: {
            	maintainAspectRatio: false, // 종횡비 유지 비활성화
                aspectRatio: 1, // 종횡비 (가로:세로 비율)
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>
</body>
</html>

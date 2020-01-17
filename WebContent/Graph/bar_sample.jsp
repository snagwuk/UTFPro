
<%@page import="visualChart.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title></title>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/Chart.min.js"></script>
</head>
<%
	JSONObject json = new JSONObject();
	json.setName("sample");
	json.putkey("January","February","March","April","May","June","July", "August", "September", "October", "November", "December");
	Integer[] num1 = {99,34,56,12,14,56,22,11,23,33,12,33};
	String[] num2 = {"12","34","56","12","14","56","22","11","23","33","12","33"};
	Integer[] num3 = {15,24,36,62,74,16,62,31,53,63,72,63};
	json.putValue(num1);
	json.putValue(num3);
%>
<body>
	<div style="width: 60%">
		<canvas id="canvas" height="450" width="600"></canvas>
	</div>
	<input type="button" id="btnAdd" value="add data">

	<script type="text/javascript">
	var data  = <%=json%>
		var randomScalingFactor = function(){ return Math.round(Math.random()*100)};
		var months = ["January","February","March","April","May","June","July", "August", "September", "October", "November", "December"];
		var barChart = null;
		var barChartData = {
			labels : ["aaaa","bbbb","ccc","April","May","June","July"],
			datasets : [
				{
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data : [
						data.sample[0].January,
						data.sample[0].February ,
						data.sample[0].March ,
						data.sample[0].April ,
						data.sample[0].May ,
						data.sample[0].June ,
						data.sample[0].July ]

				},
				{
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [
						data.sample[1].January,
						data.sample[1].February ,
						data.sample[1].March ,
						data.sample[1].April ,
						data.sample[1].May ,
						data.sample[1].June ,
						data.sample[1].July ]
				}
			]

		};

		$(function() {
			var ctx = document.getElementById("canvas").getContext("2d");
			barChart = new Chart(ctx).Bar(barChartData, {
				//Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
				scaleBeginAtZero : false,
				//Boolean - Whether grid lines are shown across the chart
				scaleShowGridLines : true,
				//String - Colour of the grid lines
				scaleGridLineColor : "rgba(0,0,0,0.05)",
				//Number - Width of the grid lines
				scaleGridLineWidth : 1,
				//Boolean - If there is a stroke on each bar
				barShowStroke : false,
				//Number - Pixel width of the bar stroke
				barStrokeWidth : 2,
				//Number - Spacing between each of the X value sets
				barValueSpacing : 5,
				//Number - Spacing between data sets within X values
				barDatasetSpacing : 1,
				onAnimationProgress: function() {
					console.log("onAnimationProgress");
				},
				onAnimationComplete: function() {
					console.log("onAnimationComplete");
				}
			});
		});

		$("input#btnAdd").on("click", function() {
			barChart.addData(
				[randomScalingFactor(),randomScalingFactor()], 
				months[(barChart.datasets[0].bars.length)%12]
			);
		});

		$("canvas").on("click", function(e) {
			var activeBars = barChart.getBarsAtEvent(e);
			console.log(activeBars);

			for(var i in activeBars) {
				console.log(activeBars[i].value);
			}
		});

	</script>
</body>
</html>
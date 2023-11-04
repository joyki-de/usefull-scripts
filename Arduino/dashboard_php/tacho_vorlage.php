<?php require_once 'mysql_vorlage.php'; ?>


<!DOCTYPE html>
<html>
    <head>
        <title>Vorlage</title>
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
   <script type="text/javascript">
      google.charts.load('current', {'packages':['gauge']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Label', 'Value'],          
          ['Vorlage', <?php echo intval(($tempvorlage)); ?>],
        ]);

        var options = {
          width: 300, height: 300,
          greenFrom: 10, greenTo:20,
          yellowFrom: 20, yellowTo: 30,
          redFrom: 30, redTo: 40,
          min: 0, max: 00,          
          minorTicks: 5
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div'));
        chart.draw(data, options);

}

    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 300px; height: 300px;"></div>
  </body>

</html>

if [ "$UID" -ne "0" ]
then
  echo "You are not root. Exiting.."
  exit 1
fi

set -e


echo "................... installing apache .............."
apt install -y apache2
systemctl reload apache2


echo "................... creating index.html .............."
mkdir /var/www/html/capy

cat << BASTA > /var/www/html/capy/index.html
<!DOCTYPE html>
<html>
<head>
    <title>CPU Load Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        canvas {
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
        }
    </style>
</head>
<body>
    <div style="width: 80%; margin: auto;">
        <canvas id="myChart"></canvas>
    </div>

    <script>
        // Initialize empty arrays for labels (time) and data (CPU load)
        var labels = [];
        var data = [];

        // Chart.js configuration
        var ctx = document.getElementById('myChart').getContext('2d');
        var chart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'CPU Load',
                    data: data,
                    borderColor: 'blue',
                    backgroundColor: 'transparent',
                    borderWidth: 2
                }]
            },
            options: {
                scales: {
                    xAxes: [{
                        type: 'time',
                        time: {
                            unit: 'second'
                        },
                        distribution: 'linear',
                        position: 'bottom'
                    }],
                    yAxes: [{
                        type: 'linear',
                        position: 'left'
                    }]
                }
            }
        });

        // Function to fetch CPU load data
        function fetchCPUData() {
            // Simulated CPU load data (replace this with actual data fetch)
            var cpuLoad = Math.random() * 100;

            // Get current time as label
            var currentTime = new Date();
            labels.push(currentTime.toLocaleTimeString());
            data.push(cpuLoad);

            // Limit the number of data points to show
            if (labels.length > 10) {
                labels.shift();
                data.shift();
            }

            // Update the chart
            chart.update();
        }

        // Call fetchCPUData() every 2 seconds
        setInterval(fetchCPUData, 2000);
    </script>
</body>
</html>
BASTA


echo "============ DONE =============="
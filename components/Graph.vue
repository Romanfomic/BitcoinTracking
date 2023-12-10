<template>
  <div>
    <canvas id="myChart" width="400" height="100"></canvas> 
  </div>
</template>

<script setup>
  import axios from 'axios';
  import { onMounted, watch, toRefs } from 'vue';
  import { Chart, LineController, LinearScale, CategoryScale, LineElement, PointElement, registerables  } from 'chart.js';

  Chart.register(
    LineController,
    LinearScale,
    CategoryScale,
    LineElement,
    PointElement,
    ...registerables
  );

  const props = defineProps({
    firstDate: String,
    lastDate: String
  });

  const { firstDate, lastDate } = toRefs(props);

  const config = useRuntimeConfig();
  let myChart;

  const fetchBitcoinPrices = async () => {
    try {
      if (true) {
        const apiUrl = `http://localhost:3000/api/data?first_date=${firstDate.value}&last_date=${lastDate.value}`;
        const response = await axios.get(apiUrl);

        const apiData = response.data;

        const labels = apiData.map(d => new Date(d.date).toLocaleDateString());
        const data = apiData.map(d => d.price);

        initChart(labels, data);
      }
    } catch (error) {
      console.log('Error request to API:', error);
    }
  };

  const initChart = (lables, data) => {
    const ctx = document.getElementById('myChart');
    myChart?.destroy();

    myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: lables,
      datasets: [{
        label: 'USD',
        data: data,
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
}
onMounted(fetchBitcoinPrices);
watch(fetchBitcoinPrices);
</script>


<style>
#myChart {
  padding: 10px;
}
</style>
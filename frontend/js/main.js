const backendUrl = 'http://localhost:3000/api/dhcp';

async function fetchLeases() {
  const res = await fetch(`${backendUrl}/leases`);
  const data = await res.json();
  const leasesList = document.getElementById('leasesList');
  leasesList.innerHTML = '';
  for (let client in data) {
    const li = document.createElement('li');
    li.textContent = `${client} → ${data[client]}`;
    leasesList.appendChild(li);
  }
}

async function fetchLogs() {
  const res = await fetch(`${backendUrl}/logs`);
  const data = await res.json();
  const logsList = document.getElementById('logsList');
  logsList.innerHTML = '';
  data.logs.forEach(line => {
    const li = document.createElement('li');
    li.textContent = line;
    logsList.appendChild(li);
  });
}



// Refresh leases & logs every 5 seconds
setInterval(() => {
  fetchLeases();
  fetchLogs();
}, 5000);

// Initial fetch
fetchLeases();
fetchLogs();

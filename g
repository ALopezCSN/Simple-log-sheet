<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>CSN Panel</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body {
      font-family: system-ui, sans-serif;
      background: #020617;
      color: #e5e7eb;
      min-height: 100vh;
    }
    .page {
      display: none;
      max-width: 1000px;
      margin: 0 auto;
      padding: 2rem 1.5rem 3rem;
    }
    .page.active { display: block; }
    h1, h2, h3 {
      color: #f9fafb;
      margin-bottom: 0.75rem;
    }
    h1 { font-size: 2rem; }
    h2 { font-size: 1.5rem; margin-top: 1.5rem; }
    h3 { font-size: 1.1rem; margin-top: 1rem; }
    p.sub {
      color: #9ca3af;
      margin-bottom: 1.5rem;
    }
    .btn {
      display: block;
      width: 100%;
      text-align: center;
      padding: 0.9rem 1rem;
      margin: 0.4rem 0;
      border-radius: 0.6rem;
      border: 1px solid #1f2937;
      background: #020617;
      color: #e5e7eb;
      font-size: 1rem;
      cursor: pointer;
      text-decoration: none;
      transition: background 0.15s, border-color 0.15s;
    }
    .btn:hover {
      background: #111827;
      border-color: #374151;
    }
    .btn-primary {
      background: #1d4ed8;
      border-color: #1d4ed8;
    }
    .btn-primary:hover {
      background: #2563eb;
      border-color: #2563eb;
    }
    .btn-return {
      margin-top: 1.5rem;
      background: #4b5563;
      border-color: #4b5563;
    }
    label {
      display: block;
      margin: 0.4rem 0 0.15rem;
      font-size: 0.9rem;
      color: #cbd5f5;
    }
    input, select, textarea {
      width: 100%;
      padding: 0.5rem 0.6rem;
      border-radius: 0.4rem;
      border: 1px solid #1f2937;
      background: #020617;
      color: #e5e7eb;
      font-size: 0.95rem;
      resize: vertical;
    }
    input:focus, select:focus, textarea:focus {
      outline: none;
      border-color: #2563eb;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 0.75rem;
      font-size: 0.9rem;
    }
    th, td {
      border: 1px solid #1f2937;
      padding: 0.45rem;
      text-align: left;
    }
    th {
      background: #020617;
      color: #e5e7eb;
    }
    tbody tr:nth-child(even) {
      background: #020617;
    }
    .no-logs {
      margin-top: 0.5rem;
      color: #9ca3af;
      font-size: 0.9rem;
    }
    .total {
      margin-top: 0.4rem;
      font-size: 0.9rem;
      color: #a5b4fc;
    }
    .section-box {
      margin-top: 1rem;
      padding-top: 0.5rem;
      border-top: 1px solid #1f2937;
    }
  </style>
</head>
<body>

<!-- HOME -->
<div id="home" class="page active">
  <h1>CSN Panel</h1>
  <p class="sub">Hours, trainings, ride alongs, mainlinks, and evaluations.</p>

  <button class="btn btn-primary" onclick="openPage('mainlinks')">Mainlinks</button>
  <button class="btn btn-primary" onclick="openPage('logs')">Logs (Hours & Trainings & Ride Alongs)</button>
  <button class="btn btn-primary" onclick="openPage('eval')">Evaluation Sheet</button>
</div>

<!-- MAINLINKS -->
<div id="mainlinks" class="page">
  <h2>Mainlinks</h2>
  <p class="sub">Replace these with your real URLs.</p>

  <!-- Replace # with your real links -->
  <a class="btn" href="#" target="_blank">DHS</a>
  <a class="btn" href="#" target="_blank">RDF</a>
  <a class="btn" href="#" target="_blank">AVO</a>

  <button class="btn btn-return" onclick="openPage('home')">Return Home Page</button>
</div>

<!-- LOGS -->
<div id="logs" class="page">
  <h2>Logs</h2>
  <p class="sub">Hours, DHS/RDF/AVO trainings, and ride alongs are saved on this device.</p>

  <!-- HOURS LOG -->
  <div class="section-box">
    <h3>Hours Log</h3>
    <form id="hoursForm" onsubmit="saveHours(event)">
      <label for="hoursDate">Date</label>
      <input type="date" id="hoursDate" required>

      <label for="hoursDivision">Division</label>
      <select id="hoursDivision" required>
        <option value="">Select...</option>
        <option value="General">General</option>
        <option value="DHS">DHS</option>
        <option value="RDF">RDF</option>
        <option value="AVO">AVO</option>
      </select>

      <label for="hoursAmount">Hours</label>
      <input type="number" id="hoursAmount" min="0" step="0.25" placeholder="e.g. 1.5" required>

      <label for="hoursNotes">Notes</label>
      <textarea id="hoursNotes" rows="2" placeholder="What you did"></textarea>

      <button type="submit" class="btn btn-primary" style="margin-top:0.6rem;">Save Hours</button>
    </form>

    <div id="hoursTotals" class="total"></div>
    <div id="hoursEmpty" class="no-logs">No hours logged yet.</div>
    <table id="hoursTable" style="display:none;">
      <thead>
        <tr>
          <th>Date</th>
          <th>Division</th>
          <th>Hours</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody id="hoursBody"></tbody>
    </table>
  </div>

  <!-- TRAINING LOG -->
  <div class="section-box">
    <h3>DHS / RDF / AVO Trainings</h3>
    <form id="trainingForm" onsubmit="saveTraining(event)">
      <label for="trainingDate">Date</label>
      <input type="date" id="trainingDate" required>

      <label for="trainingDivision">Division</label>
      <select id="trainingDivision" required>
        <option value="">Select...</option>
        <option value="DHS">DHS</option>
        <option value="RDF">RDF</option>
        <option value="AVO">AVO</option>
      </select>

      <label for="trainingTopic">Training Name / Topic</label>
      <input type="text" id="trainingTopic" placeholder="e.g. DHS Patrol Training" required>

      <label for="trainingNotes">Notes</label>
      <textarea id="trainingNotes" rows="2" placeholder="Summary / notes"></textarea>

      <button type="submit" class="btn btn-primary" style="margin-top:0.6rem;">Save Training</button>
    </form>

    <div id="trainingEmpty" class="no-logs">No trainings logged yet.</div>
    <table id="trainingTable" style="display:none;">
      <thead>
        <tr>
          <th>Date</th>
          <th>Division</th>
          <th>Training</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody id="trainingBody"></tbody>
    </table>
  </div>

  <!-- RIDE ALONG LOG -->
  <div class="section-box">
    <h3>Ride Along Log</h3>
    <form id="rideAlongForm" onsubmit="saveRideAlong(event)">
      <label for="raDate">Date</label>
      <input type="date" id="raDate" required>

      <label for="raOfficer">Officer / Unit</label>
      <input type="text" id="raOfficer" placeholder="Unit / Officer name" required>

      <label for="raNotes">Notes</label>
      <textarea id="raNotes" rows="3" placeholder="Summary of ride along" required></textarea>

      <button type="submit" class="btn btn-primary" style="margin-top:0.6rem;">Save Ride Along</button>
    </form>

    <div id="rideAlongEmpty" class="no-logs">No ride alongs logged yet.</div>
    <table id="rideAlongTable" style="display:none;">
      <thead>
        <tr>
          <th>Date</th>
          <th>Officer / Unit</th>
          <th>Notes</th>
        </tr>
      </thead>
      <tbody id="rideAlongBody"></tbody>
    </table>
  </div>

  <button class="btn btn-return" onclick="openPage('home')">Return Home Page</button>
</div>

<!-- EVALUATION SHEET -->
<div id="eval" class="page">
  <h2>Evaluation Sheet</h2>
  <p class="sub">Simple eval log for DHS / RDF / AVO.</p>

  <form id="evalForm" onsubmit="saveEval(event)">
    <label for="evalDate">Date</label>
    <input type="date" id="evalDate" required>

    <label for="evalDivision">Division</label>
    <select id="evalDivision" required>
      <option value="">Select...</option>
      <option value="DHS">DHS</option>
      <option value="RDF">RDF</option>
      <option value="AVO">AVO</option>
    </select>

    <label for="evalType">Eval Type</label>
    <select id="evalType" required>
      <option value="">Select...</option>
      <option value="Eval">Eval</option>
      <option value="Full Eval">Full Eval</option>
    </select>

    <label for="evalNotes">Notes / Result</label>
    <textarea id="evalNotes" rows="3" placeholder="Pass / fail / comments" required></textarea>

    <button type="submit" class="btn btn-primary" style="margin-top:0.6rem;">Save Evaluation</button>
  </form>

  <div id="evalEmpty" class="no-logs">No evaluations logged yet.</div>
  <table id="evalTable" style="display:none;">
    <thead>
      <tr>
        <th>Date</th>
        <th>Division</th>
        <th>Type</th>
        <th>Notes</th>
      </tr>
    </thead>
    <tbody id="evalBody"></tbody>
  </table>

  <button class="btn btn-return" onclick="openPage('home')">Return Home Page</button>
</div>

<script>
  function openPage(id) {
    document.querySelectorAll('.page').forEach(p => p.classList.remove('active'));
    document.getElementById(id).classList.add('active');
    window.scrollTo(0, 0);
  }

  // HOURS
  function loadHours() {
    const data = localStorage.getItem('hoursLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    const body = document.getElementById('hoursBody');
    const table = document.getElementById('hoursTable');
    const empty = document.getElementById('hoursEmpty');
    const totalsDiv = document.getElementById('hoursTotals');

    body.innerHTML = '';
    if (!logs.length) {
      table.style.display = 'none';
      empty.style.display = 'block';
      totalsDiv.textContent = '';
      return;
    }

    let totals = { General: 0, DHS: 0, RDF: 0, AVO: 0 };
    logs.forEach(log => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${log.date}</td>
        <td>${log.division}</td>
        <td>${log.hours}</td>
        <td>${log.notes || ''}</td>
      `;
      body.appendChild(tr);
      if (totals[log.division] !== undefined) {
        totals[log.division] += Number(log.hours) || 0;
      }
    });

    const parts = [];
    Object.keys(totals).forEach(k => {
      if (totals[k] > 0) parts.push(`${k}: ${totals[k].toFixed(2)} hrs`);
    });
    totalsDiv.textContent = parts.length ? 'Totals — ' + parts.join(' | ') : '';

    table.style.display = 'table';
    empty.style.display = 'none';
  }

  function saveHours(e) {
    e.preventDefault();
    const date = document.getElementById('hoursDate').value;
    const division = document.getElementById('hoursDivision').value;
    const hours = document.getElementById('hoursAmount').value;
    const notes = document.getElementById('hoursNotes').value.trim();

    if (!date || !division || !hours) return;

    const data = localStorage.getItem('hoursLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    logs.push({ date, division, hours, notes });
    localStorage.setItem('hoursLogs', JSON.stringify(logs));

    document.getElementById('hoursForm').reset();
    loadHours();
  }

  // TRAININGS
  function loadTraining() {
    const data = localStorage.getItem('trainingLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    const body = document.getElementById('trainingBody');
    const table = document.getElementById('trainingTable');
    const empty = document.getElementById('trainingEmpty');

    body.innerHTML = '';
    if (!logs.length) {
      table.style.display = 'none';
      empty.style.display = 'block';
      return;
    }

    logs.forEach(log => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${log.date}</td>
        <td>${log.division}</td>
        <td>${log.topic}</td>
        <td>${log.notes || ''}</td>
      `;
      body.appendChild(tr);
    });

    table.style.display = 'table';
    empty.style.display = 'none';
  }

  function saveTraining(e) {
    e.preventDefault();
    const date = document.getElementById('trainingDate').value;
    const division = document.getElementById('trainingDivision').value;
    const topic = document.getElementById('trainingTopic').value.trim();
    const notes = document.getElementById('trainingNotes').value.trim();

    if (!date || !division || !topic) return;

    const data = localStorage.getItem('trainingLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    logs.push({ date, division, topic, notes });
    localStorage.setItem('trainingLogs', JSON.stringify(logs));

    document.getElementById('trainingForm').reset();
    loadTraining();
  }

  // RIDE ALONGS
  function loadRideAlong() {
    const data = localStorage.getItem('rideAlongLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    const body = document.getElementById('rideAlongBody');
    const table = document.getElementById('rideAlongTable');
    const empty = document.getElementById('rideAlongEmpty');

    body.innerHTML = '';
    if (!logs.length) {
      table.style.display = 'none';
      empty.style.display = 'block';
      return;
    }

    logs.forEach(log => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${log.date}</td>
        <td>${log.officer}</td>
        <td>${log.notes}</td>
      `;
      body.appendChild(tr);
    });

    table.style.display = 'table';
    empty.style.display = 'none';
  }

  function saveRideAlong(e) {
    e.preventDefault();
    const date = document.getElementById('raDate').value;
    const officer = document.getElementById('raOfficer').value.trim();
    const notes = document.getElementById('raNotes').value.trim();

    if (!date || !officer || !notes) return;

    const data = localStorage.getItem('rideAlongLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    logs.push({ date, officer, notes });
    localStorage.setItem('rideAlongLogs', JSON.stringify(logs));

    document.getElementById('rideAlongForm').reset();
    loadRideAlong();
  }

  // EVALS
  function loadEval() {
    const data = localStorage.getItem('evalLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    const body = document.getElementById('evalBody');
    const table = document.getElementById('evalTable');
    const empty = document.getElementById('evalEmpty');

    body.innerHTML = '';
    if (!logs.length) {
      table.style.display = 'none';
      empty.style.display = 'block';
      return;
    }

    logs.forEach(log => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${log.date}</td>
        <td>${log.division}</td>
        <td>${log.type}</td>
        <td>${log.notes}</td>
      `;
      body.appendChild(tr);
    });

    table.style.display = 'table';
    empty.style.display = 'none';
  }

  function saveEval(e) {
    e.preventDefault();
    const date = document.getElementById('evalDate').value;
    const division = document.getElementById('evalDivision').value;
    const type = document.getElementById('evalType').value;
    const notes = document.getElementById('evalNotes').value.trim();

    if (!date || !division || !type || !notes) return;

    const data = localStorage.getItem('evalLogs');
    let logs = [];
    if (data) { try { logs = JSON.parse(data); } catch(e) { logs = []; } }

    logs.push({ date, division, type, notes });
    localStorage.setItem('evalLogs', JSON.stringify(logs));

    document.getElementById('evalForm').reset();
    loadEval();
  }

  // INITIAL LOAD
  loadHours();
  loadTraining();
  loadRideAlong();
  loadEval();
</script>

</body>
</html>

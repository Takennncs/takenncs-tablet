let selectedCharacter = 0;
let offences = [];
const selectedOffences = [];

let zone = ''

function updateData(eventName, items) {
  let event = new CustomEvent(eventName, {
    detail: {
      items: items,
    },
  });
  window.dispatchEvent(event);
}
function toggleMenuDisplay(state) {
  $("#tabletBody").css({ display: state === true ? "block" : "none" });
}

$(document).ready(function () {
  // ESC keypress to close the menu
  $(document).keydown(function (event) {
    var keycode = event.keyCode ? event.keyCode : event.which;
    if (keycode == "27") {
      toggleMenuDisplay(false);
      $.post("https://takenncs-tablet/disableFocus", JSON.stringify({}));
    }
  });
  window.addEventListener("message", function (event) {
    var event = event.data;
    
    if (event.action === "loadResults") {
      updateData('update-vehicles', event.data.vehicles);
      updateData('update-vehiclesimp', event.data.vehiclesimp);
    } else {
      if (event.action === 'showTablet') {
        $('#tabletBody').show()
        zone = event.data
      } else {
        if (event.action === 'showNotification') {
          showNotification(
            event.data.title,
            event.data.text,
            event.data.type
          )
        } else {
          if (event.action === 'loadImpound') {
            updateData('update-impound', event.data)
          } else {
            event.action === 'vehOut' && search()
          }
        }
      }
    }
  })

$(document).on('click', '#despawnvehimp', function () {
  let model = $(this).attr('model');
  const data = { model: model };
  $.post('https://takenncs-tablet/despawnvehimp', JSON.stringify(data));
})

  $(document).on('click', '#despawnveh', function () {
    let model = $(this).attr('model');
    const data = { model: model };
    $.post('https://takenncs-tablet/despawnveh', JSON.stringify(data));
  })
})
function showNotification(title, text, type) {
  Swal.fire({
    icon: type,
    title: title,
    text: text,
  });
}
function search() {
  $('#loading').show()
  if (zone === '-') {
    $.post(
      'https://takenncs-tablet/search',
      JSON.stringify({ context: $('#searchContext').val() })
    )
  }
  setTimeout(() => {
    $('#mainElement').addClass('overflow-y-auto')
    $('#loading').hide()
  }, '300')
}
function searchimp() {
  $('#loading').show();
  if (zone === '-') {
    $.post(
      'https://takenncs-tablet/searchimp',
      JSON.stringify({ context: $('#searchContextImp').val() })
    );
  }
  setTimeout(() => {
    $('#loading').hide();
  }, 300);
}

function startDeal(item) {
  $.post(`https://${GetParentResourceName()}/startDrugSale`, JSON.stringify({
    item: item
  }));
}

function renderLeaderboard(data) {
  const tbody = document.getElementById("leaderboard-body");
  tbody.innerHTML = "";

  if (!data || data.length === 0) {
    const row = document.createElement("tr");
    row.innerHTML = `<td colspan="4" class="empty-message" style="text-align: center; font-style: italic; color: #888;">
      The leaderboard is currently empty.
    </td>`;
    tbody.appendChild(row);
    document.getElementById("user-rank").innerText = "-";
    document.getElementById("user-points").innerText = "-";
    return;
  }

  let userRank = "-";
  let userPoints = "-";

  data.forEach((entry, index) => {
    if (entry.playerName === userName) {
      userRank = index + 1;
      userPoints = entry.points;
    }
    const row = document.createElement("tr");
    row.classList.add("bg-gray-900", "hover:bg-gray-700");
    row.innerHTML = `
      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-300">${index + 1}</td>
      <td class="px-6 py-4 whitespace-nowrap text-sm text-white">${entry.playerName}</td>
      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">${entry.points}</td>
      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-300">${entry.soldItems}</td>
    `;
    tbody.appendChild(row);
  });

  document.getElementById("user-rank").innerText = userRank;
  document.getElementById("user-points").innerText = userPoints;
}

window.addEventListener('message', (event) => {
  if (event.data.action === 'updateLeaderboard') {
    renderLeaderboard(event.data.leaderboard);
  }

  if (event.data.type === 'openTablet') {
    userName = event.data.name;
    document.getElementById('PlayerName').innerText = userName;
    document.getElementById('grade').innerText = event.data.grade;

    fetch(`https://${GetParentResourceName()}/requestLeaderboard`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({})
    });
  }
});

document.addEventListener('DOMContentLoaded', function () {
  fetch(`https://${GetParentResourceName()}/requestLeaderboard`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({})
  });
});

let userName = null;

$(document).on("click", "#startRivalry", function () {
  $.post('https://takenncs-tablet/startTurf', JSON.stringify({}));
});
window.addEventListener('message', (event) => {
  if (event.data.action === 'updateLeaderboard') {
    renderLeaderboard(event.data.leaderboard); // ← määrab rank ja points
  }
});

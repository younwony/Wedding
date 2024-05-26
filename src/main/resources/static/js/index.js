function shareToKakao() {
    // 카카오톡 공유 기능 구현
    alert("카카오톡으로 공유하기 기능을 추가하세요.");
}

function shareToInstagram() {
    // 인스타그램 공유 기능 구현
    alert("인스타그램으로 공유하기 기능을 추가하세요.");
}

document.getElementById('guestbookForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('guestName').value;
    const message = document.getElementById('guestMessage').value;
    const entry = document.createElement('div');
    entry.classList.add('guestbook-entry');
    entry.innerHTML = `<strong>${name}</strong><p>${message}</p>`;
    document.getElementById('guestbookEntries').appendChild(entry);
    this.reset();
});

// 카카오 지도 초기화
function initMap() {
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.5665, 126.9780),
        level: 3
    };
    var map = new kakao.maps.Map(container, options);
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.5665, 126.9780)
    });
    marker.setMap(map);
}

// 카카오 지도 스크립트 로드
function loadKakaoMapScript() {
    var script = document.createElement('script');
    script.src = 'https://dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_APP_KEY&autoload=false';
    script.onload = function () {
        kakao.maps.load(initMap);
    };
    document.head.appendChild(script);
}

window.onload = function() {
    loadKakaoMapScript();
}
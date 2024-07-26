function shareToKakao() {
    // 카카오톡 공유 기능 구현
    alert("카카오톡으로 공유하기 기능을 추가하세요.");
}

function shareToInstagram() {
    // 인스타그램 공유 기능 구현
    alert("인스타그램으로 공유하기 기능을 추가하세요.");
}

// guestMessageList
function showDeleteModal(messageId) {
    const modal = document.getElementById('deleteModal');
    modal.style.display = 'block';
    document.getElementById('deleteMessageId').value = messageId;
}

function hideDeleteModal() {
    const modal = document.getElementById('deleteModal');
    modal.style.display = 'none';
}

document.getElementById('deleteMessageBtn').addEventListener('click', function () {
    const id = document.getElementById('deleteMessageId').value;
    const author = document.getElementById('deleteAuthor').value;
    const password = document.getElementById('deletePassword').value;

    $.ajax({
        type: 'DELETE',
        url: `/api/guest-messages/${id}`,
        contentType: 'application/json',
        data: JSON.stringify({ author: author, password: password }),
        success: function () {
            alert('메시지가 성공적으로 삭제되었습니다.');
            hideDeleteModal();
            getGuestMessageList();
        },
        error: function () {
            alert('메시지 삭제에 실패했습니다. 이름과 비밀번호를 확인하세요.');
        }
    });
});

function getGuestMessageList(page = 0, size = 5) {
    $.ajax({
        type: 'GET',
        url: `/api/guest-messages?page=${page}&size=${size}&sort=createdAt,desc`,
        success: function (data) {
            var guestMessageListDiv = $('#guestMessageList');
            guestMessageListDiv.empty();  // 기존 내용을 지움

            data.content.forEach(function (message) {
                var messageTemplate = `
                    <div class="guestbook-entry" data-id="${message.id}">
                        <strong>${message.author}</strong>
                        <p>${message.content}</p>
                        <small>${new Date(message.createdAt).toLocaleString()}</small>
                        <button class="delete-btn" onclick="showDeleteModal('${message.id}')">삭제</button>
                    </div>
                `;
                guestMessageListDiv.append(messageTemplate);
            });

            // 페이지 버튼 생성
            const paginationDiv = $('#pagination');
            paginationDiv.empty();  // 기존 페이지 버튼 지움

            // 이전 버튼
            if (page > 0) {
                const prevButton = `<button onclick="getGuestMessageList(${page - 1}, ${size})">이전</button>`;
                paginationDiv.append(prevButton);
            }

            // 페이지 번호 버튼
            for (var i = 0; i < data.totalPages; i++) {
                const pageButton = `<button onclick="getGuestMessageList(${i}, ${size})" class="${i === page ? 'active' : ''}">${i + 1}</button>`;
                paginationDiv.append(pageButton);
            }

            // 다음 버튼
            if (page < data.totalPages - 1) {
                const nextButton = `<button onclick="getGuestMessageList(${page + 1}, ${size})">다음</button>`;
                paginationDiv.append(nextButton);
            }
        },
    });
}


document.getElementById('guestMessageAddBtn').addEventListener('click', function () {

    const formData = {
        author: document.getElementById('author').value,
        password: document.getElementById('password').value,
        content: document.getElementById('content').value
    };

    $.ajax({
        type: 'POST',
        url: '/api/guest-messages',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success: function (data) {
            alert('메시지가 성공적으로 전송되었습니다.');
            getGuestMessageList();
        },
    })
});

// 카카오 지도 초기화
function initMap() {
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(37.48276871066162, 127.03494231900086),
        level: 3
    };
    var map = new kakao.maps.Map(container, options);
    var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(37.48276871066162, 127.03494231900086)
    });
    marker.setMap(map);
}

// 카카오 지도 스크립트 로드
function loadKakaoMapScript() {
    var script = document.createElement('script');
    script.src = 'https://dapi.kakao.com/v2/maps/sdk.js?appkey=79116702bafec0462b6167ef14ca127b&autoload=false';
    script.onload = function () {
        kakao.maps.load(initMap);
    };
    document.head.appendChild(script);
}

function setFullHeight() {
    const firstContent = document.getElementById('first-content');
    firstContent.style.height = window.innerHeight + 'px';
}

window.onload = function () {
    loadKakaoMapScript();
    getGuestMessageList();
    setFullHeight();
    const accordionBtns = document.querySelectorAll('.accordion-btn');

    accordionBtns.forEach(btn => {
        btn.addEventListener('click', function () {
            const content = this.nextElementSibling;
            this.classList.toggle('active');
            if (content.style.display === "block") {
                content.style.display = "none";
            } else {
                content.style.display = "block";
            }
        });
    });
}

document.getElementById('copy-address-btn').addEventListener('click', function() {
    const address = document.getElementById('location-details').innerText;
    const textarea = document.createElement('textarea');
    textarea.value = address;
    document.body.appendChild(textarea);
    textarea.select();
    document.execCommand('copy');
    document.body.removeChild(textarea);

    alert('주소가 복사되었습니다: ' + address);
});

document.addEventListener('DOMContentLoaded', function() {
    const text1 = document.getElementById('animated-text-1');
    const str1 = text1.textContent;
    text1.innerHTML = '';

    const text2 = document.getElementById('animated-text-2');
    const str2 = text2.textContent;
    text2.innerHTML = '';

    const delay = 0.1; // 각 글자 애니메이션 지연 시간을 초 단위로 설정 (예: 0.1초)

    // 첫 번째 줄 애니메이션 적용
    for (let i = 0; i < str1.length; i++) {
        const span = document.createElement('span');
        span.className = 'letter';
        span.style.animationDelay = `${i * delay}s`;
        span.textContent = str1[i];
        if (str1[i] === ' ') {
            span.style.width = '0.8rem'; // 공백을 위한 고정 폭 설정
        }
        text1.appendChild(span);
    }

    // 두 번째 줄 애니메이션 적용
    for (let i = 0; i < str2.length; i++) {
        const span = document.createElement('span');
        span.className = 'letter';
        span.style.animationDelay = `${(str1.length + i) * delay}s`;
        span.textContent = str2[i];
        if (str2[i] === ' ') {
            span.style.width = '0.8rem'; // 공백을 위한 고정 폭 설정
        }
        text2.appendChild(span);
    }
});

$(document).ready(function() {
    function checkAnimation() {
        $('.animate-fade-in').each(function() {
            var elementTop = $(this).offset().top;
            var elementBottom = elementTop + $(this).outerHeight();
            var viewportTop = $(window).scrollTop();
            var viewportBottom = viewportTop + $(window).height();

            if (elementBottom > viewportTop && elementTop < viewportBottom) {
                $(this).addClass('show');
            }
        });
    }

    // 스크롤 및 페이지 로드 시 애니메이션 체크
    $(window).on('scroll', checkAnimation);
    $(window).on('load', checkAnimation);

    // 페이지 로드 시 초기 체크
    checkAnimation();
});

document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('contactModal');
    var btn = document.getElementById('congratsButton');
    var span = document.getElementsByClassName('close')[0];

    // 버튼을 클릭하면 모달을 표시
    btn.onclick = function() {
        modal.style.display = 'block';
    }

    // 닫기 버튼을 클릭하면 모달을 닫기
    span.onclick = function() {
        modal.style.display = 'none';
    }

    // 모달 외부를 클릭하면 모달을 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }
});


document.addEventListener('DOMContentLoaded', function() {
    var modal = document.getElementById('mapModal');
    var btn = document.getElementById('mapButton');

    // 버튼을 클릭하면 모달을 표시
    btn.onclick = function() {
        modal.style.display = 'block';
    }

    // 모달 외부를 클릭하면 모달을 닫기
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = 'none';
        }
    }
});

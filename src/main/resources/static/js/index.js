Kakao.init('79116702bafec0462b6167ef14ca127b');

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

function getGuestMessageList(page = 0, size = 3) {
    $.ajax({
        type: 'GET',
        url: `/api/guest-messages?page=${page}&size=${size}&sort=id,desc`,
        success: function (data) {
            var guestMessageListDiv = $('#guestMessageList');
            guestMessageListDiv.empty();  // 기존 내용을 지움

            data.content.forEach(function (message) {
                var messageTemplate = `
                    <div class="guestbook-entry" data-id="${message.id}">
                        <div class="content-header">
                            <img src="https://dwp9wba2tw70x.cloudfront.net/img/ribbon.png" alt="ribbon" class="guestbook-img" />
                            <button class="delete-btn" onclick="showDeleteModal('${message.id}')">&times;</button>
                        </div>
                        <div class="content-area">
                            <p>${message.content}</p>
                        </div>
                        <div class="content-footer">
                            <div class="message-date">
                                <small>${new Date(message.createdAt).toLocaleDateString()}</small>
                            </div>
                            <div class="message-author">From. ${message.author}</div>
                        </div>
                    </div>
                `;
                guestMessageListDiv.append(messageTemplate);
            });

            // 페이지 버튼 생성
            const paginationDiv = $('#pagination');
            paginationDiv.empty();  // 기존 페이지 버튼 지움

            // 이전 버튼
            if (page > 0) {
                const prevButton = `<button class="pagination-btn" onclick="getGuestMessageList(${page - 1}, ${size})">이전</button>`;
                paginationDiv.append(prevButton);
            }

            // 페이지 번호 버튼
            for (var i = 0; i < data.totalPages; i++) {
                const pageButton = `<button class="pagination-btn ${i === page ? 'active' : ''}" onclick="getGuestMessageList(${i}, ${size})">${i + 1}</button>`;
                paginationDiv.append(pageButton);
            }

            // 다음 버튼
            if (page < data.totalPages - 1) {
                const nextButton = `<button class="pagination-btn" onclick="getGuestMessageList(${page + 1}, ${size})">다음</button>`;
                paginationDiv.append(nextButton);
            }

        },
    });
}



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
            const contentInner = content.querySelector('.content-inner');

            this.classList.toggle('active');

            if (content.style.maxHeight) {
                content.style.maxHeight = null;
            } else {
                content.style.maxHeight = contentInner.scrollHeight + "px";
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

    // 버튼을 클릭하면 모달을 표시
    btn.onclick = function() {
        modal.style.display = 'block';
    }

    modal.onclick = function(event) {
        if (event.target === modal) {
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
    modal.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    }
});

function shareKakao() {
    Kakao.Share.sendDefault({
        objectType: 'feed',
        content: {
            title: '🌷원희 ♥ 상은 모바일 청첩장🌷',
            description: '우리 결혼식에 초대할게요!\n2024.09.28  PM 5:00',
            imageUrl: 'https://dwp9wba2tw70x.cloudfront.net/img/main.jpg',
            link: {
                mobileWebUrl: 'https://ddangbbo.com',
                webUrl: 'https://ddangbbo.com'
            }
        },
        buttons: [
            {
                title: '청첩장 보러가기',
                link: {
                    mobileWebUrl: 'https://ddangbbo.com',
                    webUrl: 'https://ddangbbo.com'
                }
            }
        ]
    });
}
function clip(){
    var url = 'http://ddangbbo.com/';
    var textarea = document.createElement("textarea");
    document.body.appendChild(textarea);
    textarea.value = url;
    textarea.select();
    document.execCommand("copy");
    document.body.removeChild(textarea);
    alert("청첩장 링크가 복사되었습니다.")
}

function saveImage() {
    // 오시는길 이미지 저장
    html2canvas(document.getElementById('directions')).then(function(canvas) {
        if (navigator.userAgent.includes("KAKAO")) {
            alert("이미지 저장 기능은 카카오톡 인앱 브라우저에서 지원되지 않습니다. 다른 브라우저에서 페이지를 열어주세요.");
            window.open(window.location.href, '_blank');
        }else{
            var link = document.createElement('a');
            link.href = canvas.toDataURL('image/png');
            link.download = '오시는길.png';
            link.click();
        }
    });
}

$(document).ready(function() {
    // 방명록 등록 버튼 클릭 이벤트
    $('#guestMessageAddBtn').on('click', function() {

        let content = $('#content').val();
        if (content.trim() === '') {
            alert('메시지를 입력해주세요.');
            return;
        }

        const formData = {
            author: $('#author').val(),
            password: $('#password').val(),
            content: $('#content').val()
        };

        $.ajax({
            type: 'POST',
            url: '/api/guest-messages',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function () {
                alert('메시지가 성공적으로 전송되었습니다.');
                getGuestMessageList();
                $('#guestBookCloseBtn').click();
            },
        });
    });

    // 메시지 삭제 버튼 클릭 이벤트
    $('#deleteMessageBtn').on('click', function() {
        const id = $('#deleteMessageId').val();
        const password = $('#deletePassword').val();

        $.ajax({
            type: 'DELETE',
            url: `/api/guest-messages/${id}`,
            contentType: 'application/json',
            data: JSON.stringify({ password: password }),
            success: function () {
                alert('메시지가 성공적으로 삭제되었습니다.');
                hideDeleteModal();
                $('.modal-backdrop').remove();  // 중복 모달 방지
                $('body').removeClass('modal-open');
                getGuestMessageList();
            },
            error: function () {
                alert('메시지 삭제에 실패했습니다. 비밀번호를 확인하세요.');
            }
        });
    });
});

$(document).ready(function() {
    // 모달이 열릴 때 기존 백드롭 제거
    $('#guestMessageModalBtn').on('click', function() {
        $('#content').val(''); // 내용 초기화
        $('.modal-backdrop').remove();
    });

    document.querySelectorAll('.copy-btn').forEach(button => {
        button.addEventListener('click', () => {
            // 계좌번호 추출
            const accountInfo = button.parentElement.querySelector('p').innerHTML;
            const accountNumber = accountInfo.split('<br>')[1].trim().replaceAll('-', '');

            // 계좌번호 클립보드에 복사
            navigator.clipboard.writeText(accountNumber).then(() => {
                alert('계좌번호가 복사되었습니다: ' + accountNumber);
            }).catch(err => {
                console.error('복사 실패:', err);
            });
        });
    });
});
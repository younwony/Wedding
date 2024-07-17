<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>윤원희 ❤️ 한상은 결혼합니다.</title>
    <link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/gallery.css" rel="stylesheet">
    <link href="/css/timer.css" rel="stylesheet">
    <link href="/css/font.css" rel="stylesheet">
    <link href="/css/tab.css" rel="stylesheet">
    <link href="/css/swiper-bundle.min.css" rel="stylesheet">
    <link href="/css/calendar.css" rel="stylesheet">
    <link href="/css/splide.min.css" rel="stylesheet">
    <link href="/css/splide-core.min.css" rel="stylesheet">
    <link href="/css/splide-sea-green.min.css" rel="stylesheet">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css' rel='stylesheet' />
    <link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@400;700&family=Gowun+Batang&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>


</head>
<body>

<div class="main-container">
    <!-- 첫 인사 문구 -->
    <div class="text-center" id="first-content">
        <div class="background-image-container">
            <img src="/img/main.jpg" alt="배경 이미지" class="background-image">
            <canvas id="petalsCanvas"></canvas>
            <div class="text-overlay">
                <div class="date-text">
                    <h1 class="title-name">윤원희 <span class="small-font">그리고</span> 한상은</h1>
                </div>
            </div>
            <div class="text-overlay-bottom">
                <h1 class="title-message">We are getting married!</h1>
            </div>
        </div>
    </div>

    <!-- 초대 메세지 -->
    <div class="invitation text-center">
        <h2 class="invitation-title">INVITATION</h2>
        <p class="invitation-text">
            오래전 작은 인연이 <br>
            저희를 연인으로 만들었고, <br>
            지금 그 인연으로 <br>
            그 사람의 손을 꼭 잡고 결혼합니다. <br>
            늘 그 인연을 생각하며 <br>
            서로 아껴주고 사랑하며 살겠습니다. <br>
            저희 두 사람의 새로운 시작을 <br>
            함께하시어 축복해 주시면 <br>
            감사하겠습니다. <br>
        </p>
        <div class="name-container">
            <div class="names">
                <div class="name-group">
                    <div class="name-father">
                        <div class="name-img"><img class="empty"/></div>
                        윤재성
                    </div>
                    <div class="separator">·</div>
                    <div class="name">장선자</div>
                    <div class="relation">의</div>
                    <div class="role">장남</div>
                    <div class="person">원희</div>
                </div>
                <div class="name-group">
                    <div class="name-father">
                        <div class="name-img"><img src="/img/d.png" alt="국화꽃 아이콘" style="width: 20px; vertical-align: middle;"></div>
                        한재영
                    </div>
                    <div class="separator">·</div>
                    <div class="name">김묘숙</div>
                    <div class="relation">의</div>
                    <div class="role">장녀</div>
                    <div class="person">상은</div>
                </div>
            </div>
        </div>
    </div>

    <!-- 정보 -->
    <div class="mb-5 text-center" id="wedding-info">
        <div class="date-text">
            <h2 class="wedding-title">Wedding Day</h2>
            <h2 class="wedding-date">2024.09.28. 토요일 17:00 PM</h2>
            <h3 class="wedding-location">양재 엘블레스 B1 다이아몬드홀</h3>
        </div>
    </div>
    <div class="calendar-container" id="calendar"></div>
    <div class="timer-contain">
        <div class="timer-overlay"></div>
        <div class="timer">
            <h2>상은 ❤️ 원희</h2>
            <h2>결혼식까지</h2>
            <h1 id="countdown" class="countdown">D-0 00:00:00</h1>
        </div>
    </div>


    <!-- 웨딩 사진 갤러리 -->
    <div class="container" id="gallery-container">
        <h2 class="gallery-title">Gallery</h2>

        <div id="main-slider" class="splide" style="padding: 0 !important;">
            <div class="splide__track">
                <ul class="splide__list">
                    <li class="splide__slide"><img src="/img/wedding/1.jpg" alt="Image 1"></li>
                    <li class="splide__slide"><img src="/img/wedding/2.jpg" alt="Image 2"></li>
                    <li class="splide__slide"><img src="/img/wedding/3.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/4.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/5.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/6.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/7.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/8.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/9.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/10.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/11.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/12.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/13.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/14.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="/img/wedding/15.jpg" alt="Image 3"></li>
                </ul>
            </div>
        </div>

        <!-- Thumbnail Slider -->
        <div id="thumbnail-slider" class="splide">
            <div class="splide__track">
                <ul class="splide__list">
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/1.jpg" alt="Thumbnail 1"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/2.jpg" alt="Thumbnail 2"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/3.jpg" alt="Thumbnail 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/4.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/5.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/6.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/7.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/8.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/9.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/10.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/11.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/12.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/13.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/14.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="/img/wedding/15.jpg" alt="Image 3"></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 지도 -->
    <div id="location" class="mb-5">
        <h2 id="location-title">오시는 길</h2>
        <p id="location-description">양재 엘블레스</p>
        <p id="location-details">1층 레터홀<br>제주특별자치도 서귀포시 중앙로 105</p>
        <div id="map" style="width: 100%; height: 300px;"></div>
        <div>
            <img src="/img/location/location.jpg" alt="오시는 길 1" class="location-image">
        </div>
    </div>


    <div class="tabs">
        <button class="tab-link active" data-tab="tab1">오시는 길 안내</button>
        <button class="tab-link" data-tab="tab2">주차 안내</button>
        <button class="tab-link" data-tab="tab3">식사 안내</button>
    </div>

    <div id="tab1" class="tab-content active">
        <h2>오시는 길 안내</h2>
        <p>웨딩홀의 주소와 오시는 길에 대한 안내 내용이 여기에 들어갑니다.</p>
        <img src="/img/location/location.jpg" alt="오시는 길 안내">
    </div>

    <div id="tab2" class="tab-content">
        <h2>주차 안내</h2>
        <p>웨딩홀 주차장 및 주차 가능 구역에 대한 안내 내용이 여기에 들어갑니다.</p>
        <img src="/img/location/location.jpg" alt="주차 안내">
    </div>

    <div id="tab3" class="tab-content">
        <h2>식사 안내</h2>
        <p>웨딩홀에서 제공되는 식사 메뉴와 시간에 대한 안내 내용이 여기에 들어갑니다.</p>
        <img src="/img/location/location.jpg" alt="식사 안내">
    </div>

    <!-- 마음 전하실 곳 -->
    <div class="message-container">
        <h2>마음 전하실 곳</h2>
        <p>필요하신 분들을 위해<br>안내드리니 양해 부탁드립니다.<br>참석하지 못하시더라도 축복해주시는 그 마음 감사히 간직하겠습니다.</p>
    </div>

    <div class="accordion">
        <div class="card">
            <button class="accordion-btn" type="button">
                신랑측 <span class="icon">&#9660;</span>
            </button>
            <div class="content">
                <p>계좌번호: 123-456-789<br>은행: 행복은행</p>
            </div>
        </div>
        <div class="card">
            <button class="accordion-btn" type="button">
                신부측 <span class="icon">&#9660;</span>
            </button>
            <div class="content">
                <p>계좌번호: 987-654-321<br>은행: 행복은행</p>
            </div>
        </div>
    </div>

    <!-- 공유하기 -->
    <div class="mb-5 text-center">
        <h2>공유하기</h2>
        <button class="btn btn-primary" onclick="shareToKakao()">카카오톡 공유</button>
        <button class="btn btn-secondary" onclick="shareToInstagram()">인스타그램 공유</button>
    </div>

    <!-- 축하 메시지 -->
    <div class="mb-5">
        <h2>축하 메시지</h2>
        <form id="guestMessageForm">
            <div class="mb-3">
                <label for="author" class="form-label">이름</label>
                <input type="text" name="author" class="form-control" id="author" required>
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="password" required>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">메시지</label>
                <textarea class="form-control" id="content" rows="3" required></textarea>
            </div>
            <button type="button" id="guestMessageAddBtn" class="btn btn-success">등록</button>
        </form>
        <div id="guestMessageList" class="mt-3">
            <!-- 축하 메시지 리스트 -->
        </div>
        <div id="pagination" class="mt-3">
            <!-- 페이지 버튼 -->
        </div>
    </div>

    <!-- 삭제 확인 모달 -->
    <div id="deleteModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="hideDeleteModal()">&times;</span>
            <h2>메시지 삭제</h2>
            <input type="hidden" id="deleteMessageId">
            <div class="mb-3">
                <label for="deleteAuthor" class="form-label">이름</label>
                <input type="text" name="deleteAuthor" class="form-control" id="deleteAuthor" required>
            </div>
            <div class="mb-3">
                <label for="deletePassword" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="deletePassword" required>
            </div>
            <button type="button" id="deleteMessageBtn" class="btn btn-danger">삭제</button>
        </div>
    </div>

</div>

<script src="/js/swiper-bundle.min.js"></script>
<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/js/splide.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/gallery.js"></script>
<script src="/js/timer.js"></script>
<script src="/js/tab.js"></script>
<script src="/js/sakura.js"></script>
<script src="/js/calendar.js"></script>
</body>
</html>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%pageContext.setAttribute("timeStamp", new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())) ;%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>윤원희 ❤️ 한상은 결혼합니다.</title>
    <link href="/css/bootstrap/bootstrap.min.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/index.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/gallery.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/timer.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/font.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/tab.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/swiper-bundle.min.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/calendar.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/splide.min.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/splide-core.min.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/splide-default.min.css?val=${timeStamp}" rel="stylesheet">
    <link href="/css/invitation.css?val=${timeStamp}" rel="stylesheet">
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
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/main.jpg" alt="배경 이미지" class="background-image">
            <canvas id="petalsCanvas"></canvas>
            <div class="text-overlay">
                <div class="date-text">
                    <h1 class="title-name">윤원희 <span class="small-font">그리고</span> 한상은</h1>
                </div>
            </div>
            <div class="text-overlay-bottom">
                <h1 class="title-message">
                    <span id="animated-text-1">We are getting</span><br>
                    <span id="animated-text-2">married!</span>
                </h1>
            </div>
        </div>
    </div>

    <!-- 초대 메세지 -->
    <div class="invitation text-center animate-fade-in" >
        <div class="invitation-header">
            <h1>2024년 9월 28일 토요일 오후 5시<br>양재 엘블레스 B1, 다이아몬드홀</h1>
        </div>
        <div class="invitation-img">
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/letter.jpg" alt="Invitation Envelope">
            <div class="invitation-text">
                <div class="korean">소중한 분들을 초대합니다.</div>
            </div>
        </div>
        <div class="invitation-img-1">
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/invi1.jpg" alt="invitaion-1">
        </div>
        <p class="invitation-text">
            사랑이란 별다른 것이 아니라 <br>
            그 사람과 함께 늙어가고 싶은 것이다. <br>
            평생을 함께 하고 싶은 사람을 만났습니다. <br>
            저희 두 사람이 함께 하는 새로운 시작에 <br>
            귀한 발걸음으로 축복해 주시면 감사하겠습니다. <br>
        </p>
        <div class="invitation-text-from">신랑 원희 · 신부 상은 올림</div>
        <div class="invitation-img-2">
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/invi2.jpg" alt="invitaion-2">
        </div>
    </div>

    <!-- 정보 -->
    <div class="names animate-fade-in">
        <div class="name-container">
            <div class="name-group">
                <div class="name-img"><img class="empty"/></div>
                <div class="name-text">
                    윤재성 ·장선자의 장남
                </div>
                <div class="name-target">
                    윤원희
                </div>
            </div>

            <div class="name-group">
                <div class="name-img"><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/d.png" alt="국화꽃 아이콘" style="width: 20px; vertical-align: middle;"></div>
                <div class="name-text">
                    한재영 ·김묘숙의 장녀
                </div>
                <div class="name-target">
                    한상은
                </div>
            </div>
            <button class="congrats-button" id="congratsButton">축하 연락하기</button>
        </div>
    </div>

    <!-- 웨딩 사진 갤러리 -->
    <div class="container animate-fade-in" id="gallery-container">
        <h2 class="gallery-title">Gallery</h2>

        <div id="main-slider" class="splide" style="padding: 0 !important;">
            <div class="splide__track">
                <ul class="splide__list">
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/1.jpg" alt="Image 1"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/2.jpg" alt="Image 2"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/3.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/4.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/5.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/6.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/7.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/8.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/9.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/10.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/11.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/12.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/13.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/14.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/15.jpg" alt="Image 3"></li>
                </ul>
            </div>
        </div>

        <!-- Thumbnail Slider -->
        <div id="thumbnail-slider" class="splide">
            <div class="splide__track">
                <ul class="splide__list">
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/1.jpg" alt="Thumbnail 1"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/2.jpg" alt="Thumbnail 2"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/3.jpg" alt="Thumbnail 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/4.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/5.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/6.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/7.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/8.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/9.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/10.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/11.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/12.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/13.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/14.jpg" alt="Image 3"></li>
                    <li class="splide__slide"><img class="slide-img" src="https://dwp9wba2tw70x.cloudfront.net/img/wedding/15.jpg" alt="Image 3"></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 메이킹 필름 영상 영역 -->
    <div class="container animate-fade-in" id="making-film-container">
        <div class="video-container">
            <video controls playsinline controlsList="nodownload" poster="https://dwp9wba2tw70x.cloudfront.net/img/thumb.jpg">
                <source src="https://dwp9wba2tw70x.cloudfront.net/video/making.mp4" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
    </div>

    <div class="mb-5 text-center animate-fade-in" id="wedding-info">
        <div class="date-text">
            <h2 class="wedding-title">WEDDING DAY</h2>
            <h2 class="wedding-date">2024.09.28</h2>
            <h2 class="wedding-time">토요일 오후 5시</h2>
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/calendar.png" alt="달력 이미지" class="calendar-image">
        </div>
    </div>


    <div class="timer-contain animate-fade-in">
        <div class="timer-overlay"></div>
        <div class="timer">
            <div class="countdown-container">
                <div class="countdown-labels">
                    <span class="countdown-label">DAY</span>
                    <span class="countdown-label">HOUR</span>
                    <span class="countdown-label">MIN</span>
                    <span class="countdown-label">SEC</span>
                </div>
                <div class="countdown-values">
                    <span id="days" class="countdown-value">61</span>
                    <span class="countdown-separator">:</span>
                    <span id="hours" class="countdown-value">00</span>
                    <span class="countdown-separator">:</span>
                    <span id="minutes" class="countdown-value">00</span>
                    <span class="countdown-separator">:</span>
                    <span id="seconds" class="countdown-value">00</span>
                </div>
            </div>
            <h2>상은 ❤️ 원희 결혼식이 <span id="remaining-days">52</span>일 남았습니다</h2>
        </div>
    </div>

    <!-- 지도 -->
    <div id="location" class="mb-5 animate-fade-in">
        <h2 id="location-title-text">LOCATION</h2>
        <h2 id="location-title">오시는 길</h2>
        <p id="location-description">엘블레스 B1, 다이아몬드홀</p>
        <div id="address-container">
            <p id="location-details">서울 서초구 강남대로 213</p>
            <svg id="copy-address-btn" style="display: block; vertical-align: middle" width="16" height="16" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M16.4445 7.89062H9.44906C8.59052 7.89062 7.89453 8.58661 7.89453 9.44516V16.4406C7.89453 17.2991 8.59052 17.9951 9.44906 17.9951H16.4445C17.303 17.9951 17.999 17.2991 17.999 16.4406V9.44516C17.999 8.58661 17.303 7.89062 16.4445 7.89062Z" stroke="#444444" stroke-linecap="round" stroke-linejoin="round"></path><path d="M4.3318 12.1045H3.55453C3.14225 12.1045 2.74684 11.9407 2.45531 11.6492C2.16378 11.3576 2 10.9622 2 10.5499V3.55453C2 3.14225 2.16378 2.74684 2.45531 2.45531C2.74684 2.16378 3.14225 2 3.55453 2H10.5499C10.9622 2 11.3576 2.16378 11.6492 2.45531C11.9407 2.74684 12.1045 3.14225 12.1045 3.55453V4.3318" stroke="#444444" stroke-linecap="round" stroke-linejoin="round"></path></svg>
        </div>
        <div id="map"></div>
        <div style="text-align: center; margin: 30px 0;">
            <button class="map-button" id="mapButton"><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/map.png" style="width: 20px; vertical-align: middle; margin-bottom: 5px;"> 약도 이미지 보기</button>
        </div>

        <!-- 네비게이션 -->
        <div class="navi">
            <div class="navigation">
                <p>원하시는 앱을 선택하시면 길안내가 시작됩니다.</p>
                <div class="navigation-apps">
                    <button onclick="navi('naver')"><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/naver.png" alt="네이버지도"> 네이버지도</button>
                    <button onclick="navi('tmap')"><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/t.png" alt="티맵"> 티맵</button>
                    <button onclick="navi('kakao')"><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/kakao.png" alt="카카오내비"> 카카오내비</button>
                </div>
            </div>

            <div class="directions">
                <h3><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/car.png" alt="car"/>자가용</h3>
                <p>네비게이션: “양재 엘블레스” 검색<br>
                    엘블레스 옆 ‘양재역 주차장’ 이용, 주차 2시간 무료<br>
                    *주차장 주소 : 서초구 강남대로 221 (양재동 23)<br>
                    *주차하신 후 옆 건물 스포타임 지하 1층으로 이동하시면 됩니다.</p>
                <hr class="line-general">

                <h3><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/subway.png" alt="subway"/>지하철</h3>
                <p><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/3.png" alt="3"/>호선 양재역 • 신분당선 양재역<br>
                    9번출구에서 바로 연결됩니다.</p>
                <hr class="line-general">

                <h3><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/ktx.png" alt="ktx"/>KTX</h3>
                <p>서울역 (양재역까지 약 40분 소요)<br>
                    <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/4.png" alt="4"/>호선 서울역에서 회현역 방면으로 탑승,<br>
                    <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/3.png" alt="3"/>호선 충무로역에서 환승하여 양재역에서 하차</p>
                <p>용산역 (양재역까지 약 40분 소요)<br>
                    <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/gm.png" alt="gm"/>경의중앙선 용산역에서 이촌역 방면으로 탑승,<br>
                    (덕소행 15:51, 용문행 16:01, 팔당행 16:23)<br>
                    <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/3.png" alt="3"/>호선 옥수역에서 환승하여 양재역에서 하차</p>
                <hr class="line-general">

                <h3><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/srt.png" alt="srt"/>SRT</h3>
                <p>수서역 (양재역까지 약 15분 소요)<br>
                    <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/3.png" alt="3"/>호선 수서역에서 탑승하여 양재역에서 하차</p>
                <hr class="line-general">
                <h3><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/bus.png" alt="bus"/>고속버스</h3>
                <p><img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/3.png" alt="3"/>호선 고속터미널역에서 탑승하여 양재역에서 하차<br>
                    (양재역까지 약 10분 소요)</p>
            </div>
        </div>
    </div>


    <div class="tab-info-container animate-fade-in">
        <h2 class="tab-info-container-title">INFORMATION</h2>
        <h2 class="tab-info-container-title">예식 정보 및 안내사항</h2>
        <div class="tabs">
            <button class="tab-link active" data-tab="tab1">홀 안내</button>
            <button class="tab-link" data-tab="tab2">식사 안내</button>
            <button class="tab-link" data-tab="tab3">주차 안내</button>
        </div>

        <div id="tab1" class="tab-content active">
            <p>
                양재 엘블레스 단독홀에서<br>
                저희 두 사람의 웨딩이 진행됩니다.<br>
                <br>즐거운 마음으로 <br>
                함께 해주시면 감사드리겠습니다.
            </p>
        </div>

        <div id="tab2" class="tab-content">
            <p>
                식사는 결혼식 및 촬영이 끝난 후 <br>
                웨딩홀 같은 층에서 뷔페식으로 진행됩니다.<br>
                <br>부족함 없이 즐기실 수 있도록<br>
                한식을 비롯해 중식, 양식, 일식 등<br>
                다양한 메뉴가 준비되어 있습니다.<br>

                <br>예식 종료 후 한 분 한 분 <br>
                소중한 마음으로 인사드리겠습니다.<br>

                <br>*예식 시작 30분 전부터 식사 가능합니다.
            </p>
        </div>

        <div id="tab3" class="tab-content">
            <p>
                엘블레스 바로 옆 900대 주차가 가능한 <br>
                ‘양재역 주차장’ 이용 시<br>
                2시간 무료주차가 가능합니다. <br>

                <br>주차하신 후 옆 건물 스포타임 지하1층으로<br>
                이동하시면 됩니다.<br>
                <br>*로비의 주차권 데스크에서 무료 주차권을 직접 수령해가시면 됩니다.
            </p>
            <button class="map-button" id="parkingButton">주차장 위치 보기</button>
        </div>
    </div>

    <!-- 마음 전하실 곳 -->
    <div class="message-container">
        <h2 class="message-container-account">Account</h2>
        <h2 class="message-container-account">마음 전하실 곳</h2>
        <p>참석이 어려워 직접 축하를<br>
            전하지 못하는 분들을 위해 안내드리니<br>
            넓은 마음으로 양해 부탁드립니다.<br>
        전해주시는 진심은 소중하게 간직하여<br>
        좋은 부부의 모습으로 보답하겠습니다.<br>
    </div>

    <div class="accordion animate-fade-in">
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

    <!-- 축하 연락하기 모달 -->
    <div id="contactModal" class="modal-congratulation">
        <div class="modal-content">
            <div class="contact-grid">
                <div>
                    <h3 class="modal-congratulation-role">신랑</h3>
                    <p class="modal-congratulation-name">윤원희</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
                <div>
                    <h3 class="modal-congratulation-role">신부</h3>
                    <p class="modal-congratulation-name">한상은</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
                <div>
                    <h3 class="modal-congratulation-role">신랑 아버지</h3>
                    <p class="modal-congratulation-name">윤재성</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
                <div>
                    <h3 class="modal-congratulation-role">신부 아버지</h3>
                    <p class="modal-congratulation-name">한재영</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
                <div>
                    <h3 class="modal-congratulation-role">신랑 어머니</h3>
                    <p class="modal-congratulation-name">장선자</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
                <div>
                    <h3 class="modal-congratulation-role">신부 어머니</h3>
                    <p class="modal-congratulation-name">김묘숙</p>
                    <div class="icons">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/call.jpg" alt="Phone" class="icon">
                        <img src="https://dwp9wba2tw70x.cloudfront.net/img/icon/mail.jpg" alt="Email" class="icon">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 약도 이미지 모달 -->
    <div id="mapModal" class="modal" style="display: none;">
        <div class="modal-content">
            <img src="https://dwp9wba2tw70x.cloudfront.net/img/location/location.jpg" alt="오시는 길 1" style="width: 100%;">
        </div>
    </div>
</div>

<script src="/js/swiper-bundle.min.js?val=${timeStamp}"></script>
<script src="/js/bootstrap/bootstrap.bundle.min.js?val=${timeStamp}"></script>
<script src="/js/splide.min.js?val=${timeStamp}"></script>
<script src="/js/index.js?val=${timeStamp}"></script>
<script src="/js/gallery.js?val=${timeStamp}"></script>
<script src="/js/timer.js?val=${timeStamp}"></script>
<script src="/js/tab.js?val=${timeStamp}"></script>
<script src="/js/sakura.js?val=${timeStamp}"></script>
<script src="/js/navi.js?val=${timeStamp}"></script>
<script src="/js/calendar.js?val=${timeStamp}"></script>
</body>
</html>

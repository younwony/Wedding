<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>한상은 ❤️ 윤원희 결혼합니다.</title>
    <link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/gallery.css" rel="stylesheet">
    <link href="/css/timer.css" rel="stylesheet">
    <link href="/css/font.css" rel="stylesheet">
    <link href="/css/swiper-bundle.min.css" rel="stylesheet">
    <link href="/css/calendar.css" rel="stylesheet">
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
                <h1 class="dancing-script" style="font-size: 1.3rem">We're Getting Married</h1>
                <div class="date-text">
                    <h1 class="nanum-myeongjo" style="font-size: 1.8rem">윤원희 & 한상은</h1>
                </div>
                <div class="date-text">
                    <h2 class="nanum-gothic" style="font-size: 1.3rem;">2024.09.28. 토요일 17:00 PM</h2>
                    <h3 class="nanum-myeongjo" style="font-size: 1.0rem;">양재 엘블레스 B1 다이아몬드홀</h3>
                </div>
            </div>
        </div>
    </div>

    <!-- 초대 메세지 -->
    <div class="invitation text-center">
        <h2 class="invitation-title">INVITATION</h2>
        <p class="invitation-text noto-serif-kr">
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
                        <div class="name-img"><img src="/img/d.jpg" alt="국화꽃 아이콘" style="width: 20px; vertical-align: middle;"></div>
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
            <h2>D-DAY COUNT</h2>
            <h2>상은 & 원희의 결혼식까지</h2>
            <h1 id="countdown" class="countdown">D-0 00:00:00</h1>
        </div>
    </div>


    <!-- 웨딩 사진 갤러리 -->
    <div class="container">
        <h2 class="gallery-title">Gallery</h2>
        <div class="gallery">
            <img src="/img/wedding/1.jpg" alt="웨딩 사진 1" data-index="0">
            <img src="/img/wedding/2.jpg" alt="웨딩 사진 2" data-index="1">
            <img src="/img/wedding/3.jpg" alt="웨딩 사진 3" data-index="2">
            <img src="/img/wedding/4.jpg" alt="웨딩 사진 4" data-index="3">
            <img src="/img/wedding/5.jpg" alt="웨딩 사진 5" data-index="4">
            <img src="/img/wedding/6.jpg" alt="웨딩 사진 6" data-index="5" class="hidden">
            <img src="/img/wedding/7.jpg" alt="웨딩 사진 7" data-index="6" class="hidden">
            <img src="/img/wedding/8.jpg" alt="웨딩 사진 8" data-index="7" class="hidden">
            <img src="/img/wedding/9.jpg" alt="웨딩 사진 9" data-index="8" class="hidden">
            <img src="/img/wedding/10.jpg" alt="웨딩 사진 10" data-index="9" class="hidden">
            <img src="/img/wedding/11.jpg" alt="웨딩 사진 11" data-index="10" class="hidden">
            <img src="/img/wedding/12.jpg" alt="웨딩 사진 12" data-index="11" class="hidden">
            <img src="/img/wedding/13.jpg" alt="웨딩 사진 13" data-index="12" class="hidden">
            <img src="/img/wedding/14.jpg" alt="웨딩 사진 14" data-index="13" class="hidden">
            <img src="/img/wedding/15.jpg" alt="웨딩 사진 15" data-index="14" class="hidden">
            <img src="/img/wedding/16.jpg" alt="웨딩 사진 16" data-index="15" class="hidden">
            <img src="/img/wedding/17.jpg" alt="웨딩 사진 17" data-index="16" class="hidden">
            <img src="/img/wedding/18.jpg" alt="웨딩 사진 18" data-index="17" class="hidden">
            <img src="/img/wedding/19.jpg" alt="웨딩 사진 19" data-index="18" class="hidden">
            <img src="/img/wedding/20.jpg" alt="웨딩 사진 20" data-index="19" class="hidden">
        </div>
        <div class="gallery-more">
            <a href="#" id="loadMore">사진 더보기 +</a>
        </div>
    </div>

    <!-- Swiper Modal -->
    <div id="myModal" class="modal">
        <span class="close">&times;</span>
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="/img/wedding/1.jpg" alt="웨딩 사진 1"></div>
                <div class="swiper-slide"><img src="/img/wedding/2.jpg" alt="웨딩 사진 2"></div>
                <div class="swiper-slide"><img src="/img/wedding/3.jpg" alt="웨딩 사진 3"></div>
                <div class="swiper-slide"><img src="/img/wedding/4.jpg" alt="웨딩 사진 4"></div>
                <div class="swiper-slide"><img src="/img/wedding/5.jpg" alt="웨딩 사진 5"></div>
                <div class="swiper-slide"><img src="/img/wedding/6.jpg" alt="웨딩 사진 6"></div>
                <div class="swiper-slide"><img src="/img/wedding/7.jpg" alt="웨딩 사진 7"></div>
                <div class="swiper-slide"><img src="/img/wedding/8.jpg" alt="웨딩 사진 8"></div>
                <div class="swiper-slide"><img src="/img/wedding/9.jpg" alt="웨딩 사진 9"></div>
                <div class="swiper-slide"><img src="/img/wedding/10.jpg" alt="웨딩 사진 10"></div>
                <div class="swiper-slide"><img src="/img/wedding/11.jpg" alt="웨딩 사진 11"></div>
                <div class="swiper-slide"><img src="/img/wedding/12.jpg" alt="웨딩 사진 12"></div>
                <div class="swiper-slide"><img src="/img/wedding/13.jpg" alt="웨딩 사진 13"></div>
                <div class="swiper-slide"><img src="/img/wedding/14.jpg" alt="웨딩 사진 14"></div>
                <div class="swiper-slide"><img src="/img/wedding/15.jpg" alt="웨딩 사진 15"></div>
                <div class="swiper-slide"><img src="/img/wedding/16.jpg" alt="웨딩 사진 16"></div>
                <div class="swiper-slide"><img src="/img/wedding/17.jpg" alt="웨딩 사진 17"></div>
                <div class="swiper-slide"><img src="/img/wedding/18.jpg" alt="웨딩 사진 18"></div>
                <div class="swiper-slide"><img src="/img/wedding/19.jpg" alt="웨딩 사진 19"></div>
                <div class="swiper-slide"><img src="/img/wedding/20.jpg" alt="웨딩 사진 20"></div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>

    <!-- 영상 (Optional) -->
    <div class="text-center my-5">
        <h2>우리의 이야기</h2>
        <video controls>
<%--            <source src="/video/movie.mp4" type="video/mp4">--%>
<%--            브라우저가 비디오 태그를 지원하지 않습니다.--%>
        </video>
    </div>

    <!-- 마지막 인사 문구 -->
    <div class="text-center my-5">
        <p>결혼식장에서 만나요!</p>
    </div>

    <!-- 지도 -->
    <div class="mb-5">
        <h2>웨딩홀 위치</h2>
        <div id="map" style="width: 100%; height: 300px;"></div>
    </div>

    <!--지도 오는 길-->
    <div id="weddingCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/img/map/1.jpg" class="d-block w-100" alt="지도 1">
            </div>
            <div class="carousel-item">
                <img src="/img/map/2.jpg" class="d-block w-100" alt="지도 2">
            </div>
            <div class="carousel-item">
                <img src="/img/map/3.jpg" class="d-block w-100" alt="지도 3">
            </div>
            <div class="carousel-item">
                <img src="/img/map/4.jpg" class="d-block w-100" alt="지도 4">
            </div>
            <div class="carousel-item">
                <img src="/img/map/5.jpg" class="d-block w-100" alt="지도 5">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#weddingCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#weddingCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- 연락 -->
    <div class="mb-5">
        <h2>연락처</h2>
        <p>카톡: <a href="https://open.kakao.com/o/some_link">DDang & BBo</a></p>
        <p>전화: <a href="tel:010-1234-5678">010-1234-5678</a></p>
    </div>

    <!-- 축의금 계좌 -->
    <div class="mb-5">
        <h2>축의금 계좌</h2>
        <p>계좌번호: 123-456-789</p>
        <p>은행: 행복은행</p>
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
</div>

<script src="/js/swiper-bundle.min.js"></script>
<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
<script src="/js/gallery.js"></script>
<script src="/js/timer.js"></script>
<script src="/js/sakura.js"></script>
<script src="/js/calendar.js"></script>
</body>
</html>

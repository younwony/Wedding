<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DDang & BBo</title>
    <link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="container">
    <!-- 첫 인사 문구 -->
    <div class="text-center my-5">
        <h1>Welcome to DDang & BBo's Wedding!</h1>
    </div>

    <!-- 웨딩 사진 슬라이드 -->
    <div id="weddingCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/img/wedding1.jpg" class="d-block w-100" alt="웨딩 사진 1">
            </div>
            <div class="carousel-item">
                <img src="/img/wedding2.jpg" class="d-block w-100" alt="웨딩 사진 2">
            </div>
            <div class="carousel-item">
                <img src="/img/wedding3.jpg" class="d-block w-100" alt="웨딩 사진 3">
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

    <!-- 웨딩 사진 갤러리 -->
    <div class="gallery">
        <h2 class="gallery-title">Gallery</h2>
        <div class="row">
            <div class="col-4">
                <img src="/img/wedding1.jpg" alt="웨딩 사진 1">
            </div>
            <div class="col-4">
                <img src="/img/wedding2.jpg" alt="웨딩 사진 2">
            </div>
            <div class="col-4">
                <img src="/img/wedding3.jpg" alt="웨딩 사진 3">
            </div>
        </div>
        <div class="gallery-more">
            <a href="#">사진 더보기 +</a>
        </div>
    </div>

    <!-- 정보 -->
    <div class="mb-5">
        <h2>결혼식 정보</h2>
        <p>날짜: 2024년 9월 28일</p>
        <p>부부 이름: 한상은 & 윤원희</p>
        <p>웨딩홀: 양재 엘블레스</p>
        <div id="calendar"></div>
    </div>

    <!-- 인사 문구 -->
    <div class="text-center my-5">
        <p>저희 결혼식에 초대합니다. 많은 축하 부탁드립니다!</p>
    </div>

    <!-- 영상 (Optional) -->
    <div class="text-center my-5">
        <h2>우리의 이야기</h2>
        <video controls>
            <source src="video/our_story.mp4" type="video/mp4">
            브라우저가 비디오 태그를 지원하지 않습니다.
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

<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/js/index.js"></script>
</body>
</html>

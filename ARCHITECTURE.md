# Wedding Invitation - Architecture Documentation

> 모바일 청첩장 서비스 - 결혼을 축하하는 디지털 초대장

## 목차
1. [프로젝트 개요](#프로젝트-개요)
2. [기술 스택](#기술-스택)
3. [시스템 아키텍처](#시스템-아키텍처)
4. [디렉토리 구조](#디렉토리-구조)
5. [데이터 모델](#데이터-모델)
6. [API 명세](#api-명세)
7. [주요 기능](#주요-기능)
8. [배포 파이프라인](#배포-파이프라인)

---

## 프로젝트 개요

모바일 환경에 최적화된 디지털 청첩장 서비스입니다. 게스트별 맞춤형 초대 메시지, 축하 메시지 게스트북, 위치 안내, 카카오톡 공유 등 결혼식 초대에 필요한 모든 기능을 제공합니다.

### 주요 특징
- **타겟별 맞춤형 초대**: URL 파라미터로 게스트별 개인화된 메시지 제공
- **게스트북**: 방문자 축하 메시지 작성/수정/삭제 기능
- **지도 연동**: Kakao/Naver/Tmap 네비게이션 연동
- **SNS 공유**: 카카오톡 공유 기능
- **반응형 디자인**: 모바일 최적화 UI/UX

---

## 기술 스택

```
┌─────────────────────────────────────────────────────────────────────┐
│                         FRONTEND                                     │
├─────────────────────────────────────────────────────────────────────┤
│  JSP / HTML5 / CSS3 / JavaScript (ES6+)                             │
│  ├── Bootstrap 5.1.3 (UI Framework)                                 │
│  ├── jQuery 3.6.0 (DOM Manipulation)                                │
│  ├── Splide.js (Image Slider)                                       │
│  ├── FullCalendar 3.10.2 (Calendar)                                 │
│  ├── Moment.js 2.29.1 (Date Handling)                               │
│  └── html2canvas (Screenshot)                                        │
├─────────────────────────────────────────────────────────────────────┤
│                         BACKEND                                      │
├─────────────────────────────────────────────────────────────────────┤
│  Java 17 / Spring Boot 3.2.5                                        │
│  ├── Spring Web MVC (REST API)                                      │
│  ├── Spring Data JPA (ORM)                                          │
│  ├── Jasypt 3.0.4 (Encryption)                                      │
│  └── Lombok (Boilerplate Reduction)                                 │
├─────────────────────────────────────────────────────────────────────┤
│                        DATABASE                                      │
├─────────────────────────────────────────────────────────────────────┤
│  MySQL 8.0 (Production) / H2 (Local Development)                    │
├─────────────────────────────────────────────────────────────────────┤
│                        EXTERNAL APIs                                 │
├─────────────────────────────────────────────────────────────────────┤
│  Kakao Map API / Kakao Share API / Naver Map / Tmap                 │
├─────────────────────────────────────────────────────────────────────┤
│                        INFRASTRUCTURE                                │
├─────────────────────────────────────────────────────────────────────┤
│  AWS EC2 / GitHub Actions (CI/CD) / CloudFront (CDN)                │
└─────────────────────────────────────────────────────────────────────┘
```

---

## 시스템 아키텍처

### 전체 아키텍처

```
                                    ┌─────────────────┐
                                    │   CloudFront    │
                                    │   (CDN/Images)  │
                                    └────────┬────────┘
                                             │
┌──────────────┐                    ┌────────┴────────┐
│   Browser    │◄──── HTTPS ───────►│   AWS EC2       │
│   (Mobile)   │                    │   ┌───────────┐ │
└──────────────┘                    │   │  Tomcat   │ │
       │                            │   │   WAR     │ │
       │                            │   └─────┬─────┘ │
       ▼                            │         │       │
┌──────────────┐                    │   ┌─────▼─────┐ │
│ Kakao/Naver  │                    │   │   MySQL   │ │
│   Map API    │                    │   │    DB     │ │
└──────────────┘                    │   └───────────┘ │
                                    └─────────────────┘
```

### 레이어드 아키텍처

```
┌─────────────────────────────────────────────────────────────────┐
│                      Presentation Layer                          │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │                    index.jsp (View)                      │    │
│  │    ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐  │    │
│  │    │ index.js│  │gallery.js│ │ timer.js│  │calendar │  │    │
│  │    └─────────┘  └─────────┘  └─────────┘  └─────────┘  │    │
│  └─────────────────────────────────────────────────────────┘    │
└───────────────────────────────┬─────────────────────────────────┘
                                │ HTTP Request
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│                       Controller Layer                           │
│  ┌─────────────────────────┐  ┌─────────────────────────────┐   │
│  │   WeddingController     │  │   GuestMessageController    │   │
│  │   (Web - JSP 렌더링)     │  │   (REST API - JSON)         │   │
│  └───────────┬─────────────┘  └──────────────┬──────────────┘   │
└──────────────┼───────────────────────────────┼──────────────────┘
               │                               │
               ▼                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        Service Layer                             │
│  ┌─────────────────────────┐  ┌─────────────────────────────┐   │
│  │InvitationMessageService │  │   GuestMessageService       │   │
│  │ - getInvitationMessage()│  │ - getGuestMessages()        │   │
│  │                         │  │ - createGuestMessage()      │   │
│  │                         │  │ - updateGuestMessage()      │   │
│  │                         │  │ - deleteGuestMessage()      │   │
│  └───────────┬─────────────┘  └──────────────┬──────────────┘   │
└──────────────┼───────────────────────────────┼──────────────────┘
               │                               │
               ▼                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                       Repository Layer                           │
│  ┌─────────────────────────┐  ┌─────────────────────────────┐   │
│  │InvitationMessageRepo    │  │  GuestMessageRepository     │   │
│  │ - findByTarget()        │  │  - JpaRepository<>          │   │
│  └───────────┬─────────────┘  └──────────────┬──────────────┘   │
└──────────────┼───────────────────────────────┼──────────────────┘
               │                               │
               ▼                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        Database Layer                            │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │                    MySQL 8.0                             │    │
│  │   ┌──────────────────┐   ┌──────────────────────┐       │    │
│  │   │ invitation_message│   │    guest_message     │       │    │
│  │   └──────────────────┘   └──────────────────────┘       │    │
│  └─────────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────────┘
```

---

## 디렉토리 구조

```
Wedding/
├── src/
│   ├── main/
│   │   ├── java/dev/wony/wedding/
│   │   │   ├── config/
│   │   │   │   └── JasyptConfig.java         # Jasypt 암호화 설정
│   │   │   ├── controller/
│   │   │   │   ├── api/
│   │   │   │   │   ├── GuestMessageController.java  # 게스트북 REST API
│   │   │   │   │   └── HealthController.java        # 헬스체크 API
│   │   │   │   └── web/
│   │   │   │       └── WeddingController.java       # 메인 페이지 컨트롤러
│   │   │   ├── domain/
│   │   │   │   ├── GuestMessage.java                # 게스트 메시지 엔티티
│   │   │   │   ├── GuestMessageDto.java             # 게스트 메시지 DTO
│   │   │   │   ├── InvitationMessage.java           # 초대 메시지 엔티티
│   │   │   │   └── InvitationMessageDto.java        # 초대 메시지 DTO
│   │   │   ├── dto/
│   │   │   │   └── DeleteGuestMessageDto.java       # 삭제 요청 DTO
│   │   │   ├── repository/
│   │   │   │   ├── GuestMessageRepository.java      # 게스트 메시지 저장소
│   │   │   │   └── InvitationMessageRepository.java # 초대 메시지 저장소
│   │   │   ├── request/
│   │   │   │   ├── GuestMessageRequest.java         # API 요청 객체
│   │   │   │   └── DeleteGuestMessageRequest.java   # 삭제 요청 객체
│   │   │   ├── response/
│   │   │   │   ├── GuestMessageResponse.java        # API 응답 객체
│   │   │   │   └── GuestMessageResponses.java       # 목록 응답 객체
│   │   │   ├── service/
│   │   │   │   ├── GuestMessageService.java         # 게스트북 비즈니스 로직
│   │   │   │   └── InvitationMessageService.java    # 초대 메시지 비즈니스 로직
│   │   │   └── WeddingApplication.java              # Spring Boot 메인
│   │   ├── resources/
│   │   │   ├── application.yml                      # 기본 환경 설정 (MySQL)
│   │   │   ├── application-local.yml                # 로컬 개발용 (H2)
│   │   │   ├── application-prod.yml                 # 운영 환경 설정
│   │   │   ├── data.sql                             # 초기 데이터 (H2용)
│   │   │   └── static/
│   │   │       ├── css/                             # 스타일시트
│   │   │       ├── js/                              # JavaScript 파일
│   │   │       ├── img/                             # 이미지 리소스
│   │   │       └── video/                           # 비디오 파일
│   │   └── webapp/WEB-INF/jsp/
│   │       └── index.jsp                            # 메인 뷰 템플릿
│   └── test/
│       ├── java/dev/wony/wedding/
│       │   ├── config/JasyptConfigTest.java
│       │   ├── repository/
│       │   │   ├── GuestMessageRepositoryTest.java
│       │   │   └── InvitationMessageRepositoryTest.java
│       │   ├── service/GuestMessageServiceTest.java
│       │   └── WeddingApplicationTests.java
│       └── resources/
│           └── application.yml                      # 테스트용 설정 (H2)
├── .github/workflows/
│   └── deploy.yml                                   # GitHub Actions CI/CD
├── build.gradle                                     # Gradle 빌드 설정
├── settings.gradle
├── README.md
└── ARCHITECTURE.md                                  # 본 문서
```

---

## 데이터 모델

### ERD (Entity Relationship Diagram)

```
┌────────────────────────────────────┐
│         guest_message              │
├────────────────────────────────────┤
│ PK │ id          │ BIGINT          │
│    │ title       │ VARCHAR(255)    │
│    │ content     │ TEXT            │
│    │ author      │ VARCHAR(255)    │
│    │ password    │ VARCHAR(255)    │
│    │ created_at  │ DATETIME        │
│    │ updated_at  │ DATETIME        │
└────────────────────────────────────┘

┌────────────────────────────────────┐
│       invitation_message           │
├────────────────────────────────────┤
│ PK │ id          │ BIGINT          │
│    │ target      │ VARCHAR(255)    │
│    │ message     │ TEXT            │
│    │ thanks_to   │ TEXT            │
└────────────────────────────────────┘
```

### 엔티티 설명

#### GuestMessage (게스트 메시지)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | Long | PK, Auto Increment |
| title | String | 메시지 제목 (미사용) |
| content | String | 메시지 내용 |
| author | String | 작성자 이름 |
| password | String | 수정/삭제용 비밀번호 |
| createdAt | LocalDateTime | 생성 시각 (자동) |
| updatedAt | LocalDateTime | 수정 시각 (자동) |

#### InvitationMessage (초대 메시지)
| 필드 | 타입 | 설명 |
|------|------|------|
| id | Long | PK, Auto Increment |
| target | String | 대상 식별자 (이름/그룹) |
| message | String | 맞춤형 초대 메시지 |
| thanksTo | String | 맞춤형 감사 인사말 |

---

## API 명세

### REST API Endpoints

#### 헬스 체크
```
GET /health

Response: "Healthy" (200 OK)
```

#### 게스트 메시지 목록 조회
```
GET /api/guest-messages?page=0&size=3&sort=id,desc

Response:
{
  "content": [
    {
      "id": 1,
      "title": null,
      "content": "결혼 축하해요!",
      "author": "김철수",
      "createdAt": "2024-09-01 14:30:00"
    }
  ],
  "totalPages": 5
}
```

#### 게스트 메시지 생성
```
POST /api/guest-messages
Content-Type: application/json

Request:
{
  "author": "김철수",
  "password": "1234",
  "content": "결혼 축하해요!"
}

Response: 201 Created
{
  "id": 1,
  "content": "결혼 축하해요!",
  "author": "김철수",
  "createdAt": "2024-09-01 14:30:00"
}
```

#### 게스트 메시지 수정
```
PUT /api/guest-messages/{id}
Content-Type: application/json

Request:
{
  "author": "김철수",
  "password": "1234",
  "content": "결혼 진심으로 축하해요!"
}

Response: 200 OK
```

#### 게스트 메시지 삭제
```
DELETE /api/guest-messages/{id}
Content-Type: application/json

Request:
{
  "password": "1234"
}

Response: 204 No Content
Error: 400 Bad Request (비밀번호 불일치)
```

### 웹 페이지 엔드포인트
```
GET /
GET /?target={name}

Response: index.jsp (HTML)
- target 파라미터로 맞춤형 초대 메시지 렌더링
```

---

## 주요 기능

### 1. 타겟별 맞춤형 초대장

```
┌─────────────────────────────────────────────────────────────────┐
│                      데이터 흐름                                 │
└─────────────────────────────────────────────────────────────────┘

  URL: https://ddangbbo.com/?target=철수형
                    │
                    ▼
         ┌─────────────────────┐
         │  WeddingController  │
         │  index(target)      │
         └──────────┬──────────┘
                    │
                    ▼
         ┌─────────────────────┐
         │InvitationMsgService │
         │getInvitationMessage │
         └──────────┬──────────┘
                    │
                    ▼
         ┌─────────────────────┐
         │      Database       │
         │  findByTarget()     │
         └──────────┬──────────┘
                    │
                    ▼
         ┌─────────────────────┐
         │     index.jsp       │
         │  맞춤형 메시지 렌더링  │
         └─────────────────────┘
```

### 2. 게스트북 (축하 메시지)

```
┌─────────────────────────────────────────────────────────────────┐
│                     CRUD 흐름도                                  │
└─────────────────────────────────────────────────────────────────┘

  ┌──────────┐     AJAX      ┌──────────────────┐
  │  Browser │◄────────────►│ GuestMessage API │
  │          │              │                  │
  │ index.js │              │  Controller      │
  │          │              │       │          │
  └──────────┘              │       ▼          │
                            │   Service        │
                            │       │          │
                            │       ▼          │
                            │  Repository      │
                            │       │          │
                            │       ▼          │
                            │    MySQL         │
                            └──────────────────┘

  CREATE: POST   /api/guest-messages      → INSERT
  READ:   GET    /api/guest-messages      → SELECT (Pagination)
  UPDATE: PUT    /api/guest-messages/{id} → UPDATE (Password 검증)
  DELETE: DELETE /api/guest-messages/{id} → DELETE (Password 검증)
```

### 3. 지도 및 네비게이션

```
┌─────────────────────────────────────────────────────────────────┐
│                     지도 연동 구조                               │
└─────────────────────────────────────────────────────────────────┘

                         ┌───────────────┐
                         │   index.jsp   │
                         │   (지도 영역)  │
                         └───────┬───────┘
                                 │
              ┌──────────────────┼──────────────────┐
              │                  │                  │
              ▼                  ▼                  ▼
       ┌───────────┐      ┌───────────┐      ┌───────────┐
       │ Kakao Map │      │ Naver Map │      │   Tmap    │
       │    API    │      │    API    │      │    API    │
       └───────────┘      └───────────┘      └───────────┘
              │                  │                  │
              └──────────────────┼──────────────────┘
                                 │
                                 ▼
                      ┌───────────────────┐
                      │   네비게이션 실행   │
                      │  (모바일 앱 연동)   │
                      └───────────────────┘

  좌표: 37.48276871066162, 127.03494231900086 (양재 엘블레스)
```

### 4. 카카오톡 공유

```
┌─────────────────────────────────────────────────────────────────┐
│                     공유 기능 흐름                               │
└─────────────────────────────────────────────────────────────────┘

  ┌──────────┐
  │  공유    │
  │  버튼    │
  └────┬─────┘
       │
       ▼
  ┌──────────────────┐
  │   shareKakao()   │
  │   index.js       │
  └────────┬─────────┘
           │
           ▼
  ┌──────────────────┐      ┌──────────────────┐
  │ Kakao.Share.     │      │   URL 생성        │
  │ sendDefault()    │─────►│ ?target={name}   │
  └──────────────────┘      └──────────────────┘
           │
           ▼
  ┌──────────────────┐
  │   카카오톡 앱     │
  │   공유 메시지     │
  └──────────────────┘
```

---

## 배포 파이프라인

### CI/CD 흐름 (GitHub Actions)

```
┌─────────────────────────────────────────────────────────────────┐
│                    GitHub Actions Pipeline                       │
└─────────────────────────────────────────────────────────────────┘

  ┌──────────┐
  │  GitHub  │
  │   Push   │───► main branch
  └────┬─────┘
       │
       ▼
  ┌──────────────────────────────────────┐
  │        GitHub Actions Runner          │
  │        (ubuntu-latest)                │
  │                                       │
  │  1. Checkout Code                     │
  │  2. Setup JDK 17 (temurin)           │
  │  3. Grant Gradle Permission           │
  │  4. Build with Gradle (-x test)       │
  │  5. Setup SSH Key                     │
  │  6. SCP WAR to EC2                    │
  │  7. SSH: deploy.sh stop               │
  │  8. SSH: deploy.sh start              │
  └────────────────────┬─────────────────┘
                       │
                       ▼
  ┌──────────────────────────────────────┐
  │            AWS EC2                    │
  │         (43.200.125.37)              │
  │                                       │
  │  ┌─────────────────────────────┐     │
  │  │    wedding-0.0.1-SNAPSHOT   │     │
  │  │           .war              │     │
  │  └─────────────────────────────┘     │
  │               │                       │
  │               ▼                       │
  │  ┌─────────────────────────────┐     │
  │  │         Tomcat              │     │
  │  │    (Spring Boot 내장)        │     │
  │  └─────────────────────────────┘     │
  │               │                       │
  │               ▼                       │
  │  ┌─────────────────────────────┐     │
  │  │      MySQL Database         │     │
  │  │     (localhost:3306)        │     │
  │  └─────────────────────────────┘     │
  └──────────────────────────────────────┘
```

### 배포 스크립트 (deploy.sh)

```bash
# stop: 기존 프로세스 종료
# start: 새 WAR 파일로 서버 시작

java -jar -Dspring.profiles.active=prod wedding-0.0.1-SNAPSHOT.war
```

---

## 보안

### 적용된 보안 기능

| 항목 | 설명 |
|------|------|
| DB 비밀번호 암호화 | Jasypt (PBEWithMD5AndDES) |
| 게스트북 권한 관리 | 비밀번호 기반 수정/삭제 |
| CDN 호스팅 | CloudFront를 통한 정적 리소스 분리 |

### 설정 파일 암호화 예시
```yaml
# application.yml
spring:
  datasource:
    password: ENC(i47xn1yWuGTFwz65qahHJydFMrc2O9ZR)

jasypt:
  encryptor:
    password: ddangbbo
```

---

## 프론트엔드 섹션 구조

```
┌─────────────────────────────────────────────────────────────────┐
│                      index.jsp 구성                              │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 1. First Content (첫 인사)                               │    │
│  │    - 벚꽃 애니메이션 (Canvas)                             │    │
│  │    - 메인 이미지 + 타이포그래피                           │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 2. Invitation (초대 문구)                                │    │
│  │    - target별 맞춤 메시지                                 │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 3. Names (신랑신부 정보)                                 │    │
│  │    - 연락처 모달                                          │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 4. Gallery (사진 갤러리)                                 │    │
│  │    - Splide 슬라이더 (31장)                              │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 5. Movie (메이킹 필름)                                   │    │
│  │    - HTML5 Video                                         │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 6. Wedding Day (결혼식 정보)                             │    │
│  │    - FullCalendar                                        │    │
│  │    - 카운트다운 타이머                                    │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 7. Location (오시는 길)                                  │    │
│  │    - Kakao Map                                           │    │
│  │    - 네비게이션 버튼                                      │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 8. Information Tab (예식 정보)                           │    │
│  │    - 홀/식사/주차 안내 탭                                 │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 9. Account (축의금 계좌)                                 │    │
│  │    - 신랑측/신부측 계좌                                   │    │
│  │    - 복사 기능                                            │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 10. Guestbook (축하 메시지)                              │    │
│  │    - CRUD + Pagination                                   │    │
│  └─────────────────────────────────────────────────────────┘    │
│                              │                                   │
│                              ▼                                   │
│  ┌─────────────────────────────────────────────────────────┐    │
│  │ 11. Thanks To (마지막 인사)                              │    │
│  │    - 카카오톡 공유                                        │    │
│  │    - 링크 복사                                            │    │
│  └─────────────────────────────────────────────────────────┘    │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 로컬 개발 환경 설정

### 필수 요구사항
- Java 17+
- Gradle 8.x
- MySQL 8.0 (운영) 또는 H2 (로컬 개발)

### Profile 구성

```
┌─────────────────────────────────────────────────────────────────┐
│                     프로파일 구조                                 │
├─────────────────────────────────────────────────────────────────┤
│  application.yml       │  기본 설정 (MySQL - 원격 서버)          │
│  application-local.yml │  로컬 개발용 (H2 인메모리)              │
│  application-prod.yml  │  운영 환경 (MySQL - localhost)         │
└─────────────────────────────────────────────────────────────────┘
```

### 실행 방법

#### 방법 1: H2 인메모리 DB로 로컬 실행 (권장)
```bash
# 1. 프로젝트 클론
git clone https://github.com/your-repo/wedding.git
cd wedding

# 2. local 프로파일로 실행
./gradlew bootRun --args='--spring.profiles.active=local'

# 3. 브라우저에서 접속
open http://localhost:8080

# 4. H2 Console 접속 (데이터 확인용)
open http://localhost:8080/h2-console
# JDBC URL: jdbc:h2:mem:ddangbbo
# User: sa / Password: (빈값)
```

#### 방법 2: MySQL DB로 실행
```bash
# MySQL 서버 필요
./gradlew bootRun
```

### H2 로컬 환경 특징

| 항목 | 설정 |
|------|------|
| 데이터베이스 | H2 인메모리 (jdbc:h2:mem:ddangbbo) |
| DDL 전략 | create (자동 스키마 생성) |
| 초기 데이터 | data.sql로 샘플 데이터 자동 로드 |
| H2 Console | http://localhost:8080/h2-console |
| MySQL 호환 | MODE=MySQL 설정으로 호환성 유지 |

### 환경 변수
```yaml
# application.yml
jasypt.encryptor.password: ddangbbo  # DB 비밀번호 복호화 키
```

---

## 테스트

### 테스트 환경

```
┌─────────────────────────────────────────────────────────────────┐
│                     테스트 환경 구성                              │
├─────────────────────────────────────────────────────────────────┤
│  데이터베이스  │  H2 인메모리 (jdbc:h2:mem:testdb)               │
│  DDL 전략     │  create-drop (테스트 후 자동 삭제)               │
│  초기 데이터   │  비활성화 (sql.init.mode: never)                │
│  트랜잭션     │  테스트 종료 후 자동 롤백                         │
└─────────────────────────────────────────────────────────────────┘
```

### 테스트 실행
```bash
./gradlew test
```

### 테스트 커버리지
| 테스트 클래스 | 설명 |
|--------------|------|
| `JasyptConfigTest` | 암호화/복호화 테스트 |
| `GuestMessageRepositoryTest` | 게스트 메시지 Repository CRUD 테스트 |
| `InvitationMessageRepositoryTest` | 초대 메시지 Repository 테스트 |
| `GuestMessageServiceTest` | Service 계층 테스트 |
| `WeddingApplicationTests` | 컨텍스트 로드 테스트 |

---

## 향후 개선 사항

- [ ] HTTPS 적용
- [ ] 게스트 메시지 비밀번호 해싱 (현재 평문 저장)
- [ ] API Rate Limiting
- [ ] 관리자 페이지 추가
- [ ] 다국어 지원

---

## License

Private Project - All Rights Reserved

---

*Last Updated: 2024-09*

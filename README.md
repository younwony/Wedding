# DDang & BBO Mobile Wedding Invitation

> Spring Boot 기반 모바일 청첩장 서비스

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.5-green.svg)](https://spring.io/projects/spring-boot)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-Private-red.svg)]()

## Overview

모바일 환경에 최적화된 디지털 청첩장 서비스입니다. 게스트별 맞춤형 초대 메시지, 축하 메시지 게스트북, 지도 연동, 카카오톡 공유 등 결혼식 초대에 필요한 모든 기능을 제공합니다.

### Demo
- **Production**: https://ddangbbo.com
- **맞춤형 초대**: https://ddangbbo.com/?target=친구이름

---

## Tech Stack

### Backend
- **Framework**: Spring Boot 3.2.5
- **Language**: Java 17
- **ORM**: Spring Data JPA (Hibernate)
- **Database**: MySQL 8.0
- **Security**: Jasypt (Password Encryption)

### Frontend
- **Template**: JSP
- **UI Framework**: Bootstrap 5.1.3
- **JavaScript**: Vanilla JS, jQuery 3.6.0
- **Libraries**:
  - Splide.js (Image Slider)
  - FullCalendar (Calendar)
  - Moment.js (Date Handling)

### External APIs
- Kakao Map API (지도)
- Kakao Share API (카카오톡 공유)
- Naver/Tmap (네비게이션)

### Infrastructure
- AWS EC2
- GitHub Actions (CI/CD)
- CloudFront (CDN)

---

## Features

| 기능 | 설명 | 상태 |
|------|------|:----:|
| 맞춤형 초대장 | URL 파라미터로 게스트별 개인화 메시지 | ✅ |
| 웨딩 갤러리 | Splide 슬라이더 기반 사진 갤러리 | ✅ |
| 메이킹 필름 | HTML5 비디오 플레이어 | ✅ |
| 결혼식 정보 | 날짜, 장소, 달력, 카운트다운 타이머 | ✅ |
| 오시는 길 | Kakao Map + 네비게이션 연동 | ✅ |
| 예식 정보 탭 | 홀/식사/주차 안내 | ✅ |
| 축의금 계좌 | 계좌번호 복사 기능 | ✅ |
| 게스트북 | 축하 메시지 CRUD + 페이지네이션 | ✅ |
| 카카오톡 공유 | 맞춤형 URL 공유 | ✅ |
| 연락하기 | 전화/문자 버튼 | ✅ |

---

## Project Structure

```
src/
├── main/
│   ├── java/dev/wony/wedding/
│   │   ├── config/          # 설정 (Jasypt 암호화)
│   │   ├── controller/      # 컨트롤러 (Web, REST API)
│   │   ├── domain/          # 엔티티, DTO
│   │   ├── repository/      # JPA 저장소
│   │   ├── service/         # 비즈니스 로직
│   │   └── request/response # API 요청/응답 객체
│   ├── resources/
│   │   ├── static/          # CSS, JS, 이미지
│   │   └── application.yml  # 환경 설정
│   └── webapp/WEB-INF/jsp/  # JSP 템플릿
└── test/                     # 테스트 코드
```

자세한 아키텍처는 [ARCHITECTURE.md](./ARCHITECTURE.md)를 참조하세요.

---

## API Endpoints

### REST API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/health` | 헬스 체크 |
| GET | `/api/guest-messages` | 게스트 메시지 목록 (페이지네이션) |
| POST | `/api/guest-messages` | 게스트 메시지 생성 |
| PUT | `/api/guest-messages/{id}` | 게스트 메시지 수정 |
| DELETE | `/api/guest-messages/{id}` | 게스트 메시지 삭제 |

### Web Pages

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/` | 메인 페이지 |
| GET | `/?target={name}` | 맞춤형 초대장 |

---

## Quick Start

### Prerequisites
- Java 17+
- Gradle 8.x
- MySQL 8.0

### Installation

```bash
# 1. Clone repository
git clone https://github.com/your-repo/wedding.git
cd wedding

# 2. Build
./gradlew build

# 3. Run
./gradlew bootRun

# 4. Access
open http://localhost:8080
```

### Configuration

```yaml
# src/main/resources/application.yml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/ddangbbo
    username: your_username
    password: ENC(encrypted_password)

jasypt:
  encryptor:
    password: your_secret_key
```

---

## Testing

```bash
# 전체 테스트 실행
./gradlew test

# 특정 테스트 실행
./gradlew test --tests "GuestMessageServiceTest"
```

---

## Deployment

GitHub Actions를 통한 자동 배포:

```
main 브랜치 push → Build → SCP to EC2 → Restart Server
```

배포 파이프라인 상세: [.github/workflows/deploy.yml](.github/workflows/deploy.yml)

---

## References

| 이름 | 링크 |
|------|------|
| 바른손 | https://www.barunsonmcard.com/preview/1166 |
| 잇츠카드 | https://www.itscard.co.kr/mobile/new_m/mcard/minifyHTML/MCard29.asp |
| 프롬투데이 | https://mcard.fromtoday.co.kr/w/Hr9Hp3/?2ba |
| 메이크디어 | https://makedear.com/products/details/i1 |
| 파스텔무비 | https://pastelletters.com/card?cardId=3tlUpw74YT |
| ourfirstletter | https://ourfirstletter.com/w/natural-green-ZKSP |
| small-square | http://small-square.com/sample/07/index.html?v=2 |
| salondeletter | https://salondeletter.com/w/sample1_1 |

---

## Documentation

- [ARCHITECTURE.md](./ARCHITECTURE.md) - 시스템 아키텍처 상세 문서
- [API.md](./API.md) - API 상세 명세

---

## License

Private Project - All Rights Reserved

---

*Developed with love for DDang & BBO's Wedding*

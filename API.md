# Wedding Invitation API Documentation

> REST API 상세 명세서

## Base URL

```
Production: https://ddangbbo.com
Development: http://localhost:8080
```

---

## 목차
1. [헬스 체크](#1-헬스-체크)
2. [게스트 메시지](#2-게스트-메시지)
   - [목록 조회](#21-게스트-메시지-목록-조회)
   - [생성](#22-게스트-메시지-생성)
   - [수정](#23-게스트-메시지-수정)
   - [삭제](#24-게스트-메시지-삭제)
3. [웹 페이지](#3-웹-페이지)
4. [에러 응답](#4-에러-응답)

---

## 1. 헬스 체크

서버 상태를 확인합니다.

### Request

```http
GET /health
```

### Response

```
Status: 200 OK
Content-Type: text/plain

Healthy
```

---

## 2. 게스트 메시지

축하 메시지 게스트북 API입니다.

### 2.1 게스트 메시지 목록 조회

페이지네이션을 지원하는 메시지 목록을 조회합니다.

#### Request

```http
GET /api/guest-messages?page={page}&size={size}&sort={sort}
```

#### Query Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `page` | integer | No | 0 | 페이지 번호 (0부터 시작) |
| `size` | integer | No | 3 | 페이지당 메시지 수 |
| `sort` | string | No | id,desc | 정렬 기준 (필드,방향) |

#### Response

```json
Status: 200 OK
Content-Type: application/json

{
  "content": [
    {
      "id": 15,
      "title": null,
      "content": "결혼 진심으로 축하해요! 행복하세요~",
      "author": "김철수",
      "password": "1234",
      "createdAt": "2024-09-15 14:30:00"
    },
    {
      "id": 14,
      "title": null,
      "content": "두 분의 앞날을 축복합니다!",
      "author": "이영희",
      "password": "abcd",
      "createdAt": "2024-09-14 10:20:00"
    }
  ],
  "totalPages": 5
}
```

#### Response Fields

| Field | Type | Description |
|-------|------|-------------|
| `content` | array | 메시지 목록 |
| `content[].id` | number | 메시지 고유 ID |
| `content[].title` | string | 메시지 제목 (미사용) |
| `content[].content` | string | 메시지 내용 |
| `content[].author` | string | 작성자 이름 |
| `content[].password` | string | 비밀번호 |
| `content[].createdAt` | string | 생성 시각 (yyyy-MM-dd HH:mm:ss) |
| `totalPages` | number | 전체 페이지 수 |

#### Example

```bash
curl -X GET "https://ddangbbo.com/api/guest-messages?page=0&size=3&sort=id,desc"
```

---

### 2.2 게스트 메시지 생성

새로운 축하 메시지를 작성합니다.

#### Request

```http
POST /api/guest-messages
Content-Type: application/json
```

#### Request Body

```json
{
  "author": "김철수",
  "password": "1234",
  "content": "결혼 진심으로 축하해요! 행복하세요~"
}
```

#### Request Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `author` | string | Yes | 작성자 이름 |
| `password` | string | Yes | 수정/삭제용 비밀번호 |
| `content` | string | Yes | 메시지 내용 |

#### Response

```json
Status: 201 Created
Content-Type: application/json

{
  "id": 16,
  "title": null,
  "content": "결혼 진심으로 축하해요! 행복하세요~",
  "author": "김철수",
  "password": "1234",
  "createdAt": "2024-09-20 15:30:00"
}
```

#### Example

```bash
curl -X POST "https://ddangbbo.com/api/guest-messages" \
  -H "Content-Type: application/json" \
  -d '{
    "author": "김철수",
    "password": "1234",
    "content": "결혼 진심으로 축하해요!"
  }'
```

---

### 2.3 게스트 메시지 수정

기존 메시지를 수정합니다.

#### Request

```http
PUT /api/guest-messages/{id}
Content-Type: application/json
```

#### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | number | Yes | 메시지 ID |

#### Request Body

```json
{
  "author": "김철수",
  "password": "1234",
  "content": "수정된 축하 메시지입니다!"
}
```

#### Request Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `author` | string | Yes | 작성자 이름 |
| `password` | string | Yes | 비밀번호 (검증용) |
| `content` | string | Yes | 수정할 메시지 내용 |

#### Response

```json
Status: 200 OK
Content-Type: application/json

{
  "id": 16,
  "title": null,
  "content": "수정된 축하 메시지입니다!",
  "author": "김철수",
  "password": "1234",
  "createdAt": "2024-09-20 15:30:00"
}
```

#### Example

```bash
curl -X PUT "https://ddangbbo.com/api/guest-messages/16" \
  -H "Content-Type: application/json" \
  -d '{
    "author": "김철수",
    "password": "1234",
    "content": "수정된 축하 메시지입니다!"
  }'
```

---

### 2.4 게스트 메시지 삭제

메시지를 삭제합니다. 비밀번호 검증이 필요합니다.

#### Request

```http
DELETE /api/guest-messages/{id}
Content-Type: application/json
```

#### Path Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `id` | number | Yes | 메시지 ID |

#### Request Body

```json
{
  "password": "1234"
}
```

#### Request Fields

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `password` | string | Yes | 비밀번호 (검증용) |

#### Response

```
Status: 204 No Content
```

#### Error Response

비밀번호가 일치하지 않는 경우:

```json
Status: 400 Bad Request
Content-Type: application/json

{
  "message": "비밀번호가 일치하지 않습니다."
}
```

#### Example

```bash
curl -X DELETE "https://ddangbbo.com/api/guest-messages/16" \
  -H "Content-Type: application/json" \
  -d '{
    "password": "1234"
  }'
```

---

## 3. 웹 페이지

### 3.1 메인 페이지

청첩장 메인 페이지를 렌더링합니다.

#### Request

```http
GET /
```

#### Response

```html
Status: 200 OK
Content-Type: text/html

<!-- index.jsp 렌더링 -->
```

---

### 3.2 맞춤형 초대장

타겟(게스트)별 맞춤형 초대 메시지가 포함된 청첩장을 렌더링합니다.

#### Request

```http
GET /?target={name}
```

#### Query Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `target` | string | No | 게스트 식별자 (이름/그룹) |

#### Response

```html
Status: 200 OK
Content-Type: text/html

<!-- 맞춤형 메시지가 포함된 index.jsp 렌더링 -->
```

#### Behavior

1. `target` 파라미터가 제공되면 DB에서 해당 타겟의 메시지 조회
2. 일치하는 메시지가 있으면 해당 메시지와 감사 인사말 표시
3. 일치하는 메시지가 없으면 기본 메시지 표시

#### Example URLs

```
https://ddangbbo.com/?target=철수형
https://ddangbbo.com/?target=대학동기
https://ddangbbo.com/?target=회사선배
```

---

## 4. 에러 응답

### 공통 에러 형식

```json
{
  "timestamp": "2024-09-20T15:30:00.000+00:00",
  "status": 400,
  "error": "Bad Request",
  "message": "에러 메시지",
  "path": "/api/guest-messages/16"
}
```

### HTTP 상태 코드

| Status Code | Description |
|-------------|-------------|
| 200 | OK - 요청 성공 |
| 201 | Created - 리소스 생성 성공 |
| 204 | No Content - 삭제 성공 |
| 400 | Bad Request - 잘못된 요청 (비밀번호 불일치 등) |
| 404 | Not Found - 리소스 없음 |
| 500 | Internal Server Error - 서버 오류 |

---

## 5. 데이터 모델

### GuestMessage

```typescript
interface GuestMessage {
  id: number;           // 고유 ID (Auto Increment)
  title: string | null; // 제목 (미사용)
  content: string;      // 메시지 내용
  author: string;       // 작성자 이름
  password: string;     // 비밀번호
  createdAt: string;    // 생성 시각 (yyyy-MM-dd HH:mm:ss)
  updatedAt: string;    // 수정 시각 (yyyy-MM-dd HH:mm:ss)
}
```

### InvitationMessage

```typescript
interface InvitationMessage {
  id: number;        // 고유 ID
  target: string;    // 대상 식별자
  message: string;   // 초대 메시지
  thanksTo: string;  // 감사 인사말
}
```

### GuestMessageResponses (목록 응답)

```typescript
interface GuestMessageResponses {
  content: GuestMessage[];  // 메시지 배열
  totalPages: number;       // 전체 페이지 수
}
```

---

## 6. 인증 및 보안

### 현재 구현

- **비밀번호 기반 권한 관리**: 메시지 수정/삭제 시 작성 시 입력한 비밀번호 검증
- **DB 비밀번호 암호화**: Jasypt를 이용한 application.yml 민감정보 암호화

### 주의사항

- 현재 게스트 메시지 비밀번호는 평문으로 저장됩니다
- API 응답에 비밀번호가 포함되어 반환됩니다 (개선 필요)
- Rate Limiting이 적용되어 있지 않습니다

---

## 7. 사용 예시 (JavaScript)

### 메시지 목록 조회

```javascript
async function getGuestMessages(page = 0, size = 3) {
  const response = await fetch(
    `/api/guest-messages?page=${page}&size=${size}&sort=id,desc`
  );
  return response.json();
}
```

### 메시지 작성

```javascript
async function createGuestMessage(author, password, content) {
  const response = await fetch('/api/guest-messages', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ author, password, content })
  });
  return response.json();
}
```

### 메시지 삭제

```javascript
async function deleteGuestMessage(id, password) {
  const response = await fetch(`/api/guest-messages/${id}`, {
    method: 'DELETE',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ password })
  });

  if (response.status === 204) {
    return { success: true };
  } else {
    const error = await response.json();
    throw new Error(error.message);
  }
}
```

---

*Last Updated: 2024-09*

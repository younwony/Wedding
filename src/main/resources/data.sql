-- InvitationMessage sample data
INSERT INTO invitation_message (target, message, thanks_to) VALUES ('groom', '안녕하세요, 신랑 메시지입니다.', '부모님께 감사드립니다.');
INSERT INTO invitation_message (target, message, thanks_to) VALUES ('bride', '안녕하세요, 신부 메시지입니다.', '모든 분들께 감사드립니다.');

-- GuestMessage sample data
INSERT INTO guest_message (title, content, author, password, created_at, updated_at)
VALUES ('축하합니다', '결혼을 진심으로 축하합니다!', '홍길동', '1234', NOW(), NOW());
INSERT INTO guest_message (title, content, author, password, created_at, updated_at)
VALUES ('행복하세요', '두 분의 앞날을 축복합니다.', '김철수', '5678', NOW(), NOW());

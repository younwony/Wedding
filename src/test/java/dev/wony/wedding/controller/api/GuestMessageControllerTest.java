package dev.wony.wedding.controller.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.repository.GuestMessageRepository;
import dev.wony.wedding.request.DeleteGuestMessageRequest;
import dev.wony.wedding.request.GuestMessageRequest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
class GuestMessageControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private GuestMessageRepository guestMessageRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @BeforeEach
    void setUp() {
        guestMessageRepository.deleteAll();
    }

    @Test
    @DisplayName("게스트 메시지 목록을 조회한다")
    void getGuestMessages() throws Exception {
        // given
        GuestMessage message = GuestMessage.builder()
                .title("제목")
                .content("내용")
                .author("작성자")
                .password(passwordEncoder.encode("1234"))
                .build();
        guestMessageRepository.save(message);

        // when & then
        mockMvc.perform(get("/api/guest-messages")
                        .param("page", "0")
                        .param("size", "10"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content", hasSize(1)))
                .andExpect(jsonPath("$.content[0].author").value("작성자"))
                .andExpect(jsonPath("$.content[0].content").value("내용"))
                .andExpect(jsonPath("$.content[0].password").doesNotExist());
    }

    @Test
    @DisplayName("게스트 메시지를 생성한다")
    void createGuestMessage() throws Exception {
        // given
        GuestMessageRequest request = GuestMessageRequest.builder()
                .title("제목")
                .content("축하합니다!")
                .author("홍길동")
                .password("1234")
                .build();

        // when & then
        mockMvc.perform(post("/api/guest-messages")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.author").value("홍길동"))
                .andExpect(jsonPath("$.content").value("축하합니다!"))
                .andExpect(jsonPath("$.password").doesNotExist());
    }

    @Test
    @DisplayName("게스트 메시지를 수정한다")
    void updateGuestMessage() throws Exception {
        // given
        String rawPassword = "1234";
        GuestMessage message = GuestMessage.builder()
                .title("제목")
                .content("원래 내용")
                .author("작성자")
                .password(passwordEncoder.encode(rawPassword))
                .build();
        GuestMessage saved = guestMessageRepository.save(message);

        GuestMessageRequest updateRequest = GuestMessageRequest.builder()
                .title("수정된 제목")
                .content("수정된 내용")
                .author("작성자")
                .password(rawPassword)
                .build();

        // when & then
        mockMvc.perform(put("/api/guest-messages/{id}", saved.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(updateRequest)))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content").value("수정된 내용"));
    }

    @Test
    @DisplayName("잘못된 비밀번호로 수정 시 실패한다")
    void updateGuestMessage_wrongPassword() throws Exception {
        // given
        GuestMessage message = GuestMessage.builder()
                .title("제목")
                .content("내용")
                .author("작성자")
                .password(passwordEncoder.encode("1234"))
                .build();
        GuestMessage saved = guestMessageRepository.save(message);

        GuestMessageRequest updateRequest = GuestMessageRequest.builder()
                .title("수정된 제목")
                .content("수정된 내용")
                .author("작성자")
                .password("wrongpassword")
                .build();

        // when & then
        mockMvc.perform(put("/api/guest-messages/{id}", saved.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(updateRequest)))
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("게스트 메시지를 삭제한다")
    void deleteGuestMessage() throws Exception {
        // given
        String rawPassword = "1234";
        GuestMessage message = GuestMessage.builder()
                .title("제목")
                .content("내용")
                .author("작성자")
                .password(passwordEncoder.encode(rawPassword))
                .build();
        GuestMessage saved = guestMessageRepository.save(message);

        DeleteGuestMessageRequest deleteRequest = new DeleteGuestMessageRequest(rawPassword);

        // when & then
        mockMvc.perform(delete("/api/guest-messages/{id}", saved.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(deleteRequest)))
                .andExpect(status().isNoContent());
    }

    @Test
    @DisplayName("잘못된 비밀번호로 삭제 시 실패한다")
    void deleteGuestMessage_wrongPassword() throws Exception {
        // given
        GuestMessage message = GuestMessage.builder()
                .title("제목")
                .content("내용")
                .author("작성자")
                .password(passwordEncoder.encode("1234"))
                .build();
        GuestMessage saved = guestMessageRepository.save(message);

        DeleteGuestMessageRequest deleteRequest = new DeleteGuestMessageRequest("wrongpassword");

        // when & then
        mockMvc.perform(delete("/api/guest-messages/{id}", saved.getId())
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(deleteRequest)))
                .andExpect(status().isBadRequest());
    }
}

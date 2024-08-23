package dev.wony.wedding.repository;

import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.domain.GuestMessageDto;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class GuestMessageRepositoryTest {

    @Autowired
    private GuestMessageRepository guestMessageRepository;

    @Test
    @DisplayName("방명록을 등록한다")
    void saveGuestMessage() {
        // given
        GuestMessageDto guestMessageDto = GuestMessageDto.builder()
                .title("title")
                .content("content")
                .author("author")
                .password("password")
                .build();
        GuestMessage guestMessage = guestMessageDto.toEntity();

        // when
        GuestMessage savedGuestMessage = guestMessageRepository.save(guestMessage);

        // then
        assertThat(savedGuestMessage.getId()).isNotNull();
        assertThat(savedGuestMessage.getTitle()).isEqualTo(guestMessageDto.getTitle());
        assertThat(savedGuestMessage.getContent()).isEqualTo(guestMessageDto.getContent());
        assertThat(savedGuestMessage.getAuthor()).isEqualTo(guestMessageDto.getAuthor());
        assertThat(savedGuestMessage.getPassword()).isEqualTo(guestMessageDto.getPassword());
    }

    @Test
    @DisplayName("방명록을 수정한다")
    void updateGuestMessage() {
        // given
        GuestMessageDto guestMessageDto = GuestMessageDto.builder()
                .title("title")
                .content("content")
                .author("author")
                .password("password")
                .build();
        GuestMessage guestMessage = guestMessageDto.toEntity();
        GuestMessage savedGuestMessage = guestMessageRepository.save(guestMessage);

        GuestMessageDto updateGuestMessageDto = GuestMessageDto.builder()
                .title("update title")
                .content("update content")
                .build();

        // when
        savedGuestMessage.update(updateGuestMessageDto.getTitle(), updateGuestMessageDto.getContent());
        GuestMessage updatedGuestMessage = guestMessageRepository.save(savedGuestMessage);

        // then
        assertThat(updatedGuestMessage.getTitle()).isEqualTo(updateGuestMessageDto.getTitle());
        assertThat(updatedGuestMessage.getContent()).isEqualTo(updateGuestMessageDto.getContent());
    }

    @Test
    @DisplayName("방명록을 삭제한다")
    void deleteGuestMessage() {
        // given
        GuestMessageDto guestMessageDto = GuestMessageDto.builder()
                .title("title")
                .content("content")
                .author("author")
                .password("password")
                .build();
        GuestMessage guestMessage = guestMessageDto.toEntity();
        GuestMessage savedGuestMessage = guestMessageRepository.save(guestMessage);

        // when
        guestMessageRepository.delete(savedGuestMessage);

        // then
        assertThat(guestMessageRepository.findById(savedGuestMessage.getId())).isEmpty();
    }

    @Test
    @DisplayName("방명록을 조회한다")
    void findGuestMessage() {
        // given
        GuestMessageDto guestMessageDto = GuestMessageDto.builder()
                .title("title")
                .content("content")
                .author("author")
                .password("password")
                .build();
        GuestMessage guestMessage = guestMessageDto.toEntity();
        GuestMessage savedGuestMessage = guestMessageRepository.save(guestMessage);

        // when
        GuestMessage findGuestMessage = guestMessageRepository.findById(savedGuestMessage.getId()).orElseThrow();

        // then
        assertThat(findGuestMessage.getId()).isEqualTo(savedGuestMessage.getId());
        assertThat(findGuestMessage.getTitle()).isEqualTo(savedGuestMessage.getTitle());
        assertThat(findGuestMessage.getContent()).isEqualTo(savedGuestMessage.getContent());
        assertThat(findGuestMessage.getAuthor()).isEqualTo(savedGuestMessage.getAuthor());
        assertThat(findGuestMessage.getPassword()).isEqualTo(savedGuestMessage.getPassword());
    }

    @Test
    @DisplayName("방명록을 전체 조회한다")
    void findAllGuestMessage() {
        // given
        GuestMessageDto guestMessageDto1 = GuestMessageDto.builder()
                .title("title1")
                .content("content1")
                .author("author1")
                .password("password1")
                .build();
        GuestMessage guestMessage1 = guestMessageDto1.toEntity();
        GuestMessage savedGuestMessage1 = guestMessageRepository.save(guestMessage1);

        GuestMessageDto guestMessageDto2 = GuestMessageDto.builder()
                .title("title2")
                .content("content2")
                .author("author2")
                .password("password2")
                .build();
        GuestMessage guestMessage2 = guestMessageDto2.toEntity();
        GuestMessage savedGuestMessage2 = guestMessageRepository.save(guestMessage2);

        // when
        Iterable<GuestMessage> guestMessages = guestMessageRepository.findAll();

        // then
        assertThat(guestMessages).hasSizeGreaterThan(2);
    }
}
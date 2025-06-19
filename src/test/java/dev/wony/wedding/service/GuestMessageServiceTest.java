package dev.wony.wedding.service;

import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.domain.GuestMessageDto;
import dev.wony.wedding.repository.GuestMessageRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.groups.Tuple.tuple;

@SpringBootTest
class GuestMessageServiceTest {

    @Autowired
    private GuestMessageRepository guestMessageRepository;
    private GuestMessage guestMessage;
    private GuestMessageDto guestMessageDto;

    @BeforeEach
    void setUp() {
        guestMessage = GuestMessage.builder()
                .id(1L)
                .title("title")
                .content("content")
                .author("author")
                .password("password")
                .build();

        guestMessageDto = GuestMessageDto.fromEntity(guestMessage);
    }

    @Test
    @DisplayName("방명록를 등록한다")
    void saveGuestMessage() {
        // given

        // when
        GuestMessage saveGuestMessage = guestMessageRepository.save(guestMessage);
        GuestMessageDto saveGuestMessageDto = GuestMessageDto.fromEntity(saveGuestMessage);

        // then
        assertThat(saveGuestMessageDto.getId()).isNotNull();
        assertThat(saveGuestMessageDto.getTitle()).isEqualTo(guestMessageDto.getTitle());
        assertThat(saveGuestMessageDto.getContent()).isEqualTo(guestMessageDto.getContent());
        assertThat(saveGuestMessageDto.getAuthor()).isEqualTo(guestMessageDto.getAuthor());
        assertThat(saveGuestMessageDto.getPassword()).isEqualTo(guestMessageDto.getPassword());
    }

    @Test
    @DisplayName("방명록을 수정한다")
    void updateGuestMessage() {
        // given
        GuestMessage savedGuestMessage = guestMessageRepository.save(guestMessage);
        GuestMessageDto updateGuestMessageDto = GuestMessageDto.builder()
                .title("update title")
                .content("update content")
                .author("update author")
                .password("update password")
                .build();

        // when
        GuestMessage findGuestMessage = guestMessageRepository.findById(savedGuestMessage.getId()).orElseThrow();
        findGuestMessage.update(updateGuestMessageDto.getTitle(), updateGuestMessageDto.getContent());
        GuestMessage updatedGuestMessage = guestMessageRepository.save(findGuestMessage);
        GuestMessageDto updateResultGuestMessageDto = GuestMessageDto.fromEntity(updatedGuestMessage);

        // then
        assertThat(updateResultGuestMessageDto.getId()).isEqualTo(savedGuestMessage.getId());
        assertThat(updateResultGuestMessageDto.getTitle()).isEqualTo(updateGuestMessageDto.getTitle());
        assertThat(updateResultGuestMessageDto.getContent()).isEqualTo(updateGuestMessageDto.getContent());
    }

    @Test
    @DisplayName("방명록을 삭제한다")
    void deleteGuestMessage() {
        // given
        GuestMessage saveGuestMessage = guestMessageRepository.save(guestMessage);
        GuestMessageDto saveGuestMessageDto = GuestMessageDto.fromEntity(saveGuestMessage);

        // when
        guestMessageRepository.deleteById(saveGuestMessageDto.getId());

        // then
        assertThat(guestMessageRepository.findById(saveGuestMessageDto.getId())).isEmpty();
    }

    @Test
    @DisplayName("리뷰를 조회한다")
    void getGuestMessage() {
        // given
        GuestMessage saveGuestMessage = guestMessageRepository.save(guestMessage);
        GuestMessageDto saveGuestMessageDto = GuestMessageDto.fromEntity(saveGuestMessage);

        // when
        GuestMessage findGuestMessage = guestMessageRepository.findById(saveGuestMessageDto.getId()).orElseThrow();
        GuestMessageDto findGuestMessageDto = GuestMessageDto.fromEntity(findGuestMessage);

        // then
        assertThat(findGuestMessageDto.getId()).isEqualTo(saveGuestMessageDto.getId());
        assertThat(findGuestMessageDto.getTitle()).isEqualTo(saveGuestMessageDto.getTitle());
        assertThat(findGuestMessageDto.getContent()).isEqualTo(saveGuestMessageDto.getContent());
        assertThat(findGuestMessageDto.getAuthor()).isEqualTo(saveGuestMessageDto.getAuthor());
        assertThat(findGuestMessageDto.getPassword()).isEqualTo(saveGuestMessageDto.getPassword());
    }

    @Test
    @DisplayName("리뷰를 전체 조회한다")
    void getGuestMessages() {
        // given
        guestMessageRepository.deleteAll();
        GuestMessageDto GuestMessage2 = GuestMessageDto.builder()
                .title("title2")
                .content("content2")
                .author("author2")
                .password("password2")
                .build();

        GuestMessage saveGuestMessage = guestMessageRepository.save(guestMessage);
        GuestMessageDto saveGuestMessageDto = GuestMessageDto.fromEntity(saveGuestMessage);
        GuestMessage saveGuestMessage2 = guestMessageRepository.save(GuestMessage2.toEntity());
        GuestMessageDto saveGuestMessageDto2 = GuestMessageDto.fromEntity(saveGuestMessage2);

        // when
        List<GuestMessage> guestMessages = guestMessageRepository.findAll();
        List<GuestMessageDto> guestMessageDtos = guestMessages.stream()
                .map(GuestMessageDto::fromEntity)
                .toList();

        // then
        assertThat(guestMessageDtos).hasSize(2)
                .extracting("title", "content")
                .containsExactlyInAnyOrder(
                        tuple(saveGuestMessageDto.getTitle(), saveGuestMessageDto.getContent()),
                        tuple(saveGuestMessageDto2.getTitle(), saveGuestMessageDto2.getContent())
                );
    }

}
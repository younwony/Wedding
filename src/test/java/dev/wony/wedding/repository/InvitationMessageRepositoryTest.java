package dev.wony.wedding.repository;

import dev.wony.wedding.domain.InvitationMessage;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
@Transactional
class InvitationMessageRepositoryTest {

    @Autowired
    private InvitationMessageRepository invitationMessageRepository;

    @Test
    @DisplayName("초대 메시지를 저장한다")
    void saveInvitationMessage() {
        // given
        InvitationMessage invitationMessage = InvitationMessage.builder()
                .target("groom")
                .message("신랑 메시지입니다.")
                .thanksTo("부모님께 감사드립니다.")
                .build();

        // when
        InvitationMessage savedMessage = invitationMessageRepository.save(invitationMessage);

        // then
        assertThat(savedMessage.getId()).isNotNull();
        assertThat(savedMessage.getTarget()).isEqualTo("groom");
        assertThat(savedMessage.getMessage()).isEqualTo("신랑 메시지입니다.");
        assertThat(savedMessage.getThanksTo()).isEqualTo("부모님께 감사드립니다.");
    }

    @Test
    @DisplayName("target으로 초대 메시지를 조회한다")
    void findByTarget() {
        // given
        InvitationMessage invitationMessage = InvitationMessage.builder()
                .target("bride")
                .message("신부 메시지입니다.")
                .thanksTo("모든 분들께 감사드립니다.")
                .build();
        invitationMessageRepository.save(invitationMessage);

        // when
        Optional<InvitationMessage> foundMessage = invitationMessageRepository.findByTarget("bride");

        // then
        assertThat(foundMessage).isPresent();
        assertThat(foundMessage.get().getTarget()).isEqualTo("bride");
        assertThat(foundMessage.get().getMessage()).isEqualTo("신부 메시지입니다.");
    }

    @Test
    @DisplayName("존재하지 않는 target으로 조회시 빈 Optional을 반환한다")
    void findByTarget_NotFound() {
        // when
        Optional<InvitationMessage> foundMessage = invitationMessageRepository.findByTarget("notexist");

        // then
        assertThat(foundMessage).isEmpty();
    }

    @Test
    @DisplayName("초대 메시지를 삭제한다")
    void deleteInvitationMessage() {
        // given
        InvitationMessage invitationMessage = InvitationMessage.builder()
                .target("guest")
                .message("게스트 메시지입니다.")
                .thanksTo("감사합니다.")
                .build();
        InvitationMessage savedMessage = invitationMessageRepository.save(invitationMessage);

        // when
        invitationMessageRepository.delete(savedMessage);

        // then
        assertThat(invitationMessageRepository.findById(savedMessage.getId())).isEmpty();
    }
}

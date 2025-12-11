package dev.wony.wedding.service;

import dev.wony.wedding.domain.InvitationMessageDto;
import dev.wony.wedding.repository.InvitationMessageRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
public class InvitationMessageService {

    private final InvitationMessageRepository invitationMessageRepository;

    public InvitationMessageDto getInvitationMessage(String target) {
        return invitationMessageRepository.findByTarget(target)
                .map(InvitationMessageDto::fromEntity)
                .orElseGet(InvitationMessageDto::empty);
    }
}

package dev.wony.wedding.service;

import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.domain.GuestMessageDto;
import dev.wony.wedding.domain.InvitationMessageDto;
import dev.wony.wedding.dto.DeleteGuestMessageDto;
import dev.wony.wedding.repository.GuestMessageRepository;
import dev.wony.wedding.repository.InvitationMessageRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
public class InvitationMessageService {

    private final InvitationMessageRepository invitationMessageRepository;

    public InvitationMessageDto getInvitationMessage(String target) {
        return invitationMessageRepository.findByTarget(target)
                .map(InvitationMessageDto::from)
                .orElseGet(InvitationMessageDto::empty);
    }
}

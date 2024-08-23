package dev.wony.wedding.service;

import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.dto.DeleteGuestMessageDto;
import dev.wony.wedding.domain.GuestMessageDto;
import dev.wony.wedding.repository.GuestMessageRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
public class GuestMessageService {

    private final GuestMessageRepository guestMessageRepository;

    public Page<GuestMessageDto> getGuestMessages(Pageable pageable) {
        return guestMessageRepository.findAll(pageable)
                .map(GuestMessageDto::fromEntity);

    }

    public GuestMessageDto createGuestMessage(GuestMessageDto guestMessageDto) {
        return GuestMessageDto.fromEntity(guestMessageRepository.save(guestMessageDto.toEntity()));
    }

    public GuestMessageDto updateGuestMessage(Long id, GuestMessageDto guestMessageDto) {
        return guestMessageRepository.findById(id)
                .map(guestMessage -> {
                    guestMessage.update(guestMessageDto.getTitle(), guestMessageDto.getContent());
                    return GuestMessageDto.fromEntity(guestMessage);
                })
                .orElseThrow(() -> new IllegalArgumentException("해당 리뷰가 존재하지 않습니다."));
    }

    public void deleteGuestMessage(Long id, DeleteGuestMessageDto deleteGuestMessageDto) {
        GuestMessage guestMessage = guestMessageRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 리뷰가 존재하지 않습니다."));

        if (!guestMessage.getPassword().equals(deleteGuestMessageDto.getPassword())) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }

        guestMessageRepository.deleteById(id);
    }
}

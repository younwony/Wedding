package dev.wony.wedding.service;

import dev.wony.wedding.dto.GuestMessageDto;
import dev.wony.wedding.repository.GuestMessageRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class GuestMessageService {

    private final GuestMessageRepository guestMessageRepository;

    public List<GuestMessageDto> getGuestMessages() {
        return guestMessageRepository.findAll().stream()
                .map(GuestMessageDto::fromEntity)
                .toList();

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

    public void deleteGuestMessage(Long id) {
        guestMessageRepository.deleteById(id);
    }
}

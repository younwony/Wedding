package dev.wony.wedding.service;

import dev.wony.wedding.domain.GuestMessage;
import dev.wony.wedding.domain.GuestMessageDto;
import dev.wony.wedding.repository.GuestMessageRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor
public class GuestMessageService {

    private final GuestMessageRepository guestMessageRepository;
    private final PasswordEncoder passwordEncoder;

    public Page<GuestMessageDto> getGuestMessages(Pageable pageable) {
        return guestMessageRepository.findAll(pageable)
                .map(GuestMessageDto::fromEntity);
    }

    public GuestMessageDto createGuestMessage(GuestMessageDto guestMessageDto) {
        String encodedPassword = passwordEncoder.encode(guestMessageDto.getPassword());
        GuestMessageDto encodedDto = GuestMessageDto.builder()
                .title(guestMessageDto.getTitle())
                .content(guestMessageDto.getContent())
                .author(guestMessageDto.getAuthor())
                .password(encodedPassword)
                .build();
        return GuestMessageDto.fromEntity(guestMessageRepository.save(encodedDto.toEntity()));
    }

    public GuestMessageDto updateGuestMessage(Long id, GuestMessageDto guestMessageDto) {
        GuestMessage guestMessage = guestMessageRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 메시지가 존재하지 않습니다."));

        validatePassword(guestMessageDto.getPassword(), guestMessage.getPassword());

        guestMessage.update(guestMessageDto.getTitle(), guestMessageDto.getContent());
        return GuestMessageDto.fromEntity(guestMessage);
    }

    public void deleteGuestMessage(Long id, String rawPassword) {
        GuestMessage guestMessage = guestMessageRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("해당 메시지가 존재하지 않습니다."));

        validatePassword(rawPassword, guestMessage.getPassword());

        guestMessageRepository.deleteById(id);
    }

    private void validatePassword(String rawPassword, String encodedPassword) {
        if (!passwordEncoder.matches(rawPassword, encodedPassword)) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }
    }
}

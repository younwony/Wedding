package dev.wony.wedding.controller.api;

import dev.wony.wedding.request.DeleteGuestMessageRequest;
import dev.wony.wedding.domain.GuestMessageDto;
import dev.wony.wedding.request.GuestMessageRequest;
import dev.wony.wedding.response.GuestMessageResponse;
import dev.wony.wedding.response.GuestMessageResponses;
import dev.wony.wedding.service.GuestMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/guest-messages")
public class GuestMessageController {

    private final GuestMessageService guestMessageService;

    @GetMapping
    public ResponseEntity<GuestMessageResponses> getGuestMessages(Pageable pageable) {
        Page<GuestMessageDto> guestMessages = guestMessageService.getGuestMessages(pageable);
        GuestMessageResponses guestMessageResponses = GuestMessageResponses.fromDto(guestMessages.getContent(), guestMessages.getTotalPages());
        return ResponseEntity.ok(guestMessageResponses);
    }

    @PostMapping
    public ResponseEntity<GuestMessageResponse> createGuestMessage(@RequestBody GuestMessageRequest guestMessageRequest) {
        GuestMessageDto guestMessageDto = guestMessageService.createGuestMessage(guestMessageRequest.toDto());
        GuestMessageResponse guestMessageResponse = GuestMessageResponse.fromDto(guestMessageDto);
        return ResponseEntity.ok(guestMessageResponse);
    }

    @PutMapping("/{id}")
    public ResponseEntity<GuestMessageResponse> updateGuestMessage(@PathVariable("id") Long id, @RequestBody GuestMessageRequest guestMessageRequest) {
        GuestMessageDto guestMessageDto = guestMessageService.updateGuestMessage(id, guestMessageRequest.toDto());
        GuestMessageResponse guestMessageResponse = GuestMessageResponse.fromDto(guestMessageDto);
        return ResponseEntity.ok(guestMessageResponse);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteGuestMessage(@PathVariable("id") Long id, @RequestBody DeleteGuestMessageRequest deleteGuestMessageRequest) {
        guestMessageService.deleteGuestMessage(id, deleteGuestMessageRequest.toDto());
        return ResponseEntity.noContent().build();
    }
}

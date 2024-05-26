package dev.wony.wedding.controller.api;

import dev.wony.wedding.dto.GuestMessageDto;
import dev.wony.wedding.request.GuestMessageRequest;
import dev.wony.wedding.response.GuestMessageResponse;
import dev.wony.wedding.service.GuestMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/guest-messages")
public class GuestMessageController {

    private final GuestMessageService guestMessageService;
    @GetMapping
    public ResponseEntity<List<GuestMessageResponse>> getGuestMessages() {
        List<GuestMessageResponse> guestMessageRespons = guestMessageService.getGuestMessages().stream()
                .map(GuestMessageResponse::fromDto)
                .toList();
        return ResponseEntity.ok(guestMessageRespons);
    }

    @PostMapping
    public ResponseEntity<GuestMessageResponse> createGuestMessage(@RequestBody GuestMessageRequest guestMessageRequest) {
        GuestMessageDto guestMessageDto = guestMessageService.createGuestMessage(guestMessageRequest.toDto());
        GuestMessageResponse guestMessageResponse = GuestMessageResponse.fromDto(guestMessageDto);
        return ResponseEntity.ok(guestMessageResponse);
    }

    @PutMapping("/{id}")
    public ResponseEntity<GuestMessageResponse> updateGuestMessage(@PathVariable Long id, @RequestBody GuestMessageRequest guestMessageRequest) {
        GuestMessageDto guestMessageDto = guestMessageService.updateGuestMessage(id, guestMessageRequest.toDto());
        GuestMessageResponse guestMessageResponse = GuestMessageResponse.fromDto(guestMessageDto);
        return ResponseEntity.ok(guestMessageResponse);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteGuestMessage(@PathVariable Long id) {
        guestMessageService.deleteGuestMessage(id);
        return ResponseEntity.noContent().build();
    }
}

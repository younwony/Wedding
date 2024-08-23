package dev.wony.wedding.response;

import dev.wony.wedding.domain.GuestMessageDto;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GuestMessageResponse {

    private Long id;
    private String title;
    private String content;
    private String author;
    private String password;
    private String createdAt;

    public static GuestMessageResponse fromDto(GuestMessageDto guestMessageDto) {
        return GuestMessageResponse.builder()
                .id(guestMessageDto.getId())
                .title(guestMessageDto.getTitle())
                .content(guestMessageDto.getContent())
                .author(guestMessageDto.getAuthor())
                .password(guestMessageDto.getPassword())
                .createdAt(guestMessageDto.getCreatedAt())
                .build();
    }
}

package dev.wony.wedding.response;

import dev.wony.wedding.domain.GuestMessageDto;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class GuestMessageResponse {

    private final Long id;
    private final String title;
    private final String content;
    private final String author;
    private final String createdAt;

    public static GuestMessageResponse from(GuestMessageDto dto) {
        return GuestMessageResponse.builder()
                .id(dto.getId())
                .title(dto.getTitle())
                .content(dto.getContent())
                .author(dto.getAuthor())
                .createdAt(dto.getCreatedAt())
                .build();
    }
}

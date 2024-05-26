package dev.wony.wedding.dto;

import dev.wony.wedding.domain.GuestMessage;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GuestMessageDto {

    private Long id;
    private String title;
    private String content;
    private String author;
    private String password;

    public static GuestMessageDto fromEntity(GuestMessage guestMessage) {
        return GuestMessageDto.builder()
                .id(guestMessage.getId())
                .title(guestMessage.getTitle())
                .content(guestMessage.getContent())
                .author(guestMessage.getAuthor())
                .password(guestMessage.getPassword())
                .build();
    }

    public GuestMessage toEntity() {
        return GuestMessage.builder()
                .id(this.id)
                .title(this.title)
                .content(this.content)
                .author(this.author)
                .password(this.password)
                .build();
    }
}

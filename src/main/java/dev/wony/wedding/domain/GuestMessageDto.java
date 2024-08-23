package dev.wony.wedding.domain;

import lombok.Builder;
import lombok.Data;

import java.time.format.DateTimeFormatter;
import java.util.Objects;

@Data
@Builder
public class GuestMessageDto {

    private Long id;
    private String title;
    private String content;
    private String author;
    private String password;
    private String createdAt;
    private String updatedAt;

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public static GuestMessageDto fromEntity(GuestMessage guestMessage) {

        String createdDate = "";
        String updatedDate = "";
        if(Objects.nonNull(guestMessage.getCreatedAt())) {
            createdDate = guestMessage.getCreatedAt().format(DATE_TIME_FORMATTER);
        }
        if(Objects.nonNull(guestMessage.getUpdatedAt())) {
            updatedDate = guestMessage.getUpdatedAt().format(DATE_TIME_FORMATTER);
        }


        return GuestMessageDto.builder()
                .id(guestMessage.getId())
                .title(guestMessage.getTitle())
                .content(guestMessage.getContent())
                .author(guestMessage.getAuthor())
                .password(guestMessage.getPassword())
                .createdAt(createdDate)
                .updatedAt(updatedDate)
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

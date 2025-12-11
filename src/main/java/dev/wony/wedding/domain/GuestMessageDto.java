package dev.wony.wedding.domain;

import lombok.Builder;
import lombok.Getter;

import java.time.format.DateTimeFormatter;
import java.util.Objects;

@Getter
@Builder
public class GuestMessageDto {

    private final Long id;
    private final String title;
    private final String content;
    private final String author;
    private final String password;
    private final String createdAt;
    private final String updatedAt;

    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    public static GuestMessageDto fromEntity(GuestMessage entity) {
        String createdDate = "";
        String updatedDate = "";

        if (Objects.nonNull(entity.getCreatedAt())) {
            createdDate = entity.getCreatedAt().format(DATE_TIME_FORMATTER);
        }
        if (Objects.nonNull(entity.getUpdatedAt())) {
            updatedDate = entity.getUpdatedAt().format(DATE_TIME_FORMATTER);
        }

        return GuestMessageDto.builder()
                .id(entity.getId())
                .title(entity.getTitle())
                .content(entity.getContent())
                .author(entity.getAuthor())
                .password(entity.getPassword())
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

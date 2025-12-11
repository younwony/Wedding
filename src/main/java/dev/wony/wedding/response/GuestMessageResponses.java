package dev.wony.wedding.response;

import dev.wony.wedding.domain.GuestMessageDto;
import lombok.Builder;
import lombok.Getter;

import java.util.List;

@Getter
@Builder
public class GuestMessageResponses {

    private final List<GuestMessageResponse> content;
    private final int totalPages;

    public static GuestMessageResponses fromDto(List<GuestMessageDto> dtos, int totalPages) {
        return GuestMessageResponses.builder()
                .content(dtos.stream()
                        .map(GuestMessageResponse::from)
                        .toList())
                .totalPages(totalPages)
                .build();
    }
}

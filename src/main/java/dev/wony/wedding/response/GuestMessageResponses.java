package dev.wony.wedding.response;

import dev.wony.wedding.domain.GuestMessageDto;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Data
@Builder
public class GuestMessageResponses {

    private List<GuestMessageResponse> content;
    private int totalPages;

    public static GuestMessageResponses fromDto(List<GuestMessageDto> guestMessageDtos, int totalPages) {
        return GuestMessageResponses.builder()
                .content(guestMessageDtos.stream()
                        .map(GuestMessageResponse::fromDto)
                        .toList())
                .totalPages(totalPages)
                .build();
    }
}

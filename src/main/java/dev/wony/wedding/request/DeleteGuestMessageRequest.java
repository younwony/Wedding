package dev.wony.wedding.request;

import dev.wony.wedding.dto.DeleteGuestMessageDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DeleteGuestMessageRequest {
    private String author;
    private String password;

    public DeleteGuestMessageDto toDto() {
        return DeleteGuestMessageDto.builder()
                .author(this.author)
                .password(this.password)
                .build();
    }
}

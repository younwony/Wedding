package dev.wony.wedding.request;


import dev.wony.wedding.domain.GuestMessageDto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GuestMessageRequest {

    private String title;
    private String content;
    private String author;
    private String password;

    public GuestMessageDto toDto() {
        return GuestMessageDto.builder()
                .title(this.title)
                .content(this.content)
                .author(this.author)
                .password(this.password)
                .build();
    }
}

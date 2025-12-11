package dev.wony.wedding.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InvitationMessageDto {

    private Long id;
    private String target;
    private String message;
    private String thanksTo;

    public static InvitationMessageDto fromEntity(InvitationMessage entity) {
        return InvitationMessageDto.builder()
                .id(entity.getId())
                .target(entity.getTarget())
                .message(entity.getMessage())
                .thanksTo(entity.getThanksTo())
                .build();
    }

    public static InvitationMessageDto empty() {
        return InvitationMessageDto.builder()
                .id(0L)
                .target("")
                .message("")
                .thanksTo("")
                .build();
    }

    public InvitationMessage toEntity() {
        return InvitationMessage.builder()
                .id(this.id)
                .target(this.target)
                .message(this.message)
                .thanksTo(this.thanksTo)
                .build();
    }
}

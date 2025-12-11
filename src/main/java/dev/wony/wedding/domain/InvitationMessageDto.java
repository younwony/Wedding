package dev.wony.wedding.domain;

import lombok.*;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class InvitationMessageDto {

    private Long id;
    private String target;
    private String message;
    private String thanksTo;

    public static InvitationMessageDto from(InvitationMessage invitationMessage) {
        return InvitationMessageDto.builder()
                .id(invitationMessage.getId())
                .target(invitationMessage.getTarget())
                .message(invitationMessage.getMessage())
                .thanksTo(invitationMessage.getThanksTo())
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

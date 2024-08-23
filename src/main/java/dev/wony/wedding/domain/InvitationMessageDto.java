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

    public static InvitationMessageDto from(InvitationMessage invitationMessage) {
        return InvitationMessageDto.builder()
                .id(invitationMessage.getId())
                .target(invitationMessage.getTarget())
                .message(invitationMessage.getMessage())
                .build();
    }

    public static InvitationMessageDto empty() {
        return InvitationMessageDto.builder()
                .id(0L)
                .target("")
                .message("")
                .build();
    }
}

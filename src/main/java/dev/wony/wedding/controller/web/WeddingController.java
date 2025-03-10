package dev.wony.wedding.controller.web;

import dev.wony.wedding.domain.InvitationMessageDto;
import dev.wony.wedding.service.InvitationMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class WeddingController {

    private final InvitationMessageService invitationMessageService;

    @GetMapping("/")
    public String index(
            @RequestParam(value = "target", required = false) String target,
            Model model
    ) {
        InvitationMessageDto invitationMessage = invitationMessageService.getInvitationMessage(target);
        model.addAttribute("invitationMessage", invitationMessage);
        return "index";
    }
}

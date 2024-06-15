package dev.wony.wedding.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WeddingController {

    @GetMapping("/wedding")
    public String index() {
        return "index";
    }
}

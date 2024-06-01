package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DemoController {

    @GetMapping("/api/test")
    public String testEndpoint() {
        String str = "Welcome to Spring Application";
        return str;
    }

}

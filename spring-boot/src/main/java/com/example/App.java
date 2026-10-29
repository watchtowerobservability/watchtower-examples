package com.example;

import io.watchtower.Watchtower;
import java.util.Map;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class App {
  public static void main(String[] args) {
    Watchtower.init(new Watchtower.Options()
        .apiKey(System.getenv("WT_INGEST_KEY"))
        .serviceName(System.getenv().getOrDefault("WT_SERVICE", "spring-boot-example")));
    SpringApplication.run(App.class, args);
  }

  @GetMapping("/hello")
  Map<String, String> hello() {
    return Map.of("hello", "watchtower");
  }

  @GetMapping("/boom")
  String boom() {
    throw new IllegalStateException("boom from the Spring Boot example");
  }
}

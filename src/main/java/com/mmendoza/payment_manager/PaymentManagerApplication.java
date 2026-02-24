package com.mmendoza.payment_manager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
@RequestMapping("/api/v1/payments")
public class PaymentManagerApplication {

	public static void main(String[] args) {
		SpringApplication.run(PaymentManagerApplication.class, args);
	}

	@GetMapping("/hello")
	public ResponseEntity<String> hello() {
		return ResponseEntity.ok("Hello, Payment Manager!");
	}
}

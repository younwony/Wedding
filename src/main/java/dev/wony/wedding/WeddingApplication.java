package dev.wony.wedding;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@EnableEncryptableProperties
public class WeddingApplication {

    public static void main(String[] args) {
        SpringApplication.run(WeddingApplication.class, args);
    }

}

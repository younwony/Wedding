package dev.wony.wedding.config;

import org.jasypt.encryption.StringEncryptor;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class JasyptConfigTest {

    @Autowired
    private StringEncryptor jasyptStringEncryptor;

    @Test
    @DisplayName("암호를 구한다.")
    void encrypt() {
        // given
        // when
        String wedding = jasyptStringEncryptor.encrypt("test");

        // then
    }
}

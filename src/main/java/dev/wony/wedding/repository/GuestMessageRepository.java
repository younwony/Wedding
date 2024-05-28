package dev.wony.wedding.repository;

import dev.wony.wedding.domain.GuestMessage;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GuestMessageRepository extends JpaRepository<GuestMessage, Long> {
}

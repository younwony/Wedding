package dev.wony.wedding.repository;

import dev.wony.wedding.domain.InvitationMessage;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface InvitationMessageRepository extends JpaRepository<InvitationMessage, Long> {

    Optional<InvitationMessage> findByTarget(String target);
}

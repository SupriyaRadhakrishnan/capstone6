package co.grandcircus.TaskTracker;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserInformationRepository extends JpaRepository<UserInformation, Long>{
	
	UserInformation findByEmail(String email);

}

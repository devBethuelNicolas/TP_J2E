package dao;

/**
 * Created by karakakou on 23/05/17.
 */
import entities.Role;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository("roleRepository")
public interface IRoleRepository extends CrudRepository<Role, Integer> {
        Role findByRole(String role);
        void deleteById(int id);
}

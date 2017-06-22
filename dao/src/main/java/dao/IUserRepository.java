package dao;
/**
 * Created by karakakou on 16/05/17.
 */
import com.sun.xml.internal.bind.v2.model.core.ID;
import entities.Users;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository("userRepository")
public interface IUserRepository extends CrudRepository<Users, Integer> {
    Users findByName(String name);
    Users findOne(Integer integer);

    void delete(Users user);
}

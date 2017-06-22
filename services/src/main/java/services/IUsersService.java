package services;

/**
 * Created by karakakou on 23/05/17.
 */
import entities.Users;

import java.util.List;

public interface IUsersService {
       public Users findByName(String name);
       public void saveUser(Users user);
       public List<Users> findAllUser();
      // public void deleteUserById(int id);
}

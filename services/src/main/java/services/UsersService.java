package services;

/**
 * Created by karakakou on 23/05/17.
 */


import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import dao.IRoleRepository;
import dao.IUserRepository;
import entities.Role;
import entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;



@Service("UserService")
public class UsersService implements IUsersService{

    @Autowired
    private IUserRepository userRepository;
    @Autowired
    private IRoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public Users findByName(String name) {
        return userRepository.findByName(name);
    }

    public Users findOne(int id ) { return userRepository.findOne(id);}
    public void delete(Users user ){
        userRepository.delete(user);};

    @Override
    public void saveUser(Users user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role userRole = roleRepository.findByRole("ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    @Override
    public List<Users> findAllUser (){
        return (List<Users>) userRepository.findAll();
    }


   /* @Override
    public void deleteUserById (int id) {
        userRepository.delete(id);
    }
*/
}
package controller;

import entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import services.UsersService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

/**
 * Created by Nico on 09/02/2016.
 */
@Controller
public class IndexController {

    @Autowired
    private UsersService userService;


    @RequestMapping(value ={"/","/login"},method = RequestMethod.GET)
    public ModelAndView indexView(){
        ModelAndView model = new ModelAndView("index");
        model.addObject("message","Hello world from indexCOntroller -> ");
        return model;
    }
    @RequestMapping(value ={"/error"},method = RequestMethod.GET)
    public ModelAndView failView(){
        ModelAndView model = new ModelAndView("error");
        model.addObject("message","Whoops ! Seems it failed... ");
        return model;
    }

    @RequestMapping(value="/registration", method = RequestMethod.GET)
    public ModelAndView registration(){
        ModelAndView modelAndView = new ModelAndView();
        Users user = new Users();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("registration");
        return modelAndView;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public ModelAndView createNewUser(@Valid Users user, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();
        Users userExists = userService.findByName(user.getName());


        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the email provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("registration");
        } else {
            userService.saveUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new Users());
            modelAndView.setViewName("registration");
        }
        return modelAndView;
    }

   @RequestMapping(value={"/admin/home","/admin/home/edit"}, method = RequestMethod.GET)
   public ModelAndView home(@RequestParam(required = false, defaultValue = "0" , name = "id") int id){
        ModelAndView modelAndView = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users user = userService.findByName(auth.getName());
        List<Users> users = userService.findAllUser();

        /*if( id > 0 ){
            userService.deleteUserById(id);
        }*/

        //System.out.println("\n\n\nURL "+id+"\n\n\n");


        modelAndView.addObject("userList",users);
        modelAndView.addObject("userName", "Welcome " + user.getName() + " " + user.getLastName() + " (" + user.getEmail() + ")");
        modelAndView.addObject("adminMessage","Content Available Only for Users with Admin Role");

        modelAndView.setViewName("admin/home");

        return modelAndView;
    }

    @RequestMapping(value="/admin/home/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(required = true, name = "id") int id){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users userConnected = userService.findByName(auth.getName());
        ModelAndView modelAndView = new ModelAndView();
        Users user = new Users();
        user = userService.findOne(id);
        userService.delete(user);
       // modelAndView.setViewName("admin/home");

        return home(userConnected.getId());
    }


}

package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.UsersService;

/**
 * Created by karakakou on 23/05/17.
 */
public class AdminController {

    @Autowired
    private UsersService userService;

    @RequestMapping(value ={"/admin/home/delete"},method = RequestMethod.GET)
    public ModelAndView quest(){
        ModelAndView model = new ModelAndView("quest");
        return model;
    }
}

package controller;

import entities.Response;
import entities.Survey;
import entities.Users;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import services.ResponseService;
import services.SurveyService;
import services.UsersService;

import javax.jws.WebParam;
import javax.validation.Valid;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by nbethuel on 24/05/2017.
 */
@Controller
public class SurveyController  {
    @Autowired
    private SurveyService surveyService;
    @Autowired
    private UsersService userService;
    @Autowired
    private ResponseService responseService;

    @RequestMapping(value ="/survey/home",method = RequestMethod.GET)
    public ModelAndView indexView(){
        ModelAndView model = new ModelAndView("survey/index");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users user = userService.findByName(auth.getName());

        System.out.println("HELLO "+ user.getName());
        model.addObject("userName",   user.getName() + " " + user.getLastName() );


        List<Survey> surveys = surveyService.findAllSurvey();
//        if(surveys.size() != 0 ){
//
//            for (Survey survey : surveys) {
//                System.out.println("Id survey : "+ survey.getId());
//                System.out.println("Question : " + survey.getQuestion());
//
//                for (Response response : survey.getResponses()) {
//                    System.out.println("Id response : "+ response.getId());
//                    System.out.println("Answer : " + response.getAnswer());
//                }
//            }
//        }

        model.addObject("surveyList",surveys);
        return model;
    }


    @RequestMapping(value = "/survey/home/add", method = RequestMethod.POST)
    public ModelAndView createNewSurvey(@Valid Survey survey, BindingResult bindingResult) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.setViewName("/survey/registration");

        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("/survey/registration");
        } else {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Users user = userService.findByName(auth.getName());
            survey.setCreator(user);
            System.out.println("User is : "+ user.getName());

            surveyService.save(survey);
            modelAndView.addObject("successMessage", "Survey has been registered successfully");
            modelAndView.setViewName("/survey/registration");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/survey/home/add", method = RequestMethod.GET)
    public ModelAndView getView(@Valid Survey survey, BindingResult bindingResult) {

        return new ModelAndView("/survey/registration");
    }

    @RequestMapping(value="/survey/home/delete", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam(required = true , name = "id") int id){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users userConnected = userService.findByName(auth.getName());
        ModelAndView modelAndView = new ModelAndView();
        Survey survey = new Survey();
        survey = surveyService.findOne(id);
        surveyService.delete(survey);
        modelAndView.setViewName("survey/index");

        return indexView();
    }
    @RequestMapping(value="/survey/home/addAnswer", method = RequestMethod.GET)
    public ModelAndView viewAddAnswer(@RequestParam(required = true , name = "id") int id){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users userConnected = userService.findByName(auth.getName());
        ModelAndView modelAndView = new ModelAndView();
        Survey survey = surveyService.findOne(id);
        modelAndView.addObject(survey);
        modelAndView.setViewName("/survey/answers");
        return modelAndView;
    }

    @RequestMapping(value="/survey/home/addAnswer", method = RequestMethod.POST)
    public ModelAndView addAnswer(@RequestParam(required = true , name = "id") int id,@RequestParam(value = "answers[]") String[] answers){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users userConnected = userService.findByName(auth.getName());
        ModelAndView modelAndView = new ModelAndView();
        Set<Response> responses = new HashSet<>();
        for(String answer : answers) {
            Response response = new Response();
            response.setAnswer(answer);
            responses.add(response);
        }
        Survey survey = surveyService.findOne(id);
        survey.setResponses(responses);
        surveyService.save(survey);

        modelAndView.setViewName("/survey/home");
        return modelAndView;
    }


}

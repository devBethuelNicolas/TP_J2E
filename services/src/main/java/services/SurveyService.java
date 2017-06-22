package services;

import dao.IResponseRepository;
import dao.IRoleRepository;
import dao.ISurveyRepository;
import entities.Response;
import entities.Role;
import entities.Survey;
import entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

/**
 * Created by nbethuel on 24/05/2017.
 */
@Service("SurveyService")
public class SurveyService implements ISurveyService {

    @Autowired
    private IResponseRepository responseRepository;
    @Autowired
    private ISurveyRepository surveyRepository;
    @Override
    public void save(Survey survey) {
        if(survey.getResponses().size() >0 ){
            for (Response response : survey.getResponses()) {
                responseRepository.save(response);
            }
        }
        surveyRepository.save(survey);
    }
    @Override
    public List<Survey> findAllSurvey (){
        List<Survey> result = (List<Survey>)surveyRepository.findAll();
        result.stream().forEach(x -> x.getResponses().size());
        return result;
    }
    public Survey findOne(int id ) { return surveyRepository.findOne(id);}
    public void delete(Survey survey ){
        if(survey.getResponses().size() >0 ){
            for (Response response : survey.getResponses()) {
                responseRepository.delete(response);
            }
        }
        surveyRepository.delete(survey);
    };

}

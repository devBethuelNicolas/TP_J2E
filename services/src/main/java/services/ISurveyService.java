package services;

import entities.Survey;

import java.util.List;

/**
 * Created by nbethuel on 24/05/2017.
 */
public interface ISurveyService  {

    public void save(Survey survey);

    public List<Survey> findAllSurvey();

}

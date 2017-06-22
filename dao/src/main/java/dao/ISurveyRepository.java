package dao;

import entities.Survey;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by nbethuel on 24/05/2017.
 */
@Repository("surveyRepository")
public interface ISurveyRepository extends CrudRepository<Survey, Integer > {

     Survey findSurveyById(int id );
     Survey save (Survey survey);
     Survey findOne(Integer integer);
     void delete(Survey survey);



}

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
import java.util.HashSet;
import java.util.List;

/**
 * Created by nbethuel on 24/05/2017.
 */
@Service("ResponseService")
public class ResponseService implements IResponseService {


    @Autowired
    private IResponseRepository responseRepository;
    @Override
    public void save(Response response) {
        responseRepository.save(response);
    }
    @Override
    public List<Response> findAllResponse (){
        return (List<Response>) responseRepository.findAll();
    }
    public Response findOne(int id ) { return responseRepository.findOne(id);}
    public void delete(Response response ){responseRepository.delete(response);};

}

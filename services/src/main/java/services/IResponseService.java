package services;

import entities.Response;
import entities.Survey;

import java.util.List;

/**
 * Created by nbethuel on 20/06/2017.
 */
public interface IResponseService {
    public void save(Response response);

    public List<Response> findAllResponse();

}

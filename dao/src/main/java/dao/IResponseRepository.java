package dao;

import entities.Response;
import entities.Survey;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by nbethuel on 20/06/2017.
 */
@Repository("responseRepository")
public interface IResponseRepository extends CrudRepository<Response, Integer> {
    Response findResponseById(int id );
    Response save (Response response);
    Response findOne(Integer integer);
    Response findByAnswer(String answer);

    void delete(Response response);

}

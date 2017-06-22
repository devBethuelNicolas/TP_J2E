package entities;

import org.springframework.security.access.method.P;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

/**
 * Created by nbethuel on 24/05/2017.
 */
@Entity
@Table(name = "survey")
public class Survey {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "survey_id")
    private int id ;

    @Column(name = "date_begin")
    private Date dateBegin;
    @Column(name = "date_end")
    private Date dateEnd;
    @Column(name = "question")
    private String Question;
    @OneToMany(targetEntity = Response.class)
    @JoinColumn(name = "survey_id")
    private Set<Response> responses;
   public Set<Response> getResponses() {
        return responses;
    }

    public void setResponses(Set<Response> responses) {
        this.responses = responses;
    }
    public void setOneResponse(Response response){
       this.responses.add(response);
    }


    @ManyToOne(targetEntity = Users.class)
    private Users creator ;

    public Users getCreator() {return creator;}

    public void setCreator(Users creator) {this.creator = creator;}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateBegin() {
        return dateBegin;
    }

    public void setDateBegin(Date dateBegin) {
        this.dateBegin = dateBegin;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String question) {
        Question = question;
    }
}

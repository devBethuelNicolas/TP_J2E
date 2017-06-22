package entities;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.annotation.Transient;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by nbethuel on 20/06/2017.
 */
@Entity
@Table(name = "response")
public class Response {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "response_id")
    private int id;
    @Column(name = "answer")
    private String answer;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @OneToOne(targetEntity = Survey.class)
   @JoinColumn(name = "survey_id")
    private Survey survey;
    public Survey getSurvey() {
        return survey;
    }

    public void setSurvey(Survey survey) {
        this.survey = survey;
    }
}

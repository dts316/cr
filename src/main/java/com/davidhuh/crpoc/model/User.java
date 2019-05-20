package com.davidhuh.crpoc.model;

import javax.persistence.*;

@Entity
@SequenceGenerator(name = "user_gen", sequenceName = "user_gen",  initialValue = 11)
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "user_gen")
    private int id;
    private String firstName;
    private String lastName;
    private String emailId;

    //getters and setters


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
}

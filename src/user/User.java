/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package user;

import database.DatabaseObject;
import java.util.ArrayList;
import java.util.List;
import managers.QuizManager;

/**
 * 
 * @author Ilja Sirotenko
 */
public class User implements DatabaseObject {
    private String name;
    private String login;
    private String password;
    
    public User(String name, String login, String password) {
        this.name = name;
        this.login = login;
        this.password = password;
    }
    
    public Boolean enter(String login, String password) {
        return this.login.equals(login) && this.password.equals(password);
    }
    
    public void save() {
        QuizManager.users.add(this);
    }
    
    @Override
    public String toDatabase() {
        return name + "/" + login + "/" + password + "\n";
    }
    
    public String getLogin()
    {
        return this.login;
    }
    
    public String getName()
    {
        return this.name;
    }
}

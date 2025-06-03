/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package managers;

import java.util.ArrayList;
import java.util.List;
import question.Question;
import user.User;

/**
 * This class manages global variables
 * @author Ilja Sirotenko
 */
public class QuizManager {
    public static List<User> users = new ArrayList<>();
    public static User currentUser;
    
    public static Question currentQuestion;
    public static int currentQuestionID = 0;
    public static String currentQuestionPath;
    
    public static int points = 0;
}

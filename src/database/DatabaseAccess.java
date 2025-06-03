/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.util.Scanner;
import managers.QuizManager;
import question.Question;
import user.User;

/**
 *
 * @author Ilja Sirotenko
 */
public class DatabaseAccess {

    
    /**
     * this method loads current registered accounts into the program
    */
    public static void loadUsers() {
        try {
            var file = new File("database/users.txt");
            try (Scanner myReader = new Scanner(file)) {
                while (myReader.hasNextLine()) {
                    String data = myReader.nextLine();
                    String[] entries = data.split("/");
                    
                    User user = new User(entries[0], entries[1], entries[2]);
                    user.save();
                }
            }
        } catch (Exception e) {
        }
    }
    
    /**
     * this method loads current registered accounts into the program
     * @param relativePath path to the file (Example: "database/users.txt")
     * @param id id of the question, it starts at 0
    */
    public static Question getQuestion(String relativePath, int id) {
        try {
            var file = new File(relativePath);
            try (Scanner myReader = new Scanner(file)) {
                int i = 0;
                
                while (myReader.hasNextLine()) {
                    if (i++ != id)
                    {
                        myReader.nextLine();
                        continue;
                    }
                    
                    String data = myReader.nextLine();
                    String[] entries = data.split("/");
                    Question question = new Question(entries[0], entries[1], entries[2].split(":"));
                    return question;
                }
            }
        } catch (Exception e) {
        }
        
        return null;
    }
    
    /**
     * this method is needed to write the data to the database
     * @param relativePath path to the file (Example: "database/users.txt")
     * @param data data to write
    */
    public static void writeToFile(String relativePath, String data) {
        var file = new File(relativePath);
        
        if (!file.exists()) {
            return;
        }
        
        try {
            var writer = new FileWriter(relativePath, true);
            writer.write(data);
            writer.close();
        } catch (Exception e) {
        }
    }
}

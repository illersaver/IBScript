/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package question;

/**
 * 
 * @author Ilja Sirotenko
 */
public class Question {
    private String text;
    private String answer;
    private String[] tips;
    
    public Question (String text, String answer, String[] tips) {
        this.text = text;
        this.answer = answer;
        this.tips = tips;
    }
    
    public String getText(){
        return text;
    }
    
    public String getAnswer(){
        return answer;
    }
    
    public Boolean isCorrect(String answer){
        return this.answer.equals(answer);
    }
    
    public String[] GetTips() {
        return this.tips;
    }
}

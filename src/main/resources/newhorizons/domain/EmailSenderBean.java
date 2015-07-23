/*
 *EmailSenderBean.java
 *Added: July 22, 2015
 *Contains a static method that receives an email address
 *where the email is originating from, identifies a to 
 *address where email is going to, subject of the email,
 *body of the email and if body should be in HTML format.
 *Subsequently, the message is created, addresses are
 *are formatted and message is transported.
 */
package resources.newhorizons.domain;


import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;
import java.io.*;

/**
 *
 * @author Sajjad
 */
public class EmailSenderBean 
{
    public static void sendMail(String to, String from, String subject, String body,
            boolean bodyIsHTML) throws MessagingException 
    {
        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtps");
        props.put("mail.smtps.host", "smtp.gmail.com");
        props.put("mail.smtps.port", 465);
        props.put("mail.smtps.auth", "true");
        props.put("mail.smtps.quitwait", "false");
        
        Session session = Session.getDefaultInstance(props);
        session.setDebug(true);
        
        System.out.println("\n\nFROM EmailSenderBean");
        System.out.println("to: " + to);
        System.out.println("from: " + from);
        System.out.println("subject: " + subject);
        System.out.println("body: " + body);
        
        
        //create a message
        Message message = new MimeMessage(session);
        message.setSubject(subject);
        
        if (bodyIsHTML)
            message.setContent(body, "text/html");
        else
            message.setText(body);
        
        //address the message
        Address fromAddress = new InternetAddress(from);
        Address toAddress = new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);
        
        //send message
        Transport transport = session.getTransport();
        transport.connect("NewHorizonsTeamD@gmail.com", "newhorizons");
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
        
    }
}

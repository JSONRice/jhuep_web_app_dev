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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sajjad
 */
public class EmailSenderBean
{
    private static final Logger LOGGER = Logger.getLogger(EmailSenderBean.class.getName());
    private static final String ADDRESS = "NewHorizonsTeamD@gmail.com";
    private static final String PASSWD = "newhorizons";
    
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
        
        LOGGER.log(Level.INFO, "\n\nFROM EmailSenderBean");
        LOGGER.log(Level.INFO, "to: {0}", to);
        LOGGER.log(Level.INFO, "from: {0}", from);
        LOGGER.log(Level.INFO, "subject: {0}", subject);
        LOGGER.log(Level.INFO, "body: {0}", body);
                
        // create a message
        Message message = new MimeMessage(session);
        message.setSubject(subject);
        
        if (bodyIsHTML)
            message.setContent(body, "text/html");
        else
            message.setText(body);
        
        // address the message
        Address fromAddress = new InternetAddress(from);
        Address toAddress = new InternetAddress(to);
        message.setFrom(fromAddress);
        message.setRecipient(Message.RecipientType.TO, toAddress);
        
        // send message
        Transport transport = session.getTransport();
        transport.connect(ADDRESS, PASSWD);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}

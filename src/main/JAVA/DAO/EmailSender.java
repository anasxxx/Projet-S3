package DAO;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.channels.ScatteringByteChannel;
import java.util.Properties;

public class EmailSender
{
    static final String PROPERTIES_FILE = "C:/Users/othma/Desktop/Save/Projet S3/src/main/resources/DAO.properties";
    static String host;
    static String port;
    static String username;
    static String password;
    static Properties props = new Properties();

    static InputStream input;

    public EmailSender() throws Exception {
        Properties properties = new Properties();
        input = new FileInputStream(PROPERTIES_FILE);
        properties.load(input);
        host = properties.getProperty("host");
        port = properties.getProperty("port");
        username = properties.getProperty("username");
        password = properties.getProperty("password");
        // Properties for the session
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
    }

    public static void SendMail(String to, String subject, String message) throws MessagingException
    {
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });
        try
        {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

            Transport.send(mimeMessage);
        }
        catch (Exception e)
        {
            System.out.println(username);
            System.out.println(password);
            System.out.println(e);
            throw new RuntimeException(e);
        }

            System.out.println("Email sent successfully!");
    }
    Session session = Session.getInstance(props, new Authenticator() {
        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    });
}

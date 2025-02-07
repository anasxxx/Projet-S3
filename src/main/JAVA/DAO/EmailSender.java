package DAO;

import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.io.InputStream;
import java.util.Properties;

public class EmailSender {
    static final String PROPERTIES_FILE = "DAO.properties";
    static String host;
    static String port;
    static String username;
    static String password;
    static Properties props = new Properties();

    public EmailSender() throws Exception {
        try (InputStream input = getClass().getClassLoader().getResourceAsStream(PROPERTIES_FILE)) {
            if (input == null) {
                throw new RuntimeException("Property file 'DAO.properties' not found in the classpath");
            }
            props.load(input);
            host = props.getProperty("host");
            port = props.getProperty("port");
            username = props.getProperty("username");
            password = props.getProperty("password");

            // Properties for the session
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", port);
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
        } catch (Exception e) {
            throw new RuntimeException("Failed to load properties", e);
        }
    }

    public static void SendMail(String to, String subject, String message) throws MessagingException {
        if (to == null || to.isEmpty()) {
            throw new IllegalArgumentException("Recipient email address is null or empty");
        }

        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message mimeMessage = null;
        try {
            mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);

            Transport.send(mimeMessage);
        } catch (Exception e) {
            System.out.println(to);
            System.out.println(subject);
            System.out.println(username);
            System.out.println(password);
            System.out.println(mimeMessage.getFrom());
            System.out.println(mimeMessage.getAllRecipients());
            System.out.println(e);
            throw new RuntimeException("Failed to send email", e);
        }

        System.out.println("Email sent successfully!");
    }
}
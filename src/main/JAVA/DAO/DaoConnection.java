package DAO;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import static java.lang.Class.forName;

public class DaoConnection
{
    private static final String PROPERTIES_FILE = "C:/Users/pc/Desktop/untitled/src/main/resources/DAO.properties";
    private static String driver;
    private static String url;         // Database URL
    private static String user;   // Database username
    private static String pass;   // Database password
    private static InputStream input;

    public DaoConnection()
    {
        Properties properties = new Properties();
        try
        {
            input = new FileInputStream(PROPERTIES_FILE);
            if (input == null)
            {
                throw new RuntimeException(PROPERTIES_FILE + " not found");
            }
            properties.load(input);
            driver = properties.getProperty("driver");
            url = properties.getProperty("url");
            user = properties.getProperty("user");
            pass = properties.getProperty("pass");
            Class.forName(driver);
        }
        catch (Exception e)
        {
            System.out.println(DaoConnection.class.getClassLoader().getResource(PROPERTIES_FILE));
            System.out.println("driver: " + driver);
            System.out.println("url: " + url);
            System.out.println("user: " + user);
            System.out.println("pass: " + pass);
            System.out.println("Exception: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection()
    {
        try
        {
            return DriverManager.getConnection(url, user, pass);
        }
        catch (Exception e)
        {
            System.out.println(DaoConnection.class.getClassLoader().getResource("PROPERTIES_FILE"));
            System.out.println("driver: " + driver);
            System.out.println("url: " + url);
            System.out.println("user: " + user);
            System.out.println("pass: " + pass);
            System.out.println("Exception: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }
}

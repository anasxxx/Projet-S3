package DAO;

import Bean.*;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.List;
import java.util.Properties;

import static java.lang.Class.forName;

public class JDBCConnectionManager implements ConnectionManager
{
    static final String PROPERTIES_FILE = "C:/Users/pc/Desktop/Projet S3/src/main/resources/DAO.properties";
    public static String driver;
    static String url;         // Database URL
    static String user;   // Database username
    static String pass;   // Database password
    static InputStream input;

    public JDBCConnectionManager()
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
            System.out.println(JDBCConnectionManager.class.getClassLoader().getResource(PROPERTIES_FILE));
            System.out.println("driver: " + driver);
            System.out.println("url: " + url);
            System.out.println("user: " + user);
            System.out.println("pass: " + pass);
            System.out.println("Exception: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    public Connection getConnection()
    {
        try
        {
            return DriverManager.getConnection(url, user, pass);
        }
        catch (Exception e)
        {
            System.out.println(JDBCConnectionManager.class.getClassLoader().getResource("PROPERTIES_FILE"));
            System.out.println("driver: " + driver);
            System.out.println("url: " + url);
            System.out.println("user: " + user);
            System.out.println("pass: " + pass);
            System.out.println("Exception: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }
}

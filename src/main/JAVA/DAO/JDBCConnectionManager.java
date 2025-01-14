package DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class JDBCConnectionManager implements ConnectionManager {

    private static String driver;
    private static String url;   // Database URL
    private static String user;  // Database username
    private static String pass;  // Database password

    public JDBCConnectionManager() {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("DAO.properties")) {
            if (input == null) {
                throw new RuntimeException("Property file 'DAO.properties' not found in the classpath");
            }

            // Load properties from file
            try
            {
                properties.load(input);
                driver = properties.getProperty("driver");
                url = properties.getProperty("url");
                user = properties.getProperty("user");
                pass = properties.getProperty("pass");
            }
            catch (Exception e)
                {
                    System.out.println(e);
                    throw new RuntimeException("Failed to load DAO.properties", e);
                }


            // Load the JDBC driver
            Class.forName(driver);
        } catch (Exception e) {
            throw new RuntimeException("Failed to initialize JDBCConnectionManager", e);
        }
    }

    @Override
    public Connection getConnection() {
        try {
            return DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            throw new RuntimeException("Failed to establish database connection", e);
        }
    }
}

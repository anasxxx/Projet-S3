package DAO;

import Bean.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.List;
import java.util.Properties;

import static java.lang.Class.forName;

public class DaoConnection implements DAO
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

    public Connection getConnection()
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

    @Override
    public UserBean getUserById(int id)
    {
        DaoConnection DAO = new DaoConnection();
        Connection connection = DAO.getConnection();
        PreparedStatement stmt=null;
        String query = "select * from user where id = ?";
        UserBean user=new UserBean();
        try
        {
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            user.setId(rs.getInt("id"));
            user.setNom(rs.getString("nom"));
            user.setPrenom(rs.getString("prenom"));
            user.setMassar(rs.getString("massar"));
            user.setRole(rs.getString("role"));
            user.setPassword(rs.getString("password"));
            user.setTel(rs.getInt("tel"));
            user.setToken(rs.getString("token"));
            user.setToken_validity(rs.getDate("token_validity"));
        }
        catch (SQLException e)
        {
            throw new ExceptionInInitializerError(e);
        }
        return user;
    }

    @Override
    public List<UserBean> getAllUsers() {
        return List.of();
    }

    @Override
    public void saveUser(UserBean user) {

    }

    @Override
    public void updateUser(UserBean user) {

    }

    @Override
    public void deleteUser(int id) {

    }

    @Override
    public AnnonceBean getAnnonceById(int id) {
        return null;
    }

    @Override
    public List<AnnonceBean> getAllAnnonce() {
        return List.of();
    }

    @Override
    public void saveAnnonce(AnnonceBean user) {

    }

    @Override
    public void updateAnnonce(AnnonceBean user) {

    }

    @Override
    public void deleteAnnonce(int id) {

    }

    @Override
    public ReclamationBean getReclamationById(int id) {
        return null;
    }

    @Override
    public List<ReclamationBean> getAllReclamations() {
        return List.of();
    }

    @Override
    public void saveReclamation(ReclamationBean reclamation) {

    }

    @Override
    public void updateReclamation(ReclamationBean reclamation) {

    }

    @Override
    public void deleteReclamation(int id) {

    }

    @Override
    public FinancementBean getFinancementById(int id) {
        return null;
    }

    @Override
    public List<FinancementBean> getAllFinancements() {
        return List.of();
    }

    @Override
    public void saveFinancement(FinancementBean financement) {

    }

    @Override
    public void updateFinancement(FinancementBean financement) {

    }

    @Override
    public void deleteFinancement(int id) {

    }

    @Override
    public DepensesBean getDepensesById(int id) {
        return null;
    }

    @Override
    public List<DepensesBean> getAllDepenses() {
        return List.of();
    }

    @Override
    public void saveDepenses(DepensesBean depenses) {

    }

    @Override
    public void updateDepenses(DepensesBean depenses) {

    }

    @Override
    public void deleteDepenses(int id) {

    }

    @Override
    public ClubBean getClubById(int id) {
        return null;
    }

    @Override
    public List<ClubBean> getAllClubs() {
        return List.of();
    }

    @Override
    public void saveClub(ClubBean club) {

    }

    @Override
    public void updateClub(ClubBean club) {

    }

    @Override
    public void deleteClub(int id) {

    }
}

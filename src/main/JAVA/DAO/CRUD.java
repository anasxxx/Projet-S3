package DAO;

import Bean.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static DAO.JDBCConnectionManager.url;


public class CRUD
{
    
    public static UserBean getUserById(int id)
    {
        JDBCConnectionManager DAO = new JDBCConnectionManager();
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
            if (user.getTel() != null)
            {
                user.setTel(rs.getInt("tel"));
            }
            else
            {
                user.setTel(null);
            }
            user.setSexe(rs.getString("sexe"));
            user.setRole(rs.getString("role"));
            user.setMassar(rs.getString("massar"));
            user.setPassword(rs.getString("password"));
            user.setToken(rs.getString("token"));
            user.setToken_validity(rs.getDate("token_validity"));
        }
        catch (SQLException e)
        {
            throw new RuntimeException("Error getting user id "+id, e);
        }
        return user;
    }

    
    public static List<UserBean> getAllUsers() {
        JDBCConnectionManager DAO = new JDBCConnectionManager();
        Connection connection = DAO.getConnection();
        PreparedStatement stmt = null;
        String query = "select * from user";
        List<UserBean> users = new ArrayList<UserBean>();
        int columnCount = 0;
        try {
            stmt = connection.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData metaData = rs.getMetaData();
            while (rs.next()) {
                columnCount = metaData.getColumnCount();
                UserBean user = new UserBean();
                user.setId(rs.getInt("id"));
                user.setNom(rs.getString("nom"));
                user.setPrenom(rs.getString("prenom"));
                if (user.getTel() != null)
                {
                    user.setTel(rs.getInt("tel"));
                }
                else
                {
                    user.setTel(null);
                }
                user.setSexe(rs.getString("sexe"));
                user.setRole(rs.getString("role"));
                user.setMassar(rs.getString("massar"));
                user.setPassword(rs.getString("password"));
                user.setToken(rs.getString("token"));
                user.setToken_validity(rs.getDate("token_validity"));
                users.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error getting all users", e);
        }
        return users;
    }

    
    public static void addUser(UserBean user)
    {
        JDBCConnectionManager DAO = new JDBCConnectionManager();
        Connection connection = DAO.getConnection();
        String query = "INSERT INTO user (nom, prenom, tel, sexe, role, massar, password) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(query))
        {
            stmt.setString(1, user.getNom());
            stmt.setString(2, user.getPrenom());
            if (user.getTel() != null)
            {
                stmt.setInt(3, user.getTel());
            } else
            {
                stmt.setNull(3, java.sql.Types.INTEGER);
            }
            stmt.setString(4, user.getSexe());
            stmt.setString(5, user.getRole());
            stmt.setString(6, user.getMassar());
            stmt.setString(7, user.getPassword());
            stmt.executeUpdate();
        }
        catch (SQLException e)
        {
            throw new RuntimeException("Error adding user", e);
        }
    }

    
    public static void updateUser(UserBean user)
    {

    }

    
    public static void deleteUser(int id)
    {

    }

    
    public static AnnonceBean getAnnonceById(int id) {
        return null;
    }

    
    public static List<AnnonceBean> getAllAnnonce() {
        return List.of();
    }

    
    public static void addAnnonce(AnnonceBean user) {

    }

    
    public static void updateAnnonce(AnnonceBean user) {

    }

    
    public static void deleteAnnonce(int id) {

    }

    
    public static ReclamationBean getReclamationById(int id) {
        return null;
    }

    
    public static List<ReclamationBean> getAllReclamations() {
        return List.of();
    }

    
    public static void addReclamation(ReclamationBean reclamation) {

    }

    
    public static void updateReclamation(ReclamationBean reclamation) {

    }

    
    public static void deleteReclamation(int id) {

    }

    
    public static FinancementBean getFinancementById(int id) {
        return null;
    }

    
    public static List<FinancementBean> getAllFinancements() {
        return List.of();
    }

    
    public static void addFinancement(FinancementBean financement) {

    }

    
    public static void updateFinancement(FinancementBean financement) {

    }

    
    public static void deleteFinancement(int id) {

    }

    
    public static DepensesBean getDepensesById(int id) {
        return null;
    }

    
    public static List<DepensesBean> getAllDepenses() {
        return List.of();
    }

    
    public static void addDepenses(DepensesBean depenses) {

    }

    
    public static void updateDepenses(DepensesBean depenses) {

    }

    
    public static void deleteDepenses(int id) {

    }

    
    public static ClubBean getClubById(int id) {
        return null;
    }

    
    public static List<ClubBean> getAllClubs() {
        return List.of();
    }

    
    public static void addClub(ClubBean club) {

    }

    
    public static void updateClub(ClubBean club) {

    }

    
    public static void deleteClub(int id) {

    }
}

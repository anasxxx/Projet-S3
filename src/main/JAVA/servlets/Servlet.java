package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.UserBean;
import DAO.*;
import jakarta.servlet.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import static java.lang.Class.forName;
@WebServlet("/Servlet")
public class Servlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ResultSet result = null;
        Statement SelectStatement = null;
        Connection connection;
        final String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String pass = "Pi@3141592";
        try
        {
            JDBCConnectionManager DAO= new JDBCConnectionManager();
            /*Class.forName(driver);
            connection=DriverManager.getConnection(url, user, pass);*/

            connection = DAO.getConnection();
            List<UserBean> users=new ArrayList<UserBean>();
            users=CRUD.getAllUsers();
            request.setAttribute("users", users);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/meta.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
            throw new RuntimeException(e);
        }
    }
}

package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import DAO.*;
import Bean.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import static java.lang.Class.forName;
@WebServlet("/indexservlet")
public class indexservlet extends HttpServlet
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
            String meta=connection.getSchema();

            request.setAttribute("meta", meta);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/meta.jsp");
            dispatcher.forward(request, response);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}

package servlets;

import Bean.ClubBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/GetclubsServlet")
public class GetclubsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ClubBean> clubs=new ArrayList<ClubBean>();
        try
        {
            clubs= CRUD.getAllCLubs();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        request.setAttribute("clubs", clubs);
        request.getRequestDispatcher("clubs.jsp").forward(request, response);
    }
}
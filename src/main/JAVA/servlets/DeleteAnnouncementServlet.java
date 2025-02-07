package servlets;

import Bean.AnnonceBean;
import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.nio.file.SecureDirectoryStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteAnnouncementServlet")
public class DeleteAnnouncementServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int id= (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        UserBean mainUser= new UserBean();
        mainUser= CRUD.getUserById(id);


        if(!mainUser.getRole().equals("Chef") && !mainUser.getRole().equals("P"))
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            int id_annonce = Integer.parseInt(request.getParameter("id"));
            CRUD.deleteAnnonce(id_annonce);
        }
    }
}

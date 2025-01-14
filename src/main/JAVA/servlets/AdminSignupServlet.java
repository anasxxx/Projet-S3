package servlets;

import Bean.UserBean;
import DAO.CRUD;
import DAO.Security;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        int id= (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        UserBean mainUser= new UserBean();
        mainUser= CRUD.getUserById(id);


        if(!mainUser.getRole().equals("P"))
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String massar = request.getParameter("massar");
            String phone = request.getParameter("phone");
            String sexe = request.getParameter("sexe");
            String password = Security.RandomPassGenerator();

            UserBean user = new UserBean();

            user.setFirst_name(first_name);
            user.setLast_name(last_name);
            user.setMassar(massar);
            user.setPhone(phone);
            user.setSexe(sexe);
            user.setPassword(password);

            try
            {
                CRUD.AdminaddUser(user);
            }
            catch (Exception e)
            {
                throw new RuntimeException(e);
            }
            response.sendRedirect("GetusersServlet");
        }
    }
}

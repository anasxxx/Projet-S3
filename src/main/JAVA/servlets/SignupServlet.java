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

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String massar = request.getParameter("massar");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String sexe = request.getParameter("sexe");
        String password_hash="";

        try
        {
            password_hash = Security.hash(password);
        }
        catch (NoSuchAlgorithmException e)
        {
            throw new RuntimeException(e);
        }

        UserBean user = new UserBean();

        user.setFirst_name(first_name);
        user.setLast_name(last_name);
        user.setMassar(massar);
        user.setPhone(phone);
        user.setSexe(sexe);
        user.setPassword(password_hash);

        try
        {
            CRUD.addUser(user);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }
}

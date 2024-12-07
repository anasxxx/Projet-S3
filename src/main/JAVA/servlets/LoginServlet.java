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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String massar=request.getParameter("massar");
        String password=request.getParameter("password");
        UserBean user=CRUD.getUserByMassar(massar);
        request.setAttribute("first_login",false);
        if(user==null)
        {
            request.setAttribute("alert", "user does not exist");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            try
            {
                String hash=Security.hash(password);
                if(user.getPassword().equals(hash))
                {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("id",user.getId());
                    session.setAttribute("role",user.getRole());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
                    dispatcher.forward(request, response);
                }
                else
                {
                    request.setAttribute("alert", "wrong password");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                }
            }
            catch (NoSuchAlgorithmException e)
            {
                throw new RuntimeException(e);
            }
        }
    }
}

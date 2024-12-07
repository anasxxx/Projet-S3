package servlets;

import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ResetpasscheckServlet")
public class ResetpasscheckServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String token_hash=request.getParameter("token_hash");
        int id=Integer.parseInt(request.getParameter("id"));
        String pass=request.getParameter("password");
        try
        {
            CRUD.updatePassword(id,pass);
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        request.setAttribute("id",id);
        request.setAttribute("token_hash",token_hash);
        RequestDispatcher dispatcher = request.getRequestDispatcher("newpass.jsp");
        dispatcher.forward(request, response);
    }
}


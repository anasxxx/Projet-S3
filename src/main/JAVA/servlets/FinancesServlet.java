package servlets;

import Bean.FinancementBean;
import Bean.UserBean;
import DAO.CRUD;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;

@WebServlet("/FinancesServlet")
public class FinancesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int id= (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        UserBean mainUser= new UserBean();
        mainUser= CRUD.getUserById(id);


        if(!mainUser.getRole().equals("Chef"))
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        else
        {
            List<FinancementBean> financements= new ArrayList<FinancementBean>();
            try
            {
                financements=CRUD.getFinancementsByUserId(id);
            }
            catch (Exception e)
            {
                throw new RuntimeException(e);
            }
            request.setAttribute("financements", financements);
            RequestDispatcher dispatcher = request.getRequestDispatcher("finances.jsp");
            dispatcher.forward(request, response);
        }
    }
}
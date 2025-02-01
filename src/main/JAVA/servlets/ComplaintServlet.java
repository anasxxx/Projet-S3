package servlets;


import Bean.AnnonceBean;
import Bean.ReclamationBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ComplaintServlet")
public class ComplaintServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        int id= (int) session.getAttribute("id");

        List<ReclamationBean> reclamations= new ArrayList<ReclamationBean>();

        try
        {
            reclamations= (List<ReclamationBean>) CRUD.getAllReclamations();

        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
        request.setAttribute("complaints", reclamations);
        RequestDispatcher dispatcher = request.getRequestDispatcher("complaints.jsp");
        dispatcher.forward(request, response);
    }
}

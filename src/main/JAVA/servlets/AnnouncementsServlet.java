package servlets;

import Bean.AnnonceBean;
import Bean.ClubBean;
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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AnnouncementsServlet")
public class AnnouncementsServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession(false);
        int id= (int) session.getAttribute("id");

        List<AnnonceBean> annonces= new ArrayList<AnnonceBean>();

        try
        {
            annonces= (List<AnnonceBean>) CRUD.getAllAnnonce();

        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }

        request.setAttribute("annonces", annonces);
        RequestDispatcher dispatcher = request.getRequestDispatcher("announcements.jsp");
        dispatcher.forward(request, response);
    }
}

package servlets;

import DAO.CRUD;
import Bean.ReclamationBean;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/ReclamationServlet")
public class ReclamationServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ReclamationBean> reclamations = CRUD.getAllReclamations();
        request.setAttribute("reclamations", reclamations);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reclamation.jsp");
        dispatcher.forward(request, response);
    }
}
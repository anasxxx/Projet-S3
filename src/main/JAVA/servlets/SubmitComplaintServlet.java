package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import Bean.AnnonceBean;
import Bean.ReclamationBean;
import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SubmitComplaintServlet")
@MultipartConfig
public class SubmitComplaintServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        int id_user = (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");


        String caption = request.getParameter("caption");


        ReclamationBean reclamation = new ReclamationBean();
        reclamation.setDescription(caption);
        reclamation.setId_user(id_user);

int generatedId;
try {
    CRUD.addReclamation(reclamation);
} catch (Exception e) {
    throw new RuntimeException(e);
}



        // Save the description and file path to the database or session (not implemented here)
        response.sendRedirect("ComplaintServlet");
    }

}

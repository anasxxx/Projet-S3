package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import Bean.AnnonceBean;
import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/SubmitAnouncementServlet")
@MultipartConfig
public class SubmitAnouncementServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession(false);
        int id_user = (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        UserBean mainUser = new UserBean();
        mainUser = CRUD.getUserById(id_user);


        if (!mainUser.getRole().equals("P") && !mainUser.getRole().equals("Chef")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }

        String caption = request.getParameter("caption");

        AnnonceBean annonce = new AnnonceBean();

        annonce.setCaption(caption);
        annonce.setId_user(id_user);

        int generatedId;
        try
        {
            generatedId = CRUD.addAnnonce(annonce);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


        String uploadDir = getServletContext().getRealPath("/img/data");
Path uploadPath = Paths.get(uploadDir);

if (!Files.exists(uploadPath)) {
    Files.createDirectories(uploadPath);
}

Part filePart = request.getPart("photo");
String fileName = generatedId + ".jpg";
Path filePath = uploadPath.resolve(fileName);

try (InputStream inputStream = filePart.getInputStream()) {
    Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
}

        // Save the description and file path to the database or session (not implemented here)
        response.sendRedirect("AnnouncementsServlet");
    }

}

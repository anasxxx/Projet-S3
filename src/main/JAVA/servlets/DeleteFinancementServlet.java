package servlets;

import Bean.FinancementBean;
import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.nio.file.SecureDirectoryStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteFinancementServlet")
public class DeleteFinancementServlet extends HttpServlet {
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
            int id_financement = Integer.parseInt(request.getParameter("id"));
            CRUD.deleteFinancement(id_financement);
            ServletContext context = getServletContext();

            // Define the relative path of the file to delete (relative to the web app root)
            String relativePath = "finances/file-to-delete.txt";

            String filePath = getServletContext().getRealPath("/finances/") + id_financement + ".pdf";
            File file = new File(filePath);
            if (file.delete()) {
                System.out.println("File deleted successfully");
            } else {
                System.out.println("Failed to delete the file");
            }
        }
    }
}

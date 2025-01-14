package servlets;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DownloadPDFServlet")
public class DownloadPDFServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Path pdfPath = Paths.get(getServletContext().getRealPath("/finances/") + id + ".pdf");
        byte[] pdfData = Files.readAllBytes(pdfPath);

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=" + id + ".pdf");
        response.setContentLength(pdfData.length);

        try {
            response.getOutputStream().write(pdfData);
            response.getOutputStream().flush();
        } catch (IOException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error writing PDF data to output stream");
        }
    }
}
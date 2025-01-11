package servlets;

import Bean.FinancementBean;
import Bean.UserBean;
import DAO.CRUD;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SubmitFinancingServlet")
public class SubmitFinancingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        int id_user = id;
        String description = request.getParameter("description");
        Float montant = Float.parseFloat(request.getParameter("montant"));

        FinancementBean financingRequest = new FinancementBean();
        financingRequest.setId_user(id_user);
        financingRequest.setDescription(description);
        financingRequest.setMontant(montant);

        int generatedId = 0;
        try {
            generatedId = CRUD.addFinancingRequest(financingRequest);
        } catch (Exception e) {
            throw new ServletException(e);
        }
        Timestamp date = CRUD.getFinancementById(generatedId).getDate();
        String filePath = getServletContext().getRealPath("/finances/") + generatedId + ".pdf";
        Document document = new Document();
        try {
    PdfWriter.getInstance(document, new FileOutputStream(filePath));
    document.open();
    String leftImagePath = getServletContext().getRealPath("/img/ensias.png");
    String rightImagePath = getServletContext().getRealPath("/img/adei.png");
    Image leftImage = Image.getInstance(leftImagePath);
    Image rightImage = Image.getInstance(rightImagePath);
    if (leftImage != null && rightImage != null) {
        leftImage.setAlignment(Image.LEFT);
        rightImage.setAlignment(Image.RIGHT);
        document.add(leftImage);
        document.add(rightImage);
    }
    document.add(new Paragraph("Financing Request Details:"));
    document.add(new Paragraph("ID: " + generatedId));
    document.add(new Paragraph("User ID: " + id_user));
    document.add(new Paragraph("Description: " + description));
    document.add(new Paragraph("Date: " + date));
    document.add(new Paragraph("Montant: " + montant));
} catch (DocumentException e) {
    throw new ServletException(e);
} finally {
    if (document.isOpen()) {
        document.close();
    }
}
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
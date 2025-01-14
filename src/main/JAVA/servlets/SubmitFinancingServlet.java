package servlets;

import Bean.FinancementBean;
import Bean.UserBean;
import DAO.CRUD;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
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
import java.text.SimpleDateFormat;

@WebServlet("/SubmitFinancingServlet")
public class SubmitFinancingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int id = (int) session.getAttribute("id");
        String role = (String) session.getAttribute("role");

        UserBean mainUser = CRUD.getUserById(id);

        if (!mainUser.getRole().equals("Chef")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
            return;
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
        String formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(date);
        String filePath = getServletContext().getRealPath("/finances/") + generatedId + ".pdf";

        // Generate PDF
        try {
            Document document = new Document();
            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            Image ensisaLogo = Image.getInstance(getServletContext().getRealPath("/img/ensias.png"));
            ensisaLogo.scaleToFit(200, 100);
            ensisaLogo.setBorder(Rectangle.NO_BORDER);
            Image adeiLogo = Image.getInstance(getServletContext().getRealPath("/img/adei.png"));
            adeiLogo.scaleToFit(220, 110);
            adeiLogo.setBorder(Rectangle.NO_BORDER);

            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(100);
            table.setSpacingBefore(20);
            table.setSpacingAfter(20);
            PdfPCell cell1 = new PdfPCell(ensisaLogo);
            cell1.setBorder(Rectangle.NO_BORDER);
            cell1.setHorizontalAlignment(Element.ALIGN_LEFT);
            PdfPCell cell2 = new PdfPCell(adeiLogo);
            cell2.setBorder(Rectangle.NO_BORDER);
            cell2.setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(cell1);
            table.addCell(cell2);
            document.add(table);

            // Fonts
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 26, Font.BOLD);
            Font descriptionTitleFont = new Font(Font.FontFamily.HELVETICA, 20, Font.BOLD);
            Font detailsFont = new Font(Font.FontFamily.HELVETICA, 14, Font.NORMAL);

            // Centered title
            Paragraph title = new Paragraph("Financing Request", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            title.setSpacingAfter(20);
            document.add(title);

            // Other elements at the start
            document.add(new Paragraph("ID: " + generatedId, detailsFont));
            document.add(new Paragraph("User: " + mainUser.getFirst_name() + " " + mainUser.getLast_name(), detailsFont));
            document.add(new Paragraph("Amount: " + montant, detailsFont));
            document.add(new Paragraph("Date: " + formattedDate, detailsFont));

            // Description as a paragraph title
            Paragraph descriptionTitle = new Paragraph("Description", descriptionTitleFont);
            descriptionTitle.setSpacingBefore(20);
            document.add(descriptionTitle);
            document.add(new Paragraph(description, detailsFont));

            document.close();
        } catch (DocumentException | IOException e) {
            throw new ServletException("Error generating PDF", e);
        }

        response.sendRedirect("FinancesServlet");
    }
}
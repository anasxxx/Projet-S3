package servlets;

import Bean.UserBean;
import DAO.CRUD;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/ResetpassServlet")
public class ResetpassServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String token_hash=request.getParameter("token_hash");
        int id=Integer.parseInt(request.getParameter("id"));
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime currentDateTime1 = LocalDateTime.now();
        LocalDateTime currentDateTime = currentDateTime1.withNano(1);
        UserBean user=CRUD.getUserById(id);


        if(token_hash.equals(user.getToken()))
        {
            if(currentDateTime.format(formatter).compareTo(user.getToken_validity().toString())<0)
            {
                System.out.println(currentDateTime.format(formatter).compareTo(user.getToken_validity().toString()));
                System.out.println(currentDateTime);
                System.out.println(user.getToken_validity().toString());
                request.setAttribute("id",id);
                request.setAttribute("token_hash",token_hash);
                RequestDispatcher dispatcher = request.getRequestDispatcher("newpass.jsp");
                dispatcher.forward(request, response);
            }
            else
            {
                System.out.println(currentDateTime.format(formatter).compareTo(user.getToken_validity().toString()));
                System.out.println(currentDateTime.format(formatter));
                System.out.println(user.getToken_validity());
                System.out.println(user.getUpdated_at());
                System.out.println("Expired token");
                RequestDispatcher dispatcher = request.getRequestDispatcher("tokenexpired.jsp");
                dispatcher.forward(request, response);
            }

        }
        else
        {
            System.out.println(token_hash.equals(user.getToken()));
            System.out.println(token_hash);
            System.out.println(user.getToken());
            System.out.println("Invalid token");

            RequestDispatcher dispatcher = request.getRequestDispatcher("wrongtoken.jsp");
            dispatcher.forward(request, response);
        }
    }
}

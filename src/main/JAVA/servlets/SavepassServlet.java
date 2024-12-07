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
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

@WebServlet("/SavepassServlet")
public class SavepassServlet extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String token_hash=request.getParameter("token_hash");
        int id=Integer.parseInt(request.getParameter("id"));
        String pass=request.getParameter("password");
        UserBean user=CRUD.getUserById(id);

        if (user.getToken().equals(token_hash))
        {
            LocalDateTime CurrentDate=LocalDateTime.now().withNano(0);
            Timestamp CurrentTime=Timestamp.valueOf(CurrentDate);
            System.out.println(user.getToken_validity().toString().compareTo(CurrentTime.toString()));
            System.out.println(CurrentTime);
            System.out.println(user.getToken_validity().toString());
            if(user.getToken_validity().toString().compareTo(CurrentTime.toString())>=0)
            {
                try
                {
                    System.out.println(CurrentTime.toString());
                    System.out.println(token_hash);
                    CRUD.updatePassword(id,pass);
                }
                catch (Exception e)
                {
                    throw new RuntimeException(e);
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
            else
            {
                RequestDispatcher dispatcher = request.getRequestDispatcher("tokenexpired.jsp");
                dispatcher.forward(request, response);
            }
        }
        else
        {
            RequestDispatcher dispatcher = request.getRequestDispatcher("wrongtoken.jsp");
            dispatcher.forward(request, response);
        }
    }
}


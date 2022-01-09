package com.mycompany.podchody;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.podchody.DatabaseConnection;
// Servlet Name
public class newQuestion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            String Test_ID = request.getParameter("Test_ID");
            String Question = request.getParameter("Question");
            String Answer1 = request.getParameter("Answer1");
            String Answer2 = request.getParameter("Answer2");
            String Answer3 = request.getParameter("Answer3");
            String Answer4 = request.getParameter("Answer4");
            String Correct_Answer = request.getParameter("Correct_Answer");

            PreparedStatement st = con
                    .prepareStatement("INSERT INTO Podchody.Questions (`Question_ID`, `Test_ID`, `Question`, `Answer1`, `Answer2`, `Answer3`, `Answer4`, `Correct_Answer`) " +
                            "VALUES (NULL,?,?,?,?,?,?,?);");
            st.setString(1,Test_ID);
            st.setString(2,Question);
            st.setString(3,Answer1);
            st.setString(4,Answer2);
            st.setString(5,Answer3);
            st.setString(6,Answer4);
            st.setString(7,Correct_Answer);
            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("/Podchody/questions.jsp");
            response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
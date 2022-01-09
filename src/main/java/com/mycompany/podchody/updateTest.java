package com.mycompany.podchody;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.podchody.DatabaseConnection;
// Servlet Name
public class updateTest extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String Test_ID = request.getParameter("Test_ID");
            String Point_ID = request.getParameter("Point_ID");
            String Name = request.getParameter("Name");
            String Treshhold = request.getParameter("Treshhold");

            PreparedStatement st = con
                    .prepareStatement("UPDATE `Test` SET" +
                            " `Point_ID` = ?, `Name` = ?, `Treshhold` = ?" +
                            " WHERE `Test`.`Test_ID` = ?");
            st.setString(1,Point_ID);
            st.setString(2,Name);
            st.setString(3,Treshhold);
            st.setString(4,Test_ID);


            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("/Podchody/tests.jsp");
            //response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
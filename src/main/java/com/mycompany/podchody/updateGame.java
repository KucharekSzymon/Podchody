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
public class updateGame extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String Game_ID = request.getParameter("Game_ID");
            String Name = request.getParameter("Name");

            PreparedStatement st = con
                    .prepareStatement("UPDATE `Game` SET `Name` = ? WHERE `Game`.`Game_ID` = ?");
            st.setString(1,Name);
            st.setString(2,Game_ID);

            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("/Podchody/games.jsp");
            //response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
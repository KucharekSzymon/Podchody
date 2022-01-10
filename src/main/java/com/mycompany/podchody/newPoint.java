package com.mycompany.podchody;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.podchody.DatabaseConnection;
// Servlet Name
public class newPoint extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            String Name = request.getParameter("Name");
            String Game_ID = request.getParameter("Game_ID");
            String Altitude = request.getParameter("Altitude");
            String Longitude = request.getParameter("Longitude");

            PreparedStatement st = con
                    .prepareStatement("INSERT INTO Points (`Point_ID`,`Game_ID`, `Name`, `Altitude`, `Longitude`) " +
                            "VALUES (NULL,?,?,?,?);");
            st.setString(1,Game_ID);
            st.setString(2,Name);
            st.setString(3,Altitude);
            st.setString(4,Longitude);

            st.executeUpdate();
            st.close();
            con.close();
            response.sendRedirect("/Podchody/points.jsp");
            //response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
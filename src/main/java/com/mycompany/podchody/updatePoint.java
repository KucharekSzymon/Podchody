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
public class updatePoint extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            String Game_ID = request.getParameter("Game_ID");
            String Point_ID = request.getParameter("Point_ID");
            String Name = request.getParameter("Name");
            String Altitude = request.getParameter("Altitude");
            String Longitude = request.getParameter("Longitude");

            PreparedStatement st = con
                    .prepareStatement("UPDATE `Points` SET" +
                            " `Game_ID` = ?, `Name` = ?, `Altitude` = ?, `Longitude` = ?" +
                            " WHERE `Points`.`Point_ID` = ?");
            st.setString(1,Game_ID);
            st.setString(2,Name);
            st.setString(3,Altitude);
            st.setString(4,Longitude);
            st.setString(5,Point_ID);



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
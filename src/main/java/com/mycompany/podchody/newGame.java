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
public class newGame extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            String Name = request.getParameter("Name");

            PreparedStatement st = con
                    .prepareStatement("INSERT INTO Game (`Game_ID`,`Name`) " +
                            "VALUES (NULL,?);");
            st.setString(1,Name);

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
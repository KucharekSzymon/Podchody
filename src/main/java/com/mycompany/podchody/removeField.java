package com.mycompany.podchody;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import Database Connection Class file
import com.mycompany.podchody.DatabaseConnection;
// Servlet Name
public class removeField extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();

            String table = request.getParameter("table");
            String Id = request.getParameter("Id");
            String tableId = table+"_ID";
            PreparedStatement st = con.prepareStatement("SELECT * from Test");
            if(table.equals("Test") || table .equals("Game")){
                 st = con
                        .prepareStatement("DELETE FROM " + table + " WHERE " + tableId + " = " + Id + "");
            }
            else {
                st = con
                        .prepareStatement("DELETE FROM " + table + "s" + " WHERE " + tableId + " = " + Id + "");
            }
            st.executeUpdate();
            st.close();
            con.close();
                response.sendRedirect("/Podchody/"+table.toLowerCase()+"s"+".jsp");
            //response.sendRedirect(request.getHeader("referer"));
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
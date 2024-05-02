package com.devesh;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String userName = request.getParameter("txtUserName");
    String email = request.getParameter("txtEmail");
    String password = request.getParameter("txtPassword");
    String verifyPassword = request.getParameter("txtVerifyPassword");
    // Connect to the database
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    if (!password.equals(verifyPassword)) {
        // If the passwords do not match, display an error message
        request.setAttribute("error", "Passwords do not match");
        request.getRequestDispatcher("signUp.jsp").forward(request, response);
        return;
      }
    
    try {
      // Connect to the database
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase","root","");

      // Check if the user already exists
      String sql = "SELECT * FROM login WHERE username = ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userName);
      rs = pstmt.executeQuery();

      // If the user already exists, display an error message
      if (rs.next()) {
        request.setAttribute("error", "User name already exists");
        request.getRequestDispatcher("signUp.jsp").forward(request, response);
        return;
      }

      // Insert the user into the database
      sql = "INSERT INTO login (username, email, password) VALUES (?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, userName);
      pstmt.setString(2, email);
      pstmt.setString(3, password);
      pstmt.executeUpdate();

      // Redirect the user to the login page
      response.sendRedirect("login.jsp");

    } catch (SQLException e) {
      e.printStackTrace();
    } finally {
      if (conn != null) {
        try {
          conn.close();
        } catch (SQLException e) {
          e.printStackTrace();
        }
      }
    }
  }
}

package newp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//@WebServlet("/")
public class manageFeedbackReviews extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/sefinals";
        String user = "root";
        String password = "admin";
        String productid = request.getParameter("id");
        String query = "SELECT uname, rating, review, productid, admin_reply, created_at FROM mytable WHERE productid = ?";
        List<Map<String, Object>> rows = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, password);
                PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, Integer.parseInt(productid));
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> row = new HashMap<>();
                    row.put("uname", rs.getString("uname"));
                    row.put("rating", rs.getInt("rating"));
                    row.put("review", rs.getString("review"));
                    row.put("productid", rs.getInt("productid"));
                    row.put("admin_reply", rs.getString("admin_reply"));
                    row.put("created_at", rs.getTimestamp("created_at"));
                    rows.add(row);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("rows", rows);
        request.getRequestDispatcher("feedbackpage.jsp").forward(request, response);
    }
}
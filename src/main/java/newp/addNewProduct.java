package newp;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.Blob;

import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;

@WebServlet("/addnewform")
@MultipartConfig(maxFileSize = 16177215)
public class addNewProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        PreparedStatement pstmt2 = null;
    
        RequestDispatcher dp = null;
        
        InputStream inputStream = null; // input stream of the upload file

        try {
        	 String status = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://soundsdreamy.mysql.database.azure.com:3306/sefinals?useSSL=true", "admindreamy",
                    "@Soundsdreamy10");
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("image");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());
                 
                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();
            }
            String name = request.getParameter("name");
            String query = "SELECT name FROM products WHERE name = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            resultSet = statement.executeQuery();
            if (!resultSet.next()) {
                int price = Integer.parseInt(request.getParameter("price"));
                int quan = Integer.parseInt(request.getParameter("quantity"));
                String desc = request.getParameter("desc");
              
                String fab = request.getParameter("fabric");
                String fit = request.getParameter("fitting");
                String len = request.getParameter("length");
                String wid = request.getParameter("width");
                String len2 = request.getParameter("length2");
                String waist = request.getParameter("waistline");
                String querys = "SELECT COUNT(*) FROM products WHERE name = ?";
                pstmt2 = connection.prepareStatement(querys);
                pstmt2.setString(1, name);
                resultSet = pstmt2.executeQuery();
                resultSet.next();
                int count = resultSet.getInt(1);

                if (count == 0) {
                    String sql2 = "INSERT INTO sales (name, sale, price) VALUES (?, ?, ?)";
                    PreparedStatement statement2 = connection.prepareStatement(sql2);
                    statement2.setString(1, name);
                    statement2.setInt(2, 0);
                    statement2.setInt(3, price);
                    statement2.executeUpdate();

                    String sql = "INSERT INTO products (name, description, price, qty, image, fabric, fitting, length, width, length2, waistline) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    statement = connection.prepareStatement(sql);
                    statement.setString(1, name);
                    statement.setString(2, desc);
                    statement.setInt(3, price);
                    statement.setInt(4, quan);
                    statement.setBlob(5, inputStream);
                    statement.setString(6, fab);
                    statement.setString(7, fit);
                    statement.setString(8, len);
                    statement.setString(9, wid);
                    statement.setString(10, len2);
                    statement.setString(11, waist);
                    int rowCount = statement.executeUpdate();

                    if (rowCount > 0) {
                    	 request.setAttribute("status", "newProductSuccess");
                    	 dp = request.getRequestDispatcher("addnewform.jsp");
                    	  dp.forward(request, response);
                    } else {
                    	 request.setAttribute("status", "newProductFailed");
                    	 dp = request.getRequestDispatcher("addnewform.jsp");
                    	  dp.forward(request, response);
                    }
                } else {
                	 request.setAttribute("status", "duplicateProduct");
                	 dp = request.getRequestDispatcher("addnewform.jsp");
                	  dp.forward(request, response);
                }
            } else {
            	 request.setAttribute("status", "duplicateProduct");
            	 dp = request.getRequestDispatcher("addnewform.jsp");
            	  dp.forward(request, response);
            }
        
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (pstmt2 != null) {
                    pstmt2.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

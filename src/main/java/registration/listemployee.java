package registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Employee;

@WebServlet("/employeeList")
public class listemployee extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the employee list from the database
        List<Employee> employeeList = getEmployeeData();

        // Add the employee list to the request object
        request.setAttribute("employeeList", employeeList);

        // Forward to the employeeList.jsp page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("employeeList.jsp");
        dispatcher.forward(request, response);
    }

    private List<Employee> getEmployeeData() {
        List<Employee> employeeList = new ArrayList<>();

        try {
            // Replace the database connection details with your own
            String url = "jdbc:mysql://localhost/database?useSSL=false";
            String username = "root";
            String password = "";

            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection con = DriverManager.getConnection(url, username, password);
                 PreparedStatement pst = con.prepareStatement("SELECT * FROM employee");
                 ResultSet rs = pst.executeQuery()) {

                while (rs.next()) {
                    Employee employee = new Employee();
                    employee.setId(rs.getInt("id"));
                    employee.setFirstName(rs.getString("first_name"));
                    employee.setLastName(rs.getString("last_name"));
                    employee.setEmail(rs.getString("email"));
                    employee.setDepartment(rs.getString("department"));
                    employee.setPosition(rs.getString("position"));

                    employeeList.add(employee);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return employeeList;
    }
}

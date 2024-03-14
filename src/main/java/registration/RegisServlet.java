package registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

@WebServlet("/register")
public class RegisServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null && action.equals("update")) {
            updateEmployee(request, response);
        } else if (action != null && action.equals("delete")) {
            deleteEmployee(request, response);
        } else {
            addEmployee(request, response);
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        String agency = request.getParameter("agency");
        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            java.sql.PreparedStatement pst = con.prepareStatement(
                    "insert into employee(first_name,last_name,email,department,position,agency) values(?,?,?,?,?,?) ");
            pst.setString(1, first_name);
            pst.setString(2, last_name);
            pst.setString(3, email);
            pst.setString(4, department);
            pst.setString(5, position);
            pst.setString(6, agency); 

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        doGet(request, response);
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        String agency = request.getParameter("agency"); 
        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            java.sql.PreparedStatement pst = con.prepareStatement(
                    "update employee set first_name=?, last_name=?, email=?, department=?, position=?, agency=? where id=?");
            pst.setString(1, first_name);
            pst.setString(2, last_name);
            pst.setString(3, email);
            pst.setString(4, department);
            pst.setString(5, position);
            pst.setString(6, agency); 
            pst.setInt(7, employeeId);


            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        doGet(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("employeeId"));

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            java.sql.PreparedStatement pst = con.prepareStatement("delete from employee where id=?");
            pst.setInt(1, employeeId);

            int rowCount = pst.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "failed");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            String selectQuery = "SELECT * FROM employee";
            java.sql.PreparedStatement pstSelect = con.prepareStatement(selectQuery);
            ResultSet rs = pstSelect.executeQuery();

            List<Employee> employeeList = new ArrayList<>();

            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setFirstName(rs.getString("first_name"));
                employee.setLastName(rs.getString("last_name"));
                employee.setEmail(rs.getString("email"));
                employee.setDepartment(rs.getString("department"));
                employee.setPosition(rs.getString("position"));
                employee.setAgency(rs.getString("Agency"));
                employeeList.add(employee);
            }

            request.setAttribute("employeeList", employeeList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("registration.jsp");
        dispatcher.forward(request, response);
    }
}

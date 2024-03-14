package registration;

import java.io.IOException;
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

import beans.Agence;

@WebServlet("/agence")
public class AgenceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action != null && action.equals("update")) {
            updateAgence(request, response);
        } else if (action != null && action.equals("delete")) {
            deleteAgence(request, response);
        } else {
            addAgence(request, response);
        }
    }

    private void addAgence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String code_postal = request.getParameter("code_postal");
        String region = request.getParameter("region");

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            java.sql.PreparedStatement pst = con.prepareStatement(
                    "insert into agence(nom, adresse, ville, code_postal, region) values(?, ?, ?, ?, ?)");
            pst.setString(1, nom);
            pst.setString(2, adresse);
            pst.setString(3, ville);
            pst.setString(4, code_postal);
            pst.setString(5, region);

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

    private void updateAgence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int agenceId = Integer.parseInt(request.getParameter("agenceId"));
        String nom = request.getParameter("nom");
        String adresse = request.getParameter("adresse");
        String ville = request.getParameter("ville");
        String code_postal = request.getParameter("code_postal");
        String region = request.getParameter("region");

        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            java.sql.PreparedStatement pst = con.prepareStatement(
                    "update agence set nom=?, adresse=?, ville=?, code_postal=?, region=? where id=?");
            pst.setString(1, nom);
            pst.setString(2, adresse);
            pst.setString(3, ville);
            pst.setString(4, code_postal);
            pst.setString(5, region);
            pst.setInt(6, agenceId);

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

    private void deleteAgence(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String agenceIdParam = request.getParameter("agenceId");
        if (agenceIdParam != null && !agenceIdParam.isEmpty()) {
            int agenceId = Integer.parseInt(agenceIdParam);

            Connection con = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

                java.sql.PreparedStatement pst = con.prepareStatement("delete from agence where id=?");
                pst.setInt(1, agenceId);

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
        } else {
            request.setAttribute("status", "failed");
        }

        doGet(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/stage-project?useSSL=false", "root", "123");

            String selectQuery = "SELECT * FROM agence";
            java.sql.PreparedStatement pstSelect = con.prepareStatement(selectQuery);
            ResultSet rs = pstSelect.executeQuery();

            List<Agence> agenceList = new ArrayList<>();

            while (rs.next()) {
                Agence agence = new Agence();
                agence.setId(rs.getInt("id"));
                agence.setNom(rs.getString("nom"));
                agence.setAdresse(rs.getString("adresse"));
                agence.setVille(rs.getString("ville"));
                agence.setCodePostal(rs.getString("code_postal"));
                agence.setRegion(rs.getString("region"));

                agenceList.add(agence);
            }

            request.setAttribute("agenceList", agenceList);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("agence.jsp");
        dispatcher.forward(request, response);
    }
}

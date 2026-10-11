package com.ucspl;

import java.io.IOException;
import java.io.PrintWriter;

import com.ucspl.util.Config;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Administrator authentication.
 *
 * <p>Credentials are read from external configuration (see {@link Config}),
 * never hard-coded in the source.</p>
 */
public class loginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String ADMIN_USERNAME = Config.get("admin.username", "admin@ucspl");
    private static final String ADMIN_PASSWORD = Config.get("admin.password", "");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("admin.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("userName");
        String pass = request.getParameter("password");

        if (isBlank(name) || isBlank(pass)) {
            showError(request, response, "Please enter user name and password!");
        } else if (name.equalsIgnoreCase(ADMIN_USERNAME) && pass.equals(ADMIN_PASSWORD)) {
            RequestDispatcher rs = request.getRequestDispatcher("admin-dashboard.jsp");
            rs.forward(request, response);
        } else {
            showError(request, response, "Email or Password does not match!");
        }
    }

    private void showError(HttpServletRequest request, HttpServletResponse response, String message)
            throws ServletException, IOException {
        PrintWriter pw = response.getWriter();
        pw.println("<div style='text-align:center;font-size:18px'><font color='red'>"
                + message + "</font></div>");
        RequestDispatcher rs = request.getRequestDispatcher("admin.html");
        rs.include(request, response);
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}

package com.servlet;

import com.common.Constants;
import com.dao.postgres.PostgresAccessor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendCommentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding(Constants.UTF_8);
            response.setContentType("text/html;charset=UTF-8");

            String enqueteId = request.getParameter("enquete-id");
            String nickname = request.getParameter("nickname");
            String icon = request.getParameter("icon");
            String comment = request.getParameter("comment");

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String preSql = "INSERT INTO \"public\".\"comment\" (enquete_id, nickname, icon, \"comment\") VALUES (?, ?, ?, ?);";

            ArrayList<String> holder = new ArrayList<>();
            holder.add(enqueteId);
            holder.add(nickname);
            holder.add(icon);
            holder.add(comment);

            PostgresAccessor pa = new PostgresAccessor();
            pa.write(preSql, holder, "SendComment");

            // フォワード
            response.sendRedirect("/kirakira-name");

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoteServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

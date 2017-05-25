/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.postgres.PostgresAccessor;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naro
 */
@WebServlet(name = "FormServlet", urlPatterns = {"/FormServlet"})
public class FormServlet extends HttpServlet {

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
            String nameKanji = request.getParameter("name-kanji");
            String nameHurigana = request.getParameter("name-hurigana");
            String sex = request.getParameter("sex");
            String inputOneComment = request.getParameter("input-one-comment");

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String sql = "INSERT INTO \"public\".enquete(name_kanji, name_hurigana, sex, short_comment) VALUES ('" + nameKanji + "','" + nameHurigana + "'," + sex + ",'" + inputOneComment + "')";

            PostgresAccessor pa = new PostgresAccessor();
            pa.write(sql);

            // フォワード
            // TODO homeに戻っていいのか
            response.sendRedirect("/NameImageEnquete");

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(VoteServlet.class.getName()).log(Level.SEVERE, null, ex);
            // TODO　エラー時はエラー用のページに飛ばしたい
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

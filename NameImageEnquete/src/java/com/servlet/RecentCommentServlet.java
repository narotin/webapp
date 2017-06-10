/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.postgres.PostgresAccessor;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Naro
 */
public class RecentCommentServlet extends HttpServlet {

    public static final String SEPARATOR = ",";
    public static final int RECORDS_PER_PAGE = 10;
    public static final String UTF_8 = "UTF-8";

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
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");

            ArrayList<String> result = new ArrayList<>();

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String preSql
                    = "SELECT \n"
                    + "comment_id\n"
                    + ", enquete_id\n"
                    + ", nickname\n"
                    + ", icon\n"
                    + ", comment\n"
                    + ", created\n"
                    + "FROM comment\n"
                    + "ORDER BY created DESC\n"
                    + "LIMIT " + "?";

            PostgresAccessor pa = new PostgresAccessor();
            ArrayList<String> holder = new ArrayList<>();
            holder.add(String.valueOf(RECORDS_PER_PAGE));

            //　コメント情報取得
            ArrayList<String> array = pa.read(preSql, holder, "RecentComment", false);

            // 整形
            // 第1:comment_id
            // 第2:enquete_id
            // 第3:nickname
            // 第4:image
            // 第5:comment
            // 第6:created
            for (String str : array) {
                StringBuilder sb1 = new StringBuilder();
                String[] value = str.split(",", 0);
                for (int i = 0; i < 6; i++) {
                    // カンマ区切り
                    if (sb1.length() > 0) {
                        sb1.append(SEPARATOR);
                    }
                    //日付のフォーマット変更
                    if (i == 5) {
                        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        // マイクロ秒を削る
                        String[] withoutMicro = value[i].split("\\.", 0);
                        Date date = sdf1.parse(withoutMicro[0]);
                        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
                        sb1.append(sdf2.format(date));
                    } else {
                        sb1.append(value[i]);
                    }
                }
                System.out.println(sb1.toString());
                result.add(sb1.toString());
            }

            /* requestに設定 */
            // グラフデータ
            request.setAttribute("commentList", result);

            // フォワード
            RequestDispatcher dispatch = request.getRequestDispatcher("RecentComment.jsp");
            dispatch.forward(request, response);

        } catch (ParseException | ClassNotFoundException | SQLException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
            // TODO エラー時はエラー用のページに飛ばしたい
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

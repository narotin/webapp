/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.dao.postgres.PostgresAccessor;
import java.io.IOException;
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
public class HomeServlet extends HttpServlet {

    public static final String SEPARATOR = ",";

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
            response.setContentType("text/html;charset=UTF-8");

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String sql = "SELECT enquete.enquete_id, name_kanji, name_hurigana, sex, count(vote.vote_id), created   FROM enquete LEFT JOIN vote ON enquete.enquete_id=vote.enquete_id GROUP BY enquete.enquete_id ORDER BY created DESC";
            PostgresAccessor pa = new PostgresAccessor();
            ArrayList<String> array = pa.read(sql, false);

            // 整形
            // 第1:enquete_id
            // 第2:name_kanji
            // 第3:name_hurigana
            // 第4:sex
            // 第5:enquete_id毎のコメント数
            // 第6:created
            ArrayList<String> result = new ArrayList<>();
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
                result.add(sb1.toString());
            }

            // requestに設定
            request.setAttribute("enqueteList", result);

            //TODO PostgreSQLからデータ取得
            //フォワード
            RequestDispatcher dispatch = request.getRequestDispatcher("home.jsp");
            dispatch.forward(request, response);

        } catch (ParseException ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
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

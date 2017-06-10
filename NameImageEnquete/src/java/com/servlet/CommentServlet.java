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
public class CommentServlet extends HttpServlet {

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

            String enquete_id = request.getParameter("enquete_id");
            if (enquete_id == null || enquete_id.length() == 0) {
                enquete_id = "0";
            }
            String pageNumber = request.getParameter("pageNumber");
            if (pageNumber == null || pageNumber.length() == 0) {
                pageNumber = "1";
            }

            int offset = (Integer.parseInt(pageNumber) - 1) * RECORDS_PER_PAGE;
            int pages;
            ArrayList<String> result = new ArrayList<>();
            ArrayList<String> result2 = new ArrayList<>();

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String preSql = "SELECT \n"
                    + "enquete.enquete_id\n"
                    + ", name_kanji\n"
                    + ", name_hurigana\n"
                    + ", sex \n"
                    + ", short_comment\n"
                    + ", sum(case when number = 1 then 1 else 0 end) as vote1\n"
                    + ", sum(case when number = 2 then 1 else 0 end) as vote2\n"
                    + ", sum(case when number = 3 then 1 else 0 end) as vote3\n"
                    + ", coalesce(sub.count,'0') as comment_count\n"
                    + ", sum(case when number = 1 or number = 2 or number = 3 then 1 else 0 end) as vote_count\n"
                    + ", enquete.created\n"
                    + "FROM enquete \n"
                    + "LEFT JOIN vote ON enquete.enquete_id=vote.enquete_id\n"
                    + "LEFT JOIN (SELECT enquete_id, count(comment) FROM comment GROUP BY comment.enquete_id) sub ON enquete.enquete_id = sub.enquete_id\n"
                    + "WHERE enquete.enquete_id=" + "?" + "\n"
                    + "GROUP BY enquete.enquete_id, sub.count\n"
                    + "ORDER BY created DESC\n";

            ArrayList<String> holder = new ArrayList<>();
            // 第1:enquete_id
            holder.add(enquete_id);

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String preSql2
                    = "SELECT \n"
                    + "comment_id\n"
                    + ", enquete_id\n"
                    + ", nickname\n"
                    + ", icon\n"
                    + ", comment\n"
                    + ", created\n"
                    + "FROM comment\n"
                    + "WHERE enquete_id=" + "?" + "\n"
                    + "ORDER By created DESC\n"
                    + "LIMIT " + "?" + "\n"
                    + "OFFSET " + "?";

            ArrayList<String> holder2 = new ArrayList<>();

            // 第1:enquete_id
            // 第2:ページ毎のレコード
            // 第3:オフセット
            holder2.add(enquete_id);
            holder2.add(String.valueOf(RECORDS_PER_PAGE));
            holder2.add(String.valueOf(offset));

            // PostgreSQL JDBC 問い合わせ SQL 作成
            String preSql2Count
                    = "SELECT \n"
                    + "comment_id\n"
                    + ", enquete_id\n"
                    + ", nickname\n"
                    + ", icon\n"
                    + ", comment\n"
                    + ", created\n"
                    + "FROM comment\n"
                    + "WHERE enquete_id=" + "?" + "\n"
                    + "ORDER By created ASC\n";

            ArrayList<String> holder3 = new ArrayList<>();

            // 第1:enquete_id
            holder3.add(enquete_id);

            //　①グラフ情報取得
            PostgresAccessor pa = new PostgresAccessor();
            ArrayList<String> array = pa.read(preSql, holder, "CommentG", false);

            // 整形
            // 第1:enquete_id
            // 第2:name_kanji
            // 第3:name_hurigana
            // 第4:sex
            // 第5:short_comment
            // 第6:vote1
            // 第7:vote2
            // 第8:vote3
            // 第9:comment_count
            // 第10:vote_count
            // 第11:created
            for (String str : array) {
                StringBuilder sb1 = new StringBuilder();
                String[] value = str.split(",", 0);
                for (int i = 0; i < 11; i++) {
                    // カンマ区切り
                    if (sb1.length() > 0) {
                        sb1.append(SEPARATOR);
                    }
                    //日付のフォーマット変更
                    if (i == 10) {
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

            //　②コメント情報取得
            ArrayList<String> array2 = pa.read(preSql2, holder2, "CommentL", false);

            // 整形
            // 第1:comment_id
            // 第2:enquete_id
            // 第3:nickname
            // 第4:image
            // 第5:comment
            // 第6:created
            for (String str : array2) {
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
                result2.add(sb1.toString());
            }
            pages = (int) Math.ceil((double) pa.count(preSql2Count, holder3, "Comment") / RECORDS_PER_PAGE);

            if (pages == 0) {
                pages = 1;
            }

            /* requestに設定 */
            // グラフデータ
            request.setAttribute("enqueteList", result);
            // コメントリスト
            request.setAttribute("commentList", result2);
            // ページ数
            request.setAttribute("pages", pages);
            // ページ番号
            request.setAttribute("pageNumber", Integer.parseInt(pageNumber));
            // フォワード
            RequestDispatcher dispatch = request.getRequestDispatcher("Comment.jsp");
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

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
public class SelectRankingServlet extends HttpServlet {

    public static final String SEPARATOR = ",";
    public static final String COLUMN_NAME_VOTE1 = "vote1";
    public static final String COLUMN_NAME_VOTE2 = "vote2";
    public static final String COLUMN_NAME_VOTE3 = "vote3";
    public static final String COLUMN_NAME_COMMENT_COUNT = "comment_count";
    public static final String COLUMN_NAME_VOTE_COUNT = "vote_count";
    public static final String COLUMN_NAME_CREATED = "created";
    public static final int RECORDS_PER_PAGE = 10;

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

            String pageNumber = request.getParameter("pageNumber");
            if (pageNumber == null || pageNumber.length() == 0) {
                pageNumber = "1";
            }
            // rankingType=0はランキングは表示しない。
            String rankingType = request.getParameter("rankingType");
            if (pageNumber == null || pageNumber.length() == 0) {
                rankingType = "0";
            }

            int offset = (Integer.parseInt(pageNumber) - 1) * RECORDS_PER_PAGE;

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
                    + "GROUP BY enquete.enquete_id, sub.count ORDER BY " + "?" + " DESC\n"
                    + "LIMIT " + "?" + "\n"
                    + "OFFSET " + "?";

            ArrayList<String> holder = new ArrayList<>();
            //ここでランキングの種類によってセットするものを変える
            // "1":キラキラでないが多い順
            // "2":どちらともいえないが多い順
            // "3":キラキラであるが多い順
            // "4":投票数が多い順
            // "5":コメント数が多い順
            // "6":投稿日が新しい順
            // その他:投稿日が新しい順           
            if (rankingType.equals("1")) {
                holder.add(COLUMN_NAME_VOTE1);
            } else if (rankingType.equals("2")) {
                holder.add(COLUMN_NAME_VOTE2);
            } else if (rankingType.equals("3")) {
                holder.add(COLUMN_NAME_VOTE3);
            } else if (rankingType.equals("4")) {
                holder.add(COLUMN_NAME_VOTE_COUNT);
            } else if (rankingType.equals("5")) {
                holder.add(COLUMN_NAME_COMMENT_COUNT);
            } else if (rankingType.equals("6")) {
                holder.add(COLUMN_NAME_CREATED);
            } else {
                holder.add(COLUMN_NAME_CREATED);
            }

            holder.add(String.valueOf(RECORDS_PER_PAGE));
            holder.add(String.valueOf(offset));

            PostgresAccessor pa = new PostgresAccessor();
            ArrayList<String> array = pa.read(preSql, holder, "SelectRanking", false);

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
            ArrayList<String> result = new ArrayList<>();
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
                result.add(sb1.toString());
            }

            int pages = (int) Math.ceil((double) pa.count("enquete") / RECORDS_PER_PAGE);

            if (pages == 0) {
                pages = 1;
            }

            /* requestに設定 */
            // 全データ
            request.setAttribute("enqueteList", result);
            // ページ数
            request.setAttribute("pages", pages);
            // ページ番号
            request.setAttribute("pageNumber", Integer.parseInt(pageNumber));

            // フォワード
            RequestDispatcher dispatch = request.getRequestDispatcher("home.jsp");
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

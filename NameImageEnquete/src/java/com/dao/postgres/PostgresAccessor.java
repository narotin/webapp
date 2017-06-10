/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.postgres;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Naro
 */
public class PostgresAccessor {

    public static final String SEPARATOR = ",";
    public static final String DRIVER = "org.postgresql.Driver";
    public static final String DSN = "jdbc:postgresql://192.168.130.104:5432/postgres?user=postgres&password=postgres";

    /**
     *
     * @param preSql sql文を指定
     * @param holder
     * @param headerExist hedaderをreturnのListに含めるかの判定
     * @param type
     * @return
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public ArrayList<String> read(String preSql, List<String> holder, String type, boolean headerExist) throws SQLException, ClassNotFoundException {
        ArrayList<String> header = null;
        ArrayList<String> contents = null;
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (PreparedStatement preSt = con.prepareStatement(preSql)) {

                    //typeに応じて，セットする文字列を変える
                    switch (type) {
                        case "Home":
                        case "Ranking":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                            preSt.setInt(2, Integer.parseInt(holder.get(1)));
                            break;
                        case "NameSearch":
                            preSt.setString(1, "%" + holder.get(0) + "%");
                            preSt.setString(2, "%" + holder.get(1) + "%");
                            preSt.setString(3, "%" + holder.get(2) + "%");
                            preSt.setInt(4, Integer.parseInt(holder.get(3)));
                            preSt.setInt(5, Integer.parseInt(holder.get(4)));
                            break;
                        case "CommentL":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                            preSt.setInt(2, Integer.parseInt(holder.get(1)));
                            preSt.setInt(3, Integer.parseInt(holder.get(2)));
                            break;
                        case "CommentG":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                            break;
                        case "RecentComment":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                        default:
                            break;
                    }

                    // PostgreSQL JDBC レコードセットオープン
                    try (ResultSet rs = preSt.executeQuery()) {
                        contents = new ArrayList<>();
                        // 出力
                        while (rs.next()) {
                            // 初回のみカラム名を格納
                            if (header == null) {
                                header = new ArrayList<>();
                                ResultSetMetaData metaData = rs.getMetaData();
                                int columnCount = metaData.getColumnCount();
                                for (int i = 0; i < columnCount; i++) {
                                    header.add(metaData.getColumnName(i + 1));
                                }
                                // separator区切りheaderに格納
                                if (headerExist) {
                                    StringBuilder sb1 = new StringBuilder();
                                    for (String str : header) {
                                        if (sb1.length() > 0) {
                                            sb1.append(SEPARATOR);
                                        }
                                        sb1.append(str);
                                    }
                                    // separator区切りでcontentsに格納F
                                    contents.add(sb1.toString());
                                }
                            }

                            // データ全取得(カラム名以外)
                            StringBuilder sb2 = new StringBuilder();
                            for (String str : header) {
                                if (sb2.length() > 0) {
                                    sb2.append(SEPARATOR);
                                }
                                sb2.append(rs.getObject(str));
                            }
                            contents.add(sb2.toString());
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostgresAccessor.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return contents;
    }

    /**
     *
     * @param tableName
     * @return
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public int count(String tableName) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM " + tableName;
        int numberOfRow;
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (Statement st = con.createStatement(
                        ResultSet.TYPE_SCROLL_INSENSITIVE,
                        ResultSet.CONCUR_READ_ONLY)) {
                    // PostgreSQL JDBC レコードセットオープン
                    try (ResultSet rs = st.executeQuery(sql)) {
                        // 行数取得
                        rs.last();
                        numberOfRow = rs.getRow();
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostgresAccessor.class
                    .getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return numberOfRow;
    }

    public int count(String preSql, List<String> holder, String type) throws SQLException, ClassNotFoundException {
        ArrayList<String> contents = null;
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (PreparedStatement preSt = con.prepareStatement(preSql)) {

                    //typeに応じて，セットする文字列を変える
                    if (type.equals("NameSearch")) {
                        preSt.setString(1, "%" + holder.get(0) + "%");
                        preSt.setString(2, "%" + holder.get(1) + "%");
                        preSt.setString(3, "%" + holder.get(2) + "%");
                    } else if (type.equals("Comment")) {
                        preSt.setInt(1, Integer.parseInt(holder.get(0)));
                    }

                    // PostgreSQL JDBC レコードセットオープン
                    try (ResultSet rs = preSt.executeQuery()) {
                        contents = new ArrayList<>();
                        // 出力
                        while (rs.next()) {
                            // データ全取得(カラム名以外)
                            StringBuilder sb1 = new StringBuilder();
                            if (sb1.length() > 0) {
                                sb1.append(SEPARATOR);
                            }
                            contents.add(sb1.toString());
                        }
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostgresAccessor.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
        return contents.size();
    }

    /**
     *
     * @param preSql
     * @param holder
     * @param type
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public void write(String preSql, List<String> holder, String type) throws SQLException, ClassNotFoundException {
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (PreparedStatement preSt = con.prepareStatement(preSql)) {
                    //typeに応じて，セットする文字列を変える
                    switch (type) {
                        case "Vote":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                            preSt.setInt(2, Integer.parseInt(holder.get(1)));
                            break;
                        case "SendFormInfo":
                            preSt.setString(1, holder.get(0));
                            preSt.setString(2, holder.get(1));
                            preSt.setInt(3, Integer.parseInt(holder.get(2)));
                            preSt.setString(4, holder.get(3));
                            break;
                        case "SendComment":
                            preSt.setInt(1, Integer.parseInt(holder.get(0)));
                            preSt.setString(2, holder.get(1));
                            preSt.setInt(3, Integer.parseInt(holder.get(2)));
                            preSt.setString(4, holder.get(3));
                            break;
                        default:
                            break;
                    }
                    preSt.executeUpdate();
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostgresAccessor.class
                    .getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }
}

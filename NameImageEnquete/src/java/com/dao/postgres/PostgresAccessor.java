/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao.postgres;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
     * @param sql sql文を指定
     * @param headerExist hedaderをreturnのListに含めるかの判定
     * @return
     * @throws java.sql.SQLException
     * @throws java.lang.ClassNotFoundException
     */
    public ArrayList<String> read(String sql, boolean headerExist) throws SQLException, ClassNotFoundException {
        ArrayList<String> header = null;
        ArrayList<String> contents = null;
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (Statement st = con.createStatement()) {
                    // PostgreSQL JDBC レコードセットオープン
                    try (ResultSet rs = st.executeQuery(sql)) {
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
     * @param sql sql文を指定
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    public void write(String sql) throws SQLException, ClassNotFoundException {
        try {
            // PostgreSQL JDBC ドライバロード
            Class.forName(DRIVER);

            // PostgreSQL JDBC 接続
            try (Connection con = DriverManager.getConnection(DSN)) {
                try (Statement stmt = con.createStatement()) {
                    stmt.executeUpdate(sql);
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PostgresAccessor.class.getName()).log(Level.SEVERE, null, ex);
            throw ex;
        }
    }
}

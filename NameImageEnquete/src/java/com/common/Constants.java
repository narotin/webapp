package com.common;

public final class Constants {

    /* PostgreSQL接続 */
    public static final String DRIVER = "org.postgresql.Driver";
    public static final String DSN = "jdbc:postgresql://192.168.130.104:5432/postgres?user=postgres&password=postgres";

    /* テーブルカラム名 */
    public static final String COLUMN_NAME_VOTE1 = "vote1";
    public static final String COLUMN_NAME_VOTE2 = "vote2";
    public static final String COLUMN_NAME_VOTE3 = "vote3";
    public static final String COLUMN_NAME_COMMENT_COUNT = "comment_count";
    public static final String COLUMN_NAME_VOTE_COUNT = "vote_count";
    public static final String COLUMN_NAME_CREATED = "created";

    /* 区切り文字 */
    public static final String SEPARATOR = ",";

    /* 1ページに出力するレコード数 */
    public static final int RECORDS_PER_PAGE = 10;

    /* 文字コード */
    public static final String UTF_8 = "UTF-8";

}

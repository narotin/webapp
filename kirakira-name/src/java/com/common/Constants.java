package com.common;

public final class Constants {

    /* コンテキストルート */
    public static final String DOMAIN = "";

    /* PostgreSQL接続 */
    public static final String DRIVER = "org.postgresql.Driver";
    // 192.168.130.104がテストIP
    public static final String DSN = "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=postgres";

    /* テーブルカラム名 */
    public static final String COLUMN_NAME_VOTE1 = "vote1";
    public static final String COLUMN_NAME_VOTE2 = "vote2";
    public static final String COLUMN_NAME_VOTE3 = "vote3";
    public static final String COLUMN_NAME_COMMENT_COUNT = "comment_count";
    public static final String COLUMN_NAME_VOTE_COUNT = "vote_count";
    public static final String COLUMN_NAME_CREATED = "created";

    /* 区切り文字 */
    public static final String SEPARATOR = ",";
    public static final String SLASH = "/";

    /* 1ページに出力するレコード数 */
    public static final int RECORDS_PER_PAGE = 10;

    /* 文字コード */
    public static final String UTF_8 = "UTF-8";

    /* サーブレット名 */
    public static final String COMMENT_SERVLET = "comment";
    public static final String CONTRIBUTION_SERVLET = "contributionformt";
    public static final String HOME_SERVLET = "home";
    public static final String NAME_SEARCH_SERVLET = "namesearch";
    public static final String RANKING_SERVLET = "ranking";
    public static final String RECENT_COMMENT_SERVLET = "recentcomment";
    public static final String SEND_COMMENT_SERVLET = "sendcomment";
    public static final String SEND_FORM_INFO_SERVLET = "sendforminfo";
    public static final String VOTE_SERVLET = "vote";

}

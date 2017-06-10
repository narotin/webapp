<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Servletから取得するデータ
    request.setCharacterEncoding("UTF-8");
    ArrayList<String> array = (ArrayList) request.getAttribute("commentList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>title</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/recentcomment.css" />
        <link rel="stylesheet" type="text/css" href="./css/comment.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>

    <body>
        <!-- ページ全体 -->
        <div id="pagebody">
            <!-- タイトル -->
            <div id="title"><h1><a href="./HomeServlet">きらきらねーむ.net</a></h1></div>

            <!-- トップメニュー上ライン -->   
            <div class="topmenu-line"></div>

            <!-- トップメニュー -->
            <ul id="topmenu">
                <li id="topmenu01"><a href="./HomeServlet">ホーム</a></li>
                <li id="topmenu02"><a href="./FormServlet">投稿フォーム</a></li>
                <li id="topmenu03"><a href="./NameSearchServlet">名前検索</a></li>
                <li id="topmenu04"><a href="./RankingServlet">ランキング</a></li>
                <li id="topmenu05"><a href="./RecentCommentServlet">最新コメント</a></li>
            </ul>

            <!-- トップメニュー下ライン -->   
            <div class="topmenu-line"></div>

            <!-- 左サブメニュー -->
            <div id="leftmenu">
                <div id="leftmenu-header">目的で探す</div>
                <ul id="leftmenu-body">
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                    <li><a href="xxx.html">何か</a></li>
                </ul>
            </div>

            <!-- 中央コンテンツ -->
            <div id="recent-comment">
                <p><h2>最新のコメント一覧</h2></p>
                <%
                    for (int i = 0; i < array.size(); i++) {
                        // 整形
                        // 第1:comment_id
                        // 第2:enquete_id
                        // 第3:nickname
                        // 第4:image
                        // 第5:comment
                        // 第6:created
                        String[] value = array.get(i).split(",", 0);
                %>
                <div class="kaiwa">
                    <figure class="kaiwa-img-right">
                        <img src="./images/risu.png" alt="img">
                            <figcaption class="kaiwa-img-description">
                                <%= value[2]%>
                            </figcaption>
                    </figure>
                    <div class="kaiwa-text-left">
                        <p class="kaiwa-text">
                            <%= value[4]%>
                            <br/>
                            <span class="created"><%= value[5]%></span>
                            <br/>
                            <a href="./CommentServlet?enquete_id=<%= value[0]%>" target="_blank">この投票へ飛ぶ</a>
                        </p>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <!-- フッタ -->
        <div id="footer"><small>Copyright (C) 2017 kirakira-name.net All Rights Reserved.</small></div>
        </div>
        </script>
    </body>
</html>
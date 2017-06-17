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
        <title>最新コメント</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/ballooncomment.css" />
        <link rel="stylesheet" type="text/css" href="./css/recentcomment.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-101190909-1', 'auto');
            ga('send', 'pageview');
        </script>
    </head>

    <body>
        <!-- ページ全体 -->
        <div class="pagebody">

            <!-- タイトル -->
            <div class="title"><h1><a href="home">きらきらねーむ.net</a></h1></div>

            <!-- トップメニュー上ライン -->   
            <div class="topmenu-line"></div>

            <!-- トップメニュー -->
            <ul class="topmenu">
                <li class="topmenu01"><a href="home">ホーム</a></li>
                <li class="topmenu02"><a href="contributionform">投稿フォーム</a></li>
                <li class="topmenu03"><a href="namesearch">名前検索</a></li>
                <li class="topmenu04"><a href="ranking">ランキング</a></li>
                <li class="topmenu05"><a href="recentcomment">最新コメント</a></li>
            </ul>

            <!-- トップメニュー下ライン -->   
            <div class="topmenu-line"></div>

            <!-- 左空白ー -->
            <div class="leftmenu03">
                <a href="https://px.a8.net/svt/ejp?a8mat=2TKXMY+4SNQ7M+34VC+65U41" target="_blank" rel="nofollow">
                    <img border="0" width="160" height="600" alt="" src="https://www24.a8.net/svt/bgt?aid=170617930290&wid=001&eno=01&mid=s00000014628001035000&mc=1"></a>
                <img border="0" width="1" height="1" src="https://www15.a8.net/0.gif?a8mat=2TKXMY+4SNQ7M+34VC+65U41" alt=""></img>

                <a href="https://px.a8.net/svt/ejp?a8mat=2TKXMY+4KBNQQ+2XUA+5Z6WX" target="_blank" rel="nofollow">
                    <img border="0" width="160" height="600" alt="" src="https://www24.a8.net/svt/bgt?aid=170617930276&wid=001&eno=01&mid=s00000013717001004000&mc=1"></a>
                <img border="0" width="1" height="1" src="https://www17.a8.net/0.gif?a8mat=2TKXMY+4KBNQQ+2XUA+5Z6WX" alt=""></img>
            </div>

            <!-- 中央コンテンツ -->
            <!-- 最新のコメント一覧 -->
            <div class="recent-comment">
                <h2>最新のコメント一覧</h2>
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
                        String message = null;
                        if (value[4] != null) {
                            message = value[4].replaceAll("\n", "<br/>").replaceAll(" ", "&nbsp;");
                        }
                %>
                <div class="kaiwa">
                    <figure class="kaiwa-img-right">
                        <img src="./images/icon_0<%= value[3]%>.jpeg" alt="img">
                            <figcaption class="kaiwa-img-description">
                                <%= value[2]%>
                            </figcaption>
                    </figure>
                    <div class="kaiwa-text-left">
                        <p class="kaiwa-text">
                            <%= message%>
                            <br/>
                            <span class="created"><%= value[5]%></span>
                            <br/>
                            <span class="recent-comment-link"><a href="comment?enquete_id=<%= value[1]%>" target="_blank">この投票へ飛ぶ</a></span>
                        </p>
                    </div>
                </div>
                <% }%>
            </div>

            <!-- フッタ -->
            <div class="footer"></div>
            </script>
    </body>
</html>
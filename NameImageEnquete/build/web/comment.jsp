<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Servletから取得するデータ
    request.setCharacterEncoding("UTF-8");
    ArrayList<String> array = (ArrayList) request.getAttribute("enqueteList");
    ArrayList<String> array2 = (ArrayList) request.getAttribute("commentList");
    int pages = (Integer) request.getAttribute("pages");
    int pageNumber = (Integer) request.getAttribute("pageNumber");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>title</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/graph.css" />
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
                <li id="topmenu05"><a href="★サーブレット">最新コメント</a></li>
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

            <div id="vote">
                <p><h2>コメント対象の投票</h2></p>
                <%
                    for (int i = 0; i < 1; i++) {
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
                        String[] value = array.get(i).split(",", 0);
                %>
                <div id="vote-center-contents">
                    <!-- 中央コンテンツ　左 -->
                    <div id="vote-center-left">
                        <div id="vote-center-left-upper">
                            <table id="intro" border="1">
                                <thead>
                                    <tr>
                                        <th scope="cols">項目</th>
                                        <th scope="cols">内容</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">ID</th>
                                        <td><%= value[0]%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">名前</th>
                                        <td><%= value[1]%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">ふりがな</th>
                                        <td><%= value[2]%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">性別</th>
                                        <td>
                                            <%
                                                if (value[3].equals("1")) {
                                                    out.println("男");
                                                } else if (value[3].equals("2")) {
                                                    out.println("女");
                                                } else {
                                                    out.println("その他");
                                                }
                                            %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">登録日</th>
                                        <td><%= value[10]%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div id="vote-center-left-middle">
                            <table class="one-comment" border="1" >
                                <thead>
                                    <tr>
                                        <th scope="cols">投稿者一言コメント</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><textarea cols="40" rows="3" readonly><%= value[4]%></textarea></td>
                                    </tr>
                                </tbody>
                            </table>           
                        </div>
                        <div id="vote-center-left-lower">
                            <div id="comment-link">
                                <a href="★サーブレット" target="_blank">コメントする(<%= value[8]%>件)</a>
                            </div>  
                        </div>
                    </div>

                    <!-- 中央コンテンツ 右 -->
                    <div id="vote-center-right">
                        <div id="vote-center-right-upper">
                            <dev id="total">
                                <div align="center">
                                    <p><%= Integer.parseInt(value[9])%>票</p>
                                </div>
                            </dev>  
                            <canvas id=<%= "myChart" + (i + 1)%>></canvas>
                        </div>
                        <div id="vote-center-right-lower">
                            <dev id="btn">
                                <form action="./VoteServlet" method="post">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=1></input>
                                    <input type="submit" value="キラキラネームでない"></input>
                                </form>
                                <form action="./VoteServlet" method="post">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=2></input>
                                    <input type="submit" value="どちらともいえない"></input>
                                </form>
                                <form action="./VoteServlet" method="post">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=3></input>
                                    <input type="submit" value="キラキラネームである"></input>
                                </form>
                            </dev>
                        </div>
                    </div>
                </div>
                <% }%>

                <!-- ここからコメント -->
                <%
                    for (int i = 0; i < array2.size(); i++) {
                        // 整形
                        // 第1:comment_id
                        // 第2:enquete_id
                        // 第3:nickname
                        // 第4:image
                        // 第5:comment
                        // 第6:created
                        String[] value = array2.get(i).split(",", 0);
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
                        </p>
                    </div>
                </div>
                <% }%>
            </div>
            <!-- フッタ -->
            <div id="footer"><small>Copyright (C) 2017 kirakira-name.net All Rights Reserved.</small></div>
        </div>
        <script>
            <%                    for (int i = 0; i < array.size(); i++) {
                    String[] value = array.get(i).split(",", 0);
            %>
            var <%= "ctx" + (i + 1)%> = document.getElementById("<%= "myChart" + (i + 1)%>").getContext('2d');

            <%= "ctx" + (i + 1)%>.canvas.width = 375;
            <%= "ctx" + (i + 1)%>.canvas.height = 420;

            var <%= "myChart" + (i + 1)%> = makeChart(<%= "ctx" + (i + 1)%>, <%= value[5]%>, <%= value[6]%>, <%= value[7]%>);
            <% }%>

            function makeChart(ctx, vote1, vote2, vote3) {
                return new Chart(ctx, {
                    type: 'doughnut',
                    data: {
                        labels: ["キラキラネームでない", "どちらともいえない", "キラキラネームである"],
                        datasets: [{
                                backgroundColor: [
                                    "#6295bf",
                                    "#E0E4CC",
                                    "#FA6900"
                                ],
                                hoverBackgroundColor: [
                                    "#6295bf",
                                    "#E0E4CC",
                                    "#FA6900"
                                ],
                                data: [vote1, vote2, vote3]
                            }]
                    },
                    options: {
                        responsive: false
                    }
                });
            }
        </script>
    </body>
</html>
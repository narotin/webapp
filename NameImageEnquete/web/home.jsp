<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Servletデータ
    request.setCharacterEncoding("UTF-8");
    ArrayList<String> array = (ArrayList) request.getAttribute("enqueteList");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>title</title>
        <link rel="stylesheet" type="text/css" href="./css/home.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    </head>

    <body>
        <!-- ページ全体 -->
        <div id="pagebody">
            <!-- ヘッダ -->
            <div id="header"><h1><a href="index.xhtml">名前アンケート</a></h1></div>

            <!-- トップメニュー上ライン -->   
            <div id="topmenu-line"></div>

            <!-- トップメニュー -->
            <ul id="topmenu">
                <li id="topmenu01"><a href="index.xhtml">ホーム</a></li>
                <li id="topmenu02"><a href="★サーブレット">機能1</a></li>
                <li id="topmenu03"><a href="★サーブレット">機能2</a></li>
                <li id="topmenu04"><a href="★サーブレット">機能3</a></li>
            </ul>

            <!-- トップメニュー下ライン -->   
            <div id="topmenu-line"></div>
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
            <%
                for (int i = 0; i < 10; i++) {
                    // 整形
                    // 第1:enquete_id
                    // 第2:name_kanji
                    // 第3:name_hurigana
                    // 第4:sex
                    // 第5:short_comment
                    // 第6:vote1
                    // 第7:vote2
                    // 第8:vote3
                    // 第9:vote4
                    // 第10:vote5
                    // 第11:comment_count
                    // 第12:created
                    String[] value = array.get(i).split(",", 0);
            %>
            <div id="center-contents">
                <!-- 中央コンテンツ　左 -->
                <div id="center-left">
                    <div id="center-left-upper">
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
                                    <td><%= value[3]%></td>
                                </tr>
                                <tr>
                                    <th scope="row">登録日</th>
                                    <td><%= value[11]%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="center-left-middle">
                        <table id="one-comment" border="1">
                            <thead>
                                <tr>
                                    <th scope="cols">投稿者一言コメント</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><%= value[4]%></td>
                                </tr>
                            </tbody>
                        </table>           
                    </div>
                    <div id="center-left-lower">
                        <div id="comment-link">
                            <a href="★サーブレット" target="_blank">コメントする(<%= value[10]%>件)</a>
                        </div>  
                    </div>
                </div>

                <!-- 中央コンテンツ 右 -->
                <div id="center-right">
                    <div id="center-right-upper">
                        <dev id="total">
                            <div align="center">
                                <p><%= Integer.parseInt(value[5]) + Integer.parseInt(value[6]) + Integer.parseInt(value[7]) + Integer.parseInt(value[8]) + Integer.parseInt(value[9])%>票</p>
                            </div>
                        </dev>  
                        <canvas id=<%= "myChart" + (i + 1)%>></canvas>
                    </div>
                    <div id="center-right-lower">
                        <dev id="btn">
                            <form action="./VoteServlet" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="とても良い"></input>
                            </form>
                            <form action="./VoteServlet"method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=2></input>
                                <input type="submit" value="良い"></input>
                            </form>
                            <form action="./VoteServlet" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=3></input>
                                <input type="submit" value="普通"></input>
                            </form>
                            <form action="./VoteServlet" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=4></input>
                                <input type="submit" value="悪い"></input>
                            </form>
                            <form action="./VoteServlet" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=5></input>
                                <input type="submit" value="とても悪い"></input>
                            </form>
                        </dev>
                    </div>
                </div>
            </div>
            <% }%>

            <!-- フッタ -->
            <div id="footer"><address>Copyright (c) HTMQ All Rights Reserved.</address></div>

            <script>
                <%
                    for (int i = 0; i < 10; i++) {
                        String[] value = array.get(i).split(",", 0);
                %>
                var <%= "ctx" + (i + 1)%> = document.getElementById("<%= "myChart" + (i + 1)%>").getContext('2d');

                <%= "ctx" + (i + 1)%>.canvas.width = 375;
                <%= "ctx" + (i + 1)%>.canvas.height = 420;

                var <%= "myChart" + (i + 1)%> = makeChart(<%= "ctx" + (i + 1)%>, <%= value[5]%>, <%= value[6]%>, <%= value[7]%>, <%= value[8]%>, <%=value[9]%>);
                <% }%>

                function makeChart(ctx, vote1, vote2, vote3, vote4, vote5) {
                    return new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: ["とても良い", "良い", "普通", "悪い", "とても悪い"],
                            datasets: [{
                                    backgroundColor: [
                                        "#6295bf",
                                        "#69D2E7",
                                        "#E0E4CC",
                                        "#F38630",
                                        "#FA6900"
                                    ],
                                    hoverBackgroundColor: [
                                        "#6295bf",
                                        "#69D2E7",
                                        "#E0E4CC",
                                        "#F38630",
                                        "#FA6900"
                                    ],
                                    data: [vote1, vote2, vote3, vote4, vote5]
                                }]
                        },
                        options: {
                            responsive: false
                        }
                    });
                }
            </script>
        </div>
    </body>
</html>
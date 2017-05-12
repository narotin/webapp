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
    <body>
        <canvas id="myChart" width="100" height="100"></canvas>
        <!-- ページ全体 -->
        <div id="pagebody">
            <head>
                <link rel="stylesheet" type="text/css" href="./css/home.css" />
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
                <title>title</title>
            </head>

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
                </ul>
            </div>

            <!-- 中央コンテンツ -->
            <table align="center" border="1" cellpadding="15">
                <!-- ヘッダ名 -->
                <th>ID</th>
                <th>名前(漢字)</th>
                <th>名前(ふりがな)</th>
                <th>性別</th>
                <th>コメント数</th>               
                <th>作成日</th>
                <th>投票</th>
                <!-- TODO10未満の時を考慮 -->
                <% for (int i = 0; i < 10; i++) {%>
                <tr align="center">
                    <%
                        String[] value = array.get(i).split(",", 0);
                    %>
                    <!-- 各情報を出力 -->
                    <% for (int j = 0; j < 6; j++) {%>
                    <td>
                        <%= value[j]%>
                    </td>
                    <% }%>
                    <!-- 投票ボックス -->
                    <td>
                        <canvas id="myChart2" width="1" height="1"></canvas>
                        <dev id="btn">
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="キラキラ"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="元気"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="さわやか"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="明るい"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="かわいい"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="美しい"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="古風"></input>
                            </form>
                        </dev>
                    </td>
                </tr>
                <% }%>
            </table>

            <div id="content">
                <div id="news">
                    <h2>ニュース</h2>
                    <h3>かえるさんのサイトがオープン！！</h3>
                    <p>
                        けろけろ、けろけろ、けろけーろ。（中略）・・と、それはもう大変な喜びようだとか。
                    </p>
                    <canvas id="myChart" width="100" height="100"></canvas>
                    <p><img src="images/ss01.gif" alt="かえるサイトの画面" width="200" height="155" /></p>
                </div>

                <!-- フッタ -->
                <div id="footer"><address>Copyright (c) HTMQ All Rights Reserved.</address></div>
            </div>
        </div>
        <script>

            var ctx2 = document.getElementById("myChart2").getContext('2d');
            var myChart2 = makeChart(10, 20);

            function makeChart(x, y) {
                return new Chart(ctx2, {
                    type: 'doughnut',
                    data: {
                        labels: ["M", "T", "W", "T", "F", "S", "S"],
                        datasets: [{
                                backgroundColor: [
                                    "#2ecc71",
                                    "#3498db",
                                    "#95a5a6",
                                    "#9b59b6",
                                    "#f1c40f",
                                    "#e74c3c",
                                    "#34495e"
                                ],
                                data: [x, x, x, y, y, y, y]
                            }]
                    }
                });
            }
        </script>
    </body>
</html>
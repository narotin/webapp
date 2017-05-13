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
                                    <td>123456</td>
                                </tr>
                                <tr>
                                    <th scope="row">名前</th>
                                    <td>奈良田奈良田奈良田奈</td>
                                </tr>
                                <tr>
                                    <th scope="row">ふりがな</th>
                                    <td>ならたならたならたな</td>
                                </tr>
                                <tr>
                                    <th scope="row">性別</th>
                                    <td>男</td>
                                </tr>
                                <tr>
                                    <th scope="row">登録日</th>
                                    <td>2017/04/05 13:11:22</td>
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
                                    <td>あいうえおかきくけこさしすせそたちつてと</td>
                                </tr>
                            </tbody>
                        </table>           
                    </div>
                    <div id="center-left-lower">
                        <div id="comment-link">
                            <a href="★サーブレット" target="_blank">コメントを見る(1件)</a>
                        </div>  
                    </div>
                </div>

                <!-- 中央コンテンツ 右 -->
                <div id="center-right">
                    <div id="center-right-upper">
                        <canvas id="myChart2"></canvas>
                    </div>
                    <div id="center-right-lower">
                        <dev id="btn">
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=1></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="とても良い"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=1></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="良い"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=1></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="普通"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=1></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="悪い"></input>
                            </form>
                            <form action="★サーブレット" method="post">
                                <input type="hidden" name="enquete_id" value=1></input>
                                <input type="hidden" name="number" value=1></input>
                                <input type="submit" value="とても悪い"></input>
                            </form>
                        </dev>
                    </div>
                </div>
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
            ctx2.canvas.width = 380;
            ctx2.canvas.height = 355;
            var myChart2 = makeChart(10, 20);
            function makeChart(x, y) {
                return new Chart(ctx2, {
                    type: 'doughnut',
                    data: {
                        labels: ["とても良い", "良い", "普通", "悪い", "とても悪い"],
                        datasets: [{
                                backgroundColor: [
                                    "#6295bf",
                                    "#69D2E7",
                                    "#E0E4CC",
                                    "#F38630",
                                    "#FA6900",
                                ],
                                data: [x, x, x, y, y]

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
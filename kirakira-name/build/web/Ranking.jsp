<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Servletから取得するデータ
    request.setCharacterEncoding("UTF-8");
    ArrayList<String> array = (ArrayList) request.getAttribute("enqueteList");
    int pages = (Integer) request.getAttribute("pages");
    int pageNumber = (Integer) request.getAttribute("pageNumber");
    int rankingType = (Integer) request.getAttribute("rankingType");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>ランキング</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/ranking.css" />
        <link rel="stylesheet" type="text/css" href="./css/graph.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
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

            <!-- 左サブメニュー -->
            <div class="leftmenu">
                <div class="leftmenu-header">目的で探す</div>
                <ul class="leftmenu-body">
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
            <!-- ランキング -->
            <div class="ranking">
                <h2>ランキング</h2>
                <ul class="ranking-buttom">
                    <li class="ranking-buttom01"><a href="ranking?rankingType=1">キラキラでないが多い順</a></li>
                    <li class="ranking-buttom02"><a href="ranking?rankingType=2">どちらともいえないが多い順</a></li>
                    <li class="ranking-buttom03"><a href="ranking?rankingType=3">キラキラであるが多い順</a></li>
                </ul>
                <ul class="ranking-buttom">
                    <li class="ranking-buttom04"><a href="ranking?rankingType=4">投票数が多い順</a></li>
                    <li class="ranking-buttom05"><a href="ranking?rankingType=5">コメント数が多い順</a></li>
                    <li class="ranking-buttom06"><a href="ranking?rankingType=6">投稿日が新しい順</a></li>
                </ul>
            </div>

            <!-- rankingTypeが1以上6以下のみグラフ表示 start-->
            <% if (rankingType >= 1 && rankingType <= 6) {%>
            <div class="vote">
                <%
                    // 見出しをタイプ毎に変更
                    if (rankingType == 1) {
                        out.println("<p><h2>キラキラでないが多い順</h2></p>");
                    } else if (rankingType == 2) {
                        out.println("<p><h2>どちらともいえないが多い順</h2></p>");
                    } else if (rankingType == 3) {
                        out.println("<p><h2>キラキラであるが多い順</h2></p>");
                    } else if (rankingType == 4) {
                        out.println("<p><h2>投票数が多い順</h2></p>");
                    } else if (rankingType == 5) {
                        out.println("<p><h2>コメント数が多い順</h2></p>");
                    } else if (rankingType == 6) {
                        out.println("<p><h2>投稿日が新しい順</h2></p>");
                    }

                    for (int i = 0; i < array.size(); i++) {
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
                <div class="vote-center-contents">
                    <!-- 中央コンテンツ　左 -->
                    <div class="vote-center-left">
                        <div class="vote-center-left-upper">
                            <table class="intro" border="1">
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
                        <div class="vote-center-left-middle">
                            <table class="one-comment" border="1" >
                                <thead>
                                    <tr>
                                        <th scope="cols">投稿者一言コメント</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><textarea class="vote-textarea" cols="40" rows="3" readonly><%= value[4]%></textarea></td>
                                    </tr>
                                </tbody>
                            </table>           
                        </div>
                        <div class="vote-center-left-lower">
                            <div class="comment-link">
                                <a href="comment?enquete_id=<%= value[0]%>" target="_blank">コメントする(<%= value[8]%>件)</a>
                            </div>  
                        </div>
                    </div>

                    <!-- 中央コンテンツ 右 -->
                    <div class="vote-center-right">
                        <div class="vote-center-right-upper">
                            <dev class="total">
                                <div align="center">
                                    <p><%= Integer.parseInt(value[9])%>票</p>
                                </div>
                            </dev>  
                            <canvas id=<%= "myChart" + (i + 1)%>></canvas>
                        </div>
                        <div class="vote-center-right-lower">
                            <dev class="btn">
                                <form action="vote" method="post" onsubmit="return checkVote(<%= value[0]%>)">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=1></input>
                                    <input type="submit" value="キラキラネームでない"></input>
                                </form>
                                <form action="vote" method="post" onsubmit="return checkVote(<%= value[0]%>)">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=2></input>
                                    <input type="submit" value="どちらともいえない"></input>
                                </form>
                                <form action="vote" method="post" onsubmit="return checkVote(<%= value[0]%>)">
                                    <input type="hidden" name="enquete_id" value=<%= value[0]%>></input>
                                    <input type="hidden" name="number" value=3></input>
                                    <input type="submit" value="キラキラネームである"></input>
                                </form>
                            </dev>
                        </div>
                    </div>
                </div>
                <% }%>

                <div class="paging">
                    <%
                        int link1 = pageNumber - 2;
                        int link2 = pageNumber - 1;
                        int link3 = pageNumber;
                        int link4 = pageNumber + 1;
                        int link5 = pageNumber + 2;

                        while (link1 <= 0) {
                            link1++;
                            link2++;
                            link3++;
                            link4++;
                            link5++;
                        }

                        if (pageNumber != 1) {
                            out.println("<div class=\"special-page-box\">");
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=1\" class=\"page-link\">" + "最初　<<" + "</a>");
                            out.println("</div>");
                        }

                        if (pages >= link1) {
                            if (link1 == pageNumber) {
                                out.println("<div class=\"current-page-box\">");
                            } else {
                                out.println("<div class=\"page-box\">");
                            }
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + link1 + "\" class=\"page-link\">" + link1 + "</a>");
                            out.println("</div>");
                        }

                        if (pages >= link2) {
                            if (link2 == pageNumber) {
                                out.println("<div class=\"current-page-box\">");
                            } else {
                                out.println("<div class=\"page-box\">");
                            }
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + link2 + "\" class=\"page-link\">" + link2 + "</a>");
                            out.println("</div>");
                        }

                        if (pages >= link3) {
                            if (link3 == pageNumber) {
                                out.println("<div class=\"current-page-box\">");
                            } else {
                                out.println("<div class=\"page-box\">");
                            }
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + link3 + "\" class=\"page-link\">" + link3 + "</a>");
                            out.println("</div>");
                        }

                        if (pages >= link4) {
                            if (link4 == pageNumber) {
                                out.println("<div class=\"current-page-box\">");
                            } else {
                                out.println("<div class=\"page-box\">");
                            }
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + link4 + "\" class=\"page-link\">" + link4 + "</a>");
                            out.println("</div>");
                        }

                        if (pages >= link5) {
                            if (link5 == pageNumber) {
                                out.println("<div class=\"current-page-box\">");
                            } else {
                                out.println("<div class=\"page-box\">");
                            }
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + link5 + "\" class=\"page-link\">" + link5 + "</a>");
                            out.println("</div>");
                        }

                        if (pageNumber != pages) {
                            out.println("<div class=\"special-page-box\">");
                            out.println("<a href=\"ranking?rankingType=" + rankingType + "&" + "pageNumber=" + pages + "\" class=\"page-link\">" + ">>　最後" + "</a>");
                            out.println("</div>");
                        }
                    %>
                </div>
            </div>
            <!-- rankingTypeが1以上6以下のみグラフ表示 end-->
            <% }%>

            <!-- フッタ -->
            <div class="footer"></div>
        </div>
        <script>
            <%
                for (int i = 0; i < array.size(); i++) {
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

            function checkVote(enquete_id) {

                if (getCookie("enquete_id_" + enquete_id) === "voted") {
                    alert("投票から24時間は再投票できません。");
                    return false;
                }

                if (window.confirm('投票しますか?')) {
                    return true;
                } else {
                    return false;
                }
            }

            function getCookie(key) {
                // Cookieから値を取得する
                var cookieString = document.cookie;

                // 要素ごとに ";" で区切られているので、";" で切り出しを行う
                var cookieKeyArray = cookieString.split(";");

                // 要素分ループを行う
                for (var i = 0; i < cookieKeyArray.length; i++) {
                    var targetCookie = cookieKeyArray[i];

                    // 前後のスペースをカットする
                    targetCookie = targetCookie.replace(/^\s+|\s+$/g, "");

                    var valueIndex = targetCookie.indexOf("=");
                    if (targetCookie.substring(0, valueIndex) === key) {
                        // キーが引数と一致した場合、値を返す
                        return unescape(targetCookie.slice(valueIndex + 1));
                    }
                }

                return "";
            }
        </script>
    </body>
</html>
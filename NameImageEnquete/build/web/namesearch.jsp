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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>title</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/form.css" />
        <link rel="stylesheet" type="text/css" href="./css/graph.css" />
        <link rel="stylesheet" type="text/css" href="./css/namesearch.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
                <li id="topmenu03"><a href="./RankingServlet">ランキング</a></li>
                <li id="topmenu04"><a href="★サーブレット">名前検索</a></li>
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
            <div id="name-search">
                <p><h2>名前検索</h2></p>
                <div id="name-search-contents">
                    <p>下記の入力フォームに検索したい名前を入力しよう！</p>
                    <p>入力していないフォームは絞り込み対象外です。</p>
                </div>
                <form name="form1" method="post" action="★サーブレット" class="contact" >
                    <table>
                        <tr>
                            <th><label for="name-kanji">名前(漢字)</label></th>
                            <td class="arbitrary2"></td>
                            <td><span class="supplement">例): 楓</span></br>
                                <input type="text" name="name-kanji" id="name-kanji"></br>
                            </td>
                        </tr>

                        <tr>
                            <th><label for="name-hurigana">名前(ふりがな)</label></th>
                            <td class="arbitrary2"></td>
                            <td><span class="supplement">例): かえで</span></br>
                                <input type="text" name="name-hurigana" id="name-hurigana"></br>
                            </td>
                        </tr>

                        <tr>
                            <th><label for="sex">性別</label></th>
                            <td class="arbitrary2"></td>
                            <td><select name="sex" id="sex">
                                    <option value="0">指定なし</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select></td>
                        </tr>
                    </table>
                    <p class="button"><input id="submit-botton" type="submit" value="検索" /></p>
                </form>
            </div>
            <!-- フッタ -->
            <div id="footer"><small>Copyright (C) 2017 kirakira-name.net All Rights Reserved.</small></div>
        </div>
    </body>
</html>
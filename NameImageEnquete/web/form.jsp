<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <!-- タイトル -->
            <div id="title"><h1><a href="./HomeServlet">きらきらねーむ.net</a></h1></div>

            <!-- トップメニュー上ライン -->   
            <div class="topmenu-line"></div>

            <!-- トップメニュー -->
            <ul id="topmenu">
                <li id="topmenu01"><a href="./HomeServlet">ホーム</a></li>
                <li id="topmenu02"><a href="★サーブレット">投稿フォーム</a></li>
                <li id="topmenu03"><a href="★サーブレット">ランキング</a></li>
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
            <div id="form">
                <p><h2>入力フォーム</h2></p>
                <!--　このような表現はかきかえる CSSで表現する -->
                </ br>
                <form method="post" action="./FormServlet" class="contact">
                    <table>
                        <tbody>
                            <tr>
                                <th><label for="name-kanji">名前(漢字)</label></th>
                                <td class="required"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                                <td><br><input type="text" name="name-kanji" id="name-kanji" size="50"></br>
                                    <span class="supplement">例) 楓</span></td>
                            </tr>

                            <tr>
                                <th><label for="name-hurigana">名前(ふりがな)</label></th>
                                <td class="required"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                                <td><br><input type="text" name="name-hurigana" id="name-hurigana" size="50"></br>
                                    <span class="supplement">例) かえで</span></td>
                            </tr>

                            <tr>
                                <th><label for="sex">性別</label></th>
                                <td class="required"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                                <td><select name="sex" id="sex">
                                        <option value="">性別の選択</option>
                                        <option value="1">男</option>
                                        <option value="2">女</option>
                                    </select></td>
                            </tr>

                            <tr>
                                <th><label for="input-one-comment">一言コメント</label></th>
                                <td class="arbitrary"></td>
                                <td><textarea name="input-one-comment" id="input-one-comment" rows="5" cols="40"></textarea></td>
                            </tr>
                        </tbody>
                    </table>
                    <p class="button"><input type="submit" value="送信"></p>
                </form>
            </div>
            <!-- フッタ -->
            <div id="footer"><address>Copyright (c) HTMQ All Rights Reserved.</address></div>
        </div>
    </body>
</html>
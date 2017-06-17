<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>投稿フォーム</title>
        <link rel="stylesheet" type="text/css" href="./css/common.css" />
        <link rel="stylesheet" type="text/css" href="./css/tablecomp.css" />
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
            <div class="leftmenu02">
                <a href="https://px.a8.net/svt/ejp?a8mat=2TKXMY+4KBNQQ+2XUA+5Z6WX" target="_blank" rel="nofollow">
                    <img border="0" width="160" height="600" alt="" src="https://www24.a8.net/svt/bgt?aid=170617930276&wid=001&eno=01&mid=s00000013717001004000&mc=1"></a>
                <img border="0" width="1" height="1" src="https://www17.a8.net/0.gif?a8mat=2TKXMY+4KBNQQ+2XUA+5Z6WX" alt=""></img>
            </div>

            <!-- 中央コンテンツ -->
            <!-- 入力フォーム -->
            <div class="input-form">
                <h2>入力フォーム</h2>
                <div class="input-form-contents">
                    <p>下記の入力フォームに子供に名付けたい名前を書いて投稿しよう！</p>
                    <p>投稿することで，第三者からの意見を簡単に収集できます。</p>
                </div>
                <form name="form1" method="post" action="sendforminfo" class="contact" onsubmit="return checkInputForm()">
                    <table>
                        <tr>
                            <th><label for="name-kanji">名前(漢字)</label></th>
                            <td class="required01"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                            <td><span class="supplement">例): 楓</span></br>
                                <input type="text" name="name-kanji" id="name-kanji"></br>
                                    <span class="supplement">※10文字以下で入力して下さい。'\+*-_'は使用できません。</span></td>
                        </tr>

                        <tr>
                            <th><label for="name-hurigana">名前(ふりがな)</label></th>
                            <td class="required01"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                            <td><span class="supplement">例): かえで</span></br>
                                <input type="text" name="name-hurigana" id="name-hurigana"></br>
                                    <span class="supplement">※10文字以下で入力して下さい。'\+*-_'は使用できません。</span></td>
                        </tr>

                        <tr>
                            <th><label for="sex">性別</label></th>
                            <td class="required01"><img src="./images/required.gif" alt="必須" width="26" height="15"></td>
                            <td><select name="sex" id="sex">
                                    <option value="0">性別の選択</option>
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select></td>
                        </tr>
                        <tr>
                            <th><label for="one-comment">一言コメント</label></th>
                            <td class="arbitrary01"></td>
                            <td><br><textarea name="one-comment" id="one-comment" rows="5" cols="40"></textarea></br>
                                <span class="supplement">※200文字以下で入力して下さい。</span></td>
                        </tr>
                    </table>
                    <p class="button"><input class="submit-botton" type="submit" value="送信" /></p>
                </form>
            </div>

            <!-- フッタ -->
            <div class="footer"></div>
        </div>
        <script>
            function checkInputForm() {
                var NAME_LIMIT = 10;
                var COMMENT_LIMIT = 200;
                var kanji = document.getElementById('name-kanji').value;
                var kanji_count = document.getElementById('name-kanji').value.length;
                var hurigana = document.getElementById('name-hurigana').value;
                var hurigana_count = document.getElementById('name-hurigana').value.length;
                var sex = document.getElementById('sex').value;
                var comment = document.getElementById('one-comment').value.length;

                console.log(kanji);
                console.log(hurigana);
                console.log(sex);
                console.log(comment);

                if (kanji_count === 0) {
                    alert("名前(漢字)に入力して下さい。");
                    return false;
                } else if (kanji_count > NAME_LIMIT) {
                    alert("名前(漢字)は10文字以下で入力して下さい。");
                    return false;
                } else if (kanji.indexOf('\\') !== -1) {
                    alert("名前(漢字)に禁止文字が含まれています。");
                    return false;
                } else if (kanji.indexOf('+') !== -1) {
                    alert("名前(漢字)に禁止文字が含まれています。");
                    return false;
                } else if (kanji.indexOf('*') !== -1) {
                    alert("名前(漢字)に禁止文字が含まれています。");
                    return false;
                } else if (kanji.indexOf('-') !== -1) {
                    alert("名前(漢字)に禁止文字が含まれています。");
                    return false;
                } else if (kanji.indexOf('_') !== -1) {
                    alert("名前(漢字)に禁止文字が含まれています。");
                    return false;
                } else if (hurigana_count === 0) {
                    alert("名前(ふりがな)に入力して下さい。");
                    return false;
                } else if (hurigana_count > NAME_LIMIT) {
                    alert("名前(ふりがな)は10文字以下で入力して下さい。");
                    return false;
                } else if (hurigana.indexOf('\\') !== -1) {
                    alert("名前(ふりがな)に禁止文字が含まれています。");
                    return false;
                } else if (hurigana.indexOf('+') !== -1) {
                    alert("名前(ふりがな)に禁止文字が含まれています。");
                    return false;
                } else if (hurigana.indexOf('*') !== -1) {
                    alert("名前(ふりがな)に禁止文字が含まれています。");
                    return false;
                } else if (hurigana.indexOf('-') !== -1) {
                    alert("名前(ふりがな)に禁止文字が含まれています。");
                    return false;
                } else if (hurigana.indexOf('_') !== -1) {
                    alert("名前(ふりがな)に禁止文字が含まれています。");
                    return false;
                } else if ((sex !== "1") && (sex !== "2")) {
                    alert("性別を選択して下さい。");
                    return false;
                } else if (comment > COMMENT_LIMIT) {
                    alert("一言コメントは200文字以下で入力して下さい。");
                    return false;
                }

                if (window.confirm('投稿しますか?')) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </body>
</html>
<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <title>user登録画面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div {
            padding: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header"><a class="navbar-brand" href="select.php">データ一覧</a></div>
                <div class="navbar-header"><a class="navbar-brand" href="login.php">ログイン</a></div>
            </div>
        </nav>
    </header>
    <!-- method, action, 各inputのnameを確認してください。  -->
    <form method="POST" action="user_insert.php">
        <div class="jumbotron">
            <fieldset>
                <legend>user登録画面</legend>
                <label>名前：<input type="text" name="name"></label><br>
                <label>ID：<input type="text" name="lid"></label><br>
                <label>パスワード：<input type="text" name="lpw"></label><br>
                <label>管理者：<input type="checkbox" name="kanri_flg" value="1"></label><br>
                <label>平社員：<input type="checkbox" name="kanri_flg" value="0"></label><br>
                <label>退職者：<input type="checkbox" name="life_flg" value="1"></label><br>
                <input type="submit" value="送信">
            </fieldset>
        </div>
    </form>
</body>
</html>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="css/main.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        div {
            padding: 10px;
            font-size: 16px;
        }
    </style>
    <title>ログイン</title>
</head>
<body>
    <header>
        <nav class="navbar navbar-default">ログイン</nav>
    </header>
    <header>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                </div>
            </div>
        </nav>
    </header>
    <!-- lLOGINogin_act.php は認証処理用のPHPです。 -->
    <form name="form1" action="login_act.php" method="post">    
        ID:<input type="text" name="lid" />
        PW:<input type="password" name="lpw" />
        <input type="checkbox" name="kanri_flg" value="1">管理者
        <input type="checkbox" name="kanri_flg" value="0">平社員
        <input type="submit" value="ログイン" />
    </form>
</body>
</html>
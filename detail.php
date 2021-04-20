<?php
require_once('funcs.php');

$pdo = db_conn();

$id = $_GET['id'];
//２．データ登録SQL作成
$stmt = $pdo->prepare('SELECT * FROM gs_bm_table WHERE id=' . $id . ';');
$status = $stmt->execute();
//３．データ表示
$view = '';
if ($status == false) {
    sql_error($status);
} else {
    $result = $stmt->fetch();
}
?>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>データ登録修正</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: bisque;
        }
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
            </div>
        </nav>
    </header>
    <!-- method, action, 各inputのnameを確認してください。  -->
    <form method="POST" action="update.php">
        <div class="jumbotron">
            <fieldset>
            <legend>本データベース</legend>
                <label>ブランド：<input type="text" name="brand" value="<?= $result['brand'] ?>"></label><br>
                <label>品名：<input type="text" name="item" value="<?= $result['item'] ?>"></label><br>
                <label>商品URL：<input type="text" name="image" value="<?= $result['image'] ?>"></label><br>
                <label>価格：<input type="text" name="price" value="<?= $result['price'] ?>"></label><br>
                <label>サイズ：<input type="text" name="size" value="<?= $result['size'] ?>"></label><br>
                <!-- ↓追加 -->
                <input type="hidden" name="id" value="<?= $result['id'] ?>">
                <input type="submit" value="送信">
            </fieldset>
        </div>
    </form>
</body>
</html>
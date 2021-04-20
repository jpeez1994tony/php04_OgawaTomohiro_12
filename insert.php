<?php

session_start();
require_once('funcs.php');
loginCheck();

//1. POSTデータ取得
$brand = $_POST['brand'];
$item = $_POST['item'];
$image = $_POST['image'];
$price = $_POST['price'];
$size = $_POST['size'];

//2. DB接続します
try {
    //ID:'root', Password: 'root'
    $pdo = new PDO('mysql:dbname= gs_db;charset=utf8;host=localhost','root','root');
  } catch (PDOException $e) {
    exit('DBConnectError:'.$e->getMessage());
  }

//３．データ登録SQL作成
$stmt = $pdo->prepare(
    "INSERT INTO
        gs_bm_table(id, brand, item, image, price, size, indate)
    VALUES(
            NULL, :brand, :item, :image, :price, :size, sysdate())"
);
// 数値の場合 PDO::PARAM_INT
// 文字の場合 PDO::PARAM_STR
$stmt->bindValue(':brand', $brand, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':item', $item, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':image', $image, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':price', $price, PDO::PARAM_INT);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':size', $size, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status == false) {
    //*** function化する！******\
    $error = $stmt->errorInfo();
    exit("SQLError:" . print_r($error, true));
} else {
    //*** function化する！*****************
    redirect('index.php');
    //     header("Location: index.php");
//     exit();
}

<?php
//PHP:コード記述/修正の流れ
//1. insert.phpの処理をマルっとコピー。

$brand = $_POST['brand'];
$item = $_POST['item'];
$image = $_POST['image'];
$price = $_POST['price'];
$size = $_POST['size'];
$id = $_POST["id"];

require_once('funcs.php');
$pdo=db_conn();

$stmt = $pdo->prepare(
         "UPDATE 
             gs_bm_table 
            SET 
                brand= :brand,
                item= :item,
                image= :image,
                price= :price,
                size= :size,
                indate = sysdate()
            WHERE
                id = :id
            ;"
        );

$stmt->bindValue(':brand', $brand, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':item', $item, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':image', $image, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':price', $price, PDO::PARAM_INT);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':size', $size, PDO::PARAM_STR);  //Integer（数値の場合 PDO::PARAM_INT)
$stmt->bindValue(':id', $id, PDO::PARAM_INT);
$status = $stmt->execute(); //実行

if ($status == false) {
    //*** function化する！******\
    $error = $stmt->errorInfo();
    exit("SQLError:" . print_r($error, true));
} else {

    redirect('select.php');

}


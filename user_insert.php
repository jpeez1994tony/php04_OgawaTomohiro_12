<?php
require_once('funcs.php');  

//1. POSTデータ取得
$name   = $_POST["name"];
$lid  = $_POST["lid"];
$lpw    = $_POST["lpw"];
$kanri_flg = $_POST["kanri_flg"];
if(kanri_flg == ""){
    $kanri_flag =0;
}
$life_flg = $_POST["life_flg"];
if(life_flg == ""){
    $life_flag =0;
}


//2. DB接続します
$pdo = db_conn();  

// try {
//     $db_name = "gs_db";    //データベース名
//     $db_id   = "root";      //アカウント名
//     $db_pw   = "root";      //パスワード：XAMPPはパスワード無しに修正してください。
//     $db_host = "localhost"; //DBホスト
//     $pdo = new PDO('mysql:dbname=' . $db_name . ';charset=utf8;host=' . $db_host, $db_id, $db_pw);
// } catch (PDOException $e) {
//     exit('DB Connection Error:' . $e->getMessage());
// }

//３．データ登録SQL作成
$stmt = $pdo->prepare("INSERT INTO 
                        gs_user_table(id, name,lid,lpw,kanri_flg,life_flg)
                        VALUES(
                            NULL:name,:lid,:lpw,:kanri_flg,:life_flg)"
                        );

// 数値の場合 PDO::PARAM_INT
// 文字の場合 PDO::PARAM_STR
$stmt->bindValue(':name', $name, PDO::PARAM_STR);
$stmt->bindValue(':lid', $lid, PDO::PARAM_STR);
$stmt->bindValue(':lpw', $lpw, PDO::PARAM_STR);
$stmt->bindValue(':kanri_flg', $kanri_flg, PDO::PARAM_INT);
$stmt->bindValue(':life_flg', $life_flg, PDO::PARAM_INT);

$status = $stmt->execute(); //実行

//４．データ登録処理後
if ($status == false) {
    //*** function化する！******\
    sql_error($stmt);
    // $error = $stmt->errorInfo();
    // exit("SQLError:" . print_r($error, true));
} else {
    //*** function化する！*****************
    redirect('user_select.php');
    // header("Location: index.php");
    // exit();
}
?>

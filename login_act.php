<?php

//最初にSESSIONを開始！！ココ大事！！
session_start();

//POST値を受け取る
$lid = $_POST['lid'];
$lpw = $_POST['lpw'];
$kanri_flg = $_POST['kanri_flag'];

//1.  DB接続します
require_once('funcs.php');
$pdo = db_conn();

//2. データ登録SQL作成
// gs_user_tableに、IDとPWがあるか確認する。
$stmt = $pdo->prepare('SELECT * FROM gs_user_table WHERE lid = :lid AND lpw = :lpw');
$stmt->bindValue(':lid', $lid, PDO::PARAM_STR);
$stmt->bindValue(':lpw', $lpw, PDO::PARAM_STR);
$status = $stmt->execute();

//3. SQL実行時にエラーがある場合STOP
if($status==false){
    sql_error($stmt);
}

//4. 抽出データ数を取得
$val = $stmt->fetch();         //1レコードだけ取得する方法
//$count = $stmt->fetchColumn(); //SELECT COUNT(*)で使用可能()

//5. 該当レコードがあればSESSIONに値を代入
//if(password_verify($lpw, $val['lpw'])){ //* PasswordがHash化の場合はこっちのIFを使う

if($val['kanri_flg'] != $kanri_flg){
        ('location: login.php');
    }

if( $val['id'] != '' ){
    if($val['kanri_flg'] == 1){
        $_SESSION['chk_ssid']  = session_id();
        $_SESSION['name']      = $val['name'];
        header ('location: kanri_list.php');
    }else if($kanri_flg == 0){
        $_SESSION['chk_ssid']  = session_id();
        $_SESSION['name']      = $val['name'];
        header ('location: select.php');
}else {
 header ('location: login.php');
}
}
exit();

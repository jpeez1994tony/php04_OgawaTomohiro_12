"PHP & DB"

	"本日の授業内容"	
"PHP ＆ DB & MySQL"
"•         アジェンダ
前回のおさらい"
"• データベースとは
• データベース作成
• データベース操作
• PHPでデータ登録
• 課題"	
	
	"PHPとJSの違い"
"サーバサイドはリクエストレスポンス"
						"PHP
<?=$view?>
サーバー
HTML
<div>ABC</div>"
	"【クライアントサイド】
HTML, CSS, JavaScript
ブラウザ(PC)上で動作
JS clickしてもブラウザの中で処理"				
			"リクエスト http://****.php/
レスポンス HTMLだけ戻る"	
					
						
"【 PHP:サーバサイド】
clickしたらサーバーとリクエスト/レスポンス"		
		"※ページが必ず読み込まれる仕組みです"	"レスポンスファイルにはPHP⽂字列は無
く、HTMLに置き換わっている状態が届く"	



"バグの確認
•   追加記述したらすぐに確認！！
- ‘echo’
- ‘var_dump’
•   エラーが表示されたら
ファイル名/行数をすぐに確認！！
•   ブラウザ確認は入力画面から！！
登録処理・更新処理・削除処理だけのファイルを表示するとエラーです（これは当然と知る）"

	"データベースとは"
"データベースとは︖
データを⼀定のルールで蓄積し、必要に応じて取り出せるようにしたもの"
"◇データベースはExcelファイルと似てます。
・データベース                    ︓   Excelで⾔うとファイルです。
・テーブル（表）                 ︓   ExcelではSheetです。
・レコード（⾏・ロウ）        ︓   Excelでは横の⾏です。
・フィールド（列・カラム）  ︓   Excelでは縦の列です。"




"データベースと Excel の⽐較"
"◇ Excel の場合
ファイル名  ︓ gs_db
Sheet名      ︓ gs_an_table
項⽬名︓ id （ ユニーク値 [1…max]重複しない値 ）項⽬名︓ name
項⽬名︓ email項⽬名︓ naiyou項⽬名︓ indate"	
	
"◇ データベースの場合
データベース名 ︓ gs_db
テーブル名       ︓ gs_an_table
フィールド名︓ id          int (数値) ユニーク値フィールド名︓ name    varchar(⽂字列)
フィールド名︓ email     varchar（⽂字列）フィールド名︓ naiyou   varchar（⽂字列）フィールド名︓ indate    datetime（⽇付）"	
"テーブルの作成"
"◇ データベースの場合
データベース名 ︓ gs_db
テーブル名       ︓ gs_an_table
フィールド名︓ id          int (数値) ユニーク値フィールド名︓ name    varchar(⽂字列)
フィールド名︓ email     varchar（⽂字列）フィールド名︓ naiyou   text
フィールド名︓ indate    datetime（⽇時）"	
	
"◇ 実際にテーブルを設計するとテーブル名︓  gs_an_table
フィールド名︓
id                 int (12)  PRIMARY KEY : AUTO_INCREMENT
name            varchar (64)
email            varchar（128）
naiyou          text
indate          datetime"	
	"データベース作成"
"Database作成（XAMPP使⽤した場合）
１．最初にデータベースを作成します。http://localhost/xampp/
２． 画⾯に左のメニュー ”phpMyAdmin” を選択
３．『データベース』タブをクリック
４．『データベースを作成する』に半⾓英数で任意のデータベース名、
「gs_db」を⼊⼒し作成。
５．『照合順序』は utf8_unicode_ci を選択。
６．『作成』ボタンで作成。"

"アンケートシステムのDB構築
◇テーブル作成
• DB名:      gs_db
• Table名:  gs_an_table
• Field名:
id:             int(12)   AUTO_INCREMENT PRIMARY_KEY
name :      var_char(64) email :      var_char(128) naiyou :     text
indate:      datetime
※フォームの項⽬を増やした場合こちらのFieldも増やしましょう。
※Fieldの右にあるのは、データ型(Type)です。
http://mysql.akarukutanoshiku.com/category5/entry21.html"

	"データベース操作"
"テーブル基本操作︓データベース⾔語 SQL
MySQLは以下のコマンドを使⽤してデータ登録・更新・削除が可能です。
◇ SQLコマンド（データ操作）
INSERT︓       データを“登録”する事ができます。 SELECT︓       データを“表⽰“する事ができます。 UPDATE︓      データを“更新”する事ができます。 DELETE︓       データを“削除“する事ができます。
◇SQLのコメント
例︓   -- SELECT * FROM テーブル名;
“̶”ハイフンを連続2⽂字並べることで次の⽂字からコメントになります。
◇SQLで⽂字列を扱う
シングルクォートで囲む。ダブルクォートはNG。"

"テーブル基本操作 SQL
■ INSERT（データ登録）
◇書式︓
INSERT INTO テーブル名(カラム１, カラム２,...) VALUES(値１, 値２,...) ;"
"INSERT INTO gs_an_table(id, name, email, naiyou indate) VALUES(NULL, 'ジーズ太郎', 'test1@test.test', 'テスト1','2015-06-15
00:00:00');
INSERT INTO gs_an_table(id, name, email, naiyou, indate) VALUES(NULL, 'ジーズ次郎', 'test2@test.test', 'テスト2', sysdate() );"
"※⽂字列を登録する場合シングルクォートで囲んで指定します。"
"テーブル基本操作 SQL
■ SELECT（データ取得）
◇書式︓
SELECT 表⽰するカラム FROM テーブル名;"
"SELECT * FROM gs_an_table;                  --全指定
SELECT name FROM gs_an_table;            --単体指定 SELECT name, email FROM gs_an_table;      --複数指定"
"SELECT * FROM gs_an_table WHERE name = 'ジーズ太郎';
※WHERE を使⽤して特定のデータを抽出することが可能です。"

"条件付き検索
◇以下条件付きSQLの⼀例）
・演算⼦を使う
SELECT * FROM テーブル名 WHERE id = 1; SELECT * FROM  テーブル名 WHERE id >= 3;
・AND, OR で検索条件を複数指定する
SELECT * FROM  テーブル名 WHERE id = 1 OR id = 2; SELECT * FROM  テーブル名 WHERE id >= 1 AND id<=3;
・ あいまい検索をする
SELECT * FROM  テーブル名 WHERE indate LIKE ʼ2015-06%';
SELECT * FROM  テーブル名 WHERE email LIKE ʼ%@gmail.com'; SELECT * FROM  テーブル名 WHERE email LIKE ʻ%@%';"

"ソートと制限
◇表⽰をソートする
書式︓
SELECT * FROM テーブル名 ORDER BY ソートしたいカラム名 ***; SELECT * FROMテーブル名 ORDER BY id DESC;
SELECT * FROMテーブル名 ORDER BY email, name DESC;
※ DESCは降順でSORT、ASCは昇順でSORT
◇表⽰件数を制限する書式︓
SELECT 表⽰するカラム FROM テーブル名 LIMIT ***;
SELECT * FROM テーブル名 LIMIT 5; SELECT * FROMテーブル名 LIMIT 3, 5;"

	"PHP＆MySQL
データ登録処理"
"PHPからMySQLを操作する⽅法「 PDO 」を知りましょう︕
◇PDOとは︖
PDOは「PHP Data Objects」の略で、PDOを使うことで
「MySQL・SQLite・PostgreSQL」など違うデータベースを利⽤する場合でも、同じ関数で使うことができます。とても便利なものです。（ PDOはPHP5.1以降に標準で装備されました。）
◇プリペアードステートメント
prepare()に”プレースホルダ（挿⼊位置を決めるための⽂字列）”を
⽤いた SQL を渡し、実際の値は bindValue() や bindParam() などで指定します。 SQL⽂内にある”プレースホルダ”に変数をバインド
（代⼊・関連付ける）する際に「値は適切にエスケープ」されます。
※ エスケープ ＝ 無効化する（SQLインジェクション対策）"

"【補⾜】
「 -> 」の記号は…の中の…という意味
------------------------
echo $stmt->queryString;
実⾏したSQLを表⽰出来ます︕"
"$db = new PDO('DB種類名:オプション属性');"
"$dbオブジェクト->prepare()->○○を使う︕"
"①   SQL文字列をqueryStringに保持
$dbオブジェクト->prepare()->queryString;"

"②              bind変数を使いSQLに値を渡す
$dbオブジェクト->prepare()->bindValue()"
"③                                       SQL実⾏
$dbオブジェクト->prepare()->execute()"
"④                                    データ取得
$dbオブジェクト->prepare()->fetch()"


	"PHPとDB接続"	
"データ登録"

"データ登録の流れ
Index.php"
	"登録画面"	
"PHPとデータベースの接続 (データ登録)
◇サンプルコード︓ insert.php
<?php try {
$pdo=new PDO('mysql:dbname=gs_db;charset=utf8;host=localhost','root','');
} catch (PDOException $e) {
exit( 'DbConnectError:' . $e->getMessage() );"
"}
//データ登録SQL作成
$sql=""INSERT INTO gs_an_table ( id, name, email, naiyou, indate ) VALUES( NULL, :a1, :a2, :a3, sysdate() )"";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':a1', 'ジーズ三郎',  PDO:: PARAM_STR);
$stmt->bindValue(':a2', 'test3@test.test',  PDO:: PARAM_STR);
$stmt->bindValue(':a3', 'テスト３',  PDO:: PARAM_STR);
//SQL実⾏
$flag = $stmt->execute();
?>"






	"PHPとDB接続"	
"データ抽出＆表示"
"データ取得の流れ
select.php"
	"データ一覧表示画面
（PHP処理を記述）"	
"PHPとデータベースの接続 (データ取得表⽰)
◇サンプルコード︓ select.php
$stmt   = $pdo->prepare(”SELECT * FROM  gs_an_table"");
$status = $stmt->execute();
$view  = """"; if($status==false) {
$error = $stmt->errorInfo();  //Errorがある場合 exit(""ErrorQuery:"".$error[2]); //配列index[2]にエラーコメントあり
} else {
//Selectデータの数だけ⾃動でループしてくれる
while( $result = $stmt->fetch(PDO::FETCH_ASSOC)){
$view  .= '<p>';
$view  .= $result[""indate""] .""︓"". $result[""name""] ;
$view .= '</p>';"

"}
} //※$view を表⽰したい場所でechoしましょう︕"
"JavaScript&PHP連携"
"(JSON)
(中級レベル)"
"JS/PHPデータ連携例（PHPとJSは同じFile内での記述です）"
"//PHP処理
// ”配列$result”に全てのデータを代⼊できます。
while( $result[] = $stmt->fetch(PDO::FETCH_ASSOC));
$json = json_encode($result);
?>"	
		
"//JavaScript処理
<script>
const data = JSON.parse(ʻ<?=$json?>');  //JSON⽂字列→配列に変換 console.log(data);                                  //配列値の確認
</script>"		
	"課題"

"課題テーブル仕様
本をブックマークするDBを造りましょう！
• DB名:      好きなDB名で新しく作成
• Table名:  gs_bm_table
• 項⽬名:
１．ユニーク値 （int 12 , PRIMARY, AutoIncrement）
２．書籍名         (varChar 64)
３．書籍URL      (text)  //GETパラメータ最大文字数は 2,083 文字
４．書籍コメント(text)
５．登録⽇時      (datetime)"


"課題登録ページ作成
本をブックマークするPHP処理を造りましょう！
• フォーム項⽬名:
１．ユニーク値 （int 12 , PRIMARY, AutoIncrement）
２．書籍名         (varChar 64)"
"３．書籍URL      (text)
４．書籍コメント(t"	"Index.php"
	"e
登録画面"
"５．登録⽇時      (d"	
	"課題提出時"
"課題提出時
Githubにいつもどおりアップするときに下記も対応してくれると嬉しいかもです。"
"課題提出時"
"課題提出時"
"課題提出時"


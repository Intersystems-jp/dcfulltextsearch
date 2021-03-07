## Developer Comunity 日本語コンテンツ全文検索システム
現状のDCの日本語での検索機能は十分とはいえません。
そこでIRISのiFind機能を使った全文検索システムを構築しました。

## 前提条件

このツールを動かすためには、Docker for WindowsまたはDocker for MACをインストールする必要があります。
なお現時点ではM1 Macでは動作しません。

## セットアップ

dcfulltextsearch.zipを適当なディレクトリーにおいて、zipツールで展開します。

Windowsではコマンドプロンプト、MACではターミナルを起動します。

例えば、Windowsでc:\temp\dcfulltextsearchに展開したとすると

```
>cd c:\
>cd temp
>cd dcfulltextsearch
>docker-compose up -d --build

```
を順番に実行してください。

urlに指定するポート番号は、デフォルト62774になっていますが、変更したい場合は、docker-compose.ymlの設定を変更してください。

時間はマシンパワーによりますが、10分強かかります。（今後コンテンツが増えるにつれ、時間はかかるようになると思います）

## アプリケーションの実行方法

IRISの管理ポータルを開きます

ブラウザで以下のurlを指定します。

http://localhost:62774/csp/sys/UtilHome.csp?$NAMESPACE=USER

ユーザー名、パスワードを聞かれるので、

ユーザー名: _system
パスワード: SYS(必ず大文字)

を入力してください

一番左のペインからシステムエクスプローラ>SQLを選択します。

クエリータブを選んで

例えば以下のようなクエリーを実行します。

SELECT id,title,url FROM DC.Topic WHERE %ID %FIND Search_Index(textindex,'ハイパーコンバージド')

urlが長い場合には、途中で折れ曲がりそのままurlをブラウザで指定してもうまくページにたどりつけません。

## 環境の削除

新しくデータをを再ロードするまえには、以下を実行してください。

>cd c:\
>cd temp
>cd dcfulltextsearch
>docker-compose stop
>docker-compose rm
yと答える


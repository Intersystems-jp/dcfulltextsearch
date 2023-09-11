## Developer Community 日本語コンテンツ全文検索システム 
## Developer Community Japanese full-text content search system

- 現状のDCの日本語での検索機能は十分とはいえません。
- そこでIRISのiFind機能を使った全文検索システムを構築しました。
- The current search function of DC in Japanese is not sufficient.
- Therefore, I built a full-text search system using the iFind function of IRIS.

## 前提条件 
## Prerequisites

- このツールを動かすためには、Dockerが必要です。
- WindowsにはDocker for Windows、Macには、Docker for MACをインストールする必要があります。
- M1 Macで動作させるためには、Dockefileを修正してARM64のイメージを使用します。
- In order to run this tool, Docker is required.
- to run this tool, you need to install Docker for Windows, and for Mac, Docker for MAC.
- To make it work on M1 Mac, modify the Dockefile and use the ARM64 image.

## セットアップ 
## Setup

- Windowsではコマンドプロンプト、MACではターミナルを起動します。
- gitでクローンします。
- Start Command Prompt on Windows and Terminal on MAC.
- Clone the files with git.

```
git clone https://github.com/Intersystems-jp/dcfulltextsearch.git
```

- 例えば、Windowsでc:\temp\dcfulltextsearchに展開したとすると
- For example, let's say you extracted to c:\temp\dcfulltextsearch on Windows

```
>cd c:\
>cd temp
>cd dcfulltextsearch
>docker-compose up -d --build

```
- を順番に実行してください。
- run in that order.

- urlに指定するポート番号は、デフォルト52773になっていますが、変更したい場合は、docker-compose.ymlの設定を変更してください。
- The port number you specify for the url defaults to 52773, but if you want to change it, modify the docker-compose.yml

- 時間はマシンパワーによりますが、10分強かかります。（今後コンテンツが増えるにつれ、時間はかかるようになると思います）
- It will take a little over 10 minutes, depending on your machine power. (It will take longer as more content is added in the future.)


## アプリケーションの実行方法 
## How to run the application

- IRISの管理ポータルを開きます
- Open the IRIS management portal.

- ブラウザで以下のurlを指定します。
- In your browser, specify the following url

http://localhost:52773/csp/sys/UtilHome.csp?$NAMESPACE=USER&IRISUsername=_system&IRISPassword=SYS


- 一番左のペインからシステムエクスプローラ>SQLを選択します。
- Select System Explorer > SQL from the leftmost pane.

- クエリータブを選んで
- Select the Queries tab and click

- 例えば以下のようなクエリーを実行します。
- For example, execute the following query

```
SELECT id,title,url FROM DC.Topic WHERE %ID %FIND Search_Index(textindex,'ハイパーコンバージド')
```

- urlが長い場合には、途中で折れ曲がりそのままurlをブラウザで指定してもうまくページにたどりつけません。
- If the url is long, it will be bent in the middle and you will not be able to reach the page by specifying the url as it is in the browser.

## サンプル検索プログラム 
## Sample query program

http://localhost:52773/csp/user/search.csp?IRISUsername=_system&IRISPassword=SYS

## Reactサンプル検索プログラム
## React Sample Program

- 詳細は、reactの下のREADME.mdを参照
- Read README.md under react directory

## 環境の削除 
## Removing the environment

- 新しくデータをを再ロードするまえには、以下を実行してください。
- Before reloading the new data, please do the following

```
>cd c:\
>cd temp
>cd dcfulltextsearch
>docker-compose stop
>docker-compose rm
yと答える
Answer y

```

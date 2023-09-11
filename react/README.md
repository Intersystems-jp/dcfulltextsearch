# reactアプリケーション設定

## react app テンプレート作成

```% npx create-react-app dc --template typescript```

## bootstrapインストール

```% cd dc```

```% npm install react-bootstrap bootstrap```

## react-router-domインストール

```% npm install react-router-dom```

## axios インストール

```% npm install axios```

## ファイルコピー

以下のファイルをここからダウンロード（またはgit clone）し、上で作成したテンプレートディレクトリにコピーする

- public

  index.html

- src

  index.tsx

  App.tsx

  serverconfig.json

 - components

   - Header.tsx
   - Home.tsx
   - Query.tsx
   - TopicList.tsx

 - Hooks
   
   useWindowsSize.ts
   
## serverconfig.jsonの調整

### Private Web Serverの場合

 - IRISサーバーのIPアドレス、ポート番号を反映
 - (IPアドレス = localhost IPポート番号: 52773)
 - Webアプリケーション名
 - （デフォルト　/api/dc）

## reactアプリケーションの起動

- npm start

    Starts the development server.

- npm run build

    Bundles the app into static files for production.

- npm test

    Starts the test runner.

- npm run eject

    Removes this tool and copies build dependencies, configuration files
    and scripts into the app directory. If you do this, you can’t go back!

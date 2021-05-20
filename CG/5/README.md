# 第 5 回課題レポート

JavaScript ライブラリを用いるにはいくつか方法が存在するが、
以下の理由からパッケージマネージャである yarn の使用を選択した。

- ライブラリのアップデートに追従するため
- JavaScript のビルドシステムを使用するため

また、ここではビルドシステムとして [vite](https://github.com/vitejs/vite) を使用した。

以上の理由から、以下のプログラムのインストールが必要である。

- Node.js v14.0 以上
- yarn v1.0 以上

`yarn` を実行し依存パッケージをインストール後、
`yarn dev` を実行し、ブラウザで http://localhost:3000/ を開くとページが表示される。
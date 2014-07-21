
採点用のディレクトリの構成の整形ツール

#使い方

このリポジトリに入っているmake_shell_script.plを動かすと対話状態に入る

```
スクリプト名を入力してください: repo_1_1 (作成したいシェルスクリプト名)
対象ディレクトリを入力してください: report_REP0000000039581_20140721121909(諸々を整形したいディレクトリ)
移動先でのファイル名を入力してください: P11(ディレクトリ内で扱いたいファイルの名前)
拡張子を入力してください: java(ディレクトリで扱いたい拡張子  .は付けない)
コピーしたいファイル名を入力してください: TestHello.class (ディレクトリに配置したいファイル)
-----確認-----
スクリプト名: repo_1_1
対象ディレクトリ: report_REP0000000039581_20140721121909
移動先でのファイル名: P11
拡張子: java
コピーしたいファイル名: TestHello.class
--------------

y?:y (y Y yes Yesで動くはず)
```

動かすと、指定したスクリプト名でシェルスクリプトが作成される

そのシェルスクリプトに

```
chmod +x script

```

とすると実行権限を与えられるので

```
./script

```

と叩くと動く

# feedstockr

複数のRSSフィードをまとめて時系列に表示します。

## Getting Started

Grails 2.4.4 で作成しています。

```
$ grails run-app
```

フィードを登録するページはちゃんと作っていないので、Scaffold画面
```
/feedstockr/feed/create
```
から追加してあげてください。

## Password Authentication

パスワード認証がかかっているフィードについては、
登録時に `withAuth` を `true` にしておくことで
`${userHome}/.grails/Feedstockr.groovy` に設定されている
認証情報を使って取得しようとします。

```Feedstockr.groovy
http.user='authenticator_username'
http.password='authenticator_password'
```

[PasswordAuthentication](https://docs.oracle.com/javase/jp/7/api/java/net/PasswordAuthentication.html)を利用しています。

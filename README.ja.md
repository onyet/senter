<div align="center">

**言語を選択**

言語オプションをクリックして言語を切り替えます。

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md)

</div>

# 懐中電灯アプリ

黄色いバナナのテーマで設計されたシンプルなFlutterベースの懐中電灯アプリ。このアプリは、ユーザーがカメラのフラッシュを光源としてオンにできるようにし、直感的なインターフェースと多言語サポートを提供します。

## 主な機能

- **懐中電灯制御**: カメラのフラッシュをオン/オフする電源ボタン。
- **動的アニメーション**: ライトがオン時のグローとグラデーション効果によるスムーズな遷移。
- **多言語**: 6言語のサポート: インドネシア語、英語、北京語、日本語、ロシア語、アラビア語。
- **AdMob広告**: アプリ退出時のインタースティシャル広告統合で収益化。
- **レスポンシブ**: さまざまな画面サイズと仮想ナビゲーションボタンに適応するデザイン。
- **スプラッシュスクリーン**: OpenMojiアイコン付きのオープニングスクリーン。

<div align="center">

**言語を選択**

言語オプションをクリックして言語を切り替えます。

- [English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md)

</div>

## スクリーンショット

| スクリーンショット 1 | スクリーンショット 2 |
|---------------------|---------------------|
| ![スクリーンショット 1](screenshot/1.jpeg) | ![スクリーンショット 2](screenshot/2.jpeg) |

| スクリーンショット 3 | スクリーンショット 4 |
|---------------------|---------------------|
| ![スクリーンショット 3](screenshot/3.jpeg) | ![スクリーンショット 4](screenshot/4.jpeg) |

## システム要件

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Deployment target 11.0 (必要に応じて)

## アプリの設定

### 1. リポジトリのクローン

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. 依存関係のインストール

Flutterがインストールされ、パスが設定されていることを確認してください。

```bash
flutter pub get
```

### 3. AdMobの設定 (オプション、収益化用)

- [admob.google.com](https://admob.google.com)でAdMobアカウントに登録。
- アプリとインタースティシャル広告ユニットを作成。
- 以下のファイルでアプリIDと広告ユニットを更新:
  - `android/app/src/main/AndroidManifest.xml`: `android:value`をあなたのAdMob App IDに置き換え。
  - `lib/main.dart`: `_loadInterstitialAd()`の`adUnitId`をあなたのインタースティシャルUnit IDに置き換え。

### 4. ローカライズの生成 (必要に応じて)

`lib/l10n/`のARBファイルに変更がある場合、再生成:

```bash
flutter pub run intl_utils:generate
```

### 5. Android用ビルド

```bash
flutter build apk --release
```

またはデバッグ用:

```bash
flutter build apk --debug
```

## アプリの実行

### デバッグモード

```bash
flutter run
```

ターゲットデバイスを選択 (Android/iOSエミュレータまたは物理デバイス)。

### リリースモード

```bash
flutter run --release
```

## 貢献

コミュニティからの貢献を歓迎します！以下の手順に従ってください:

1. このリポジトリをフォーク。
2. 新しい機能ブランチを作成: `git checkout -b new-feature`。
3. 変更を加えてコミット: `git commit -m 'Add new feature'`。
4. ブランチにプッシュ: `git push origin new-feature`。
5. GitHubでPull Requestを作成。

### 貢献ガイドライン

- コードがFlutterスタイルに従っていることを確認 ( `flutter format`を使用)。
- 必要に応じてテストを追加。
- 機能変更時にドキュメントを更新。
- [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)に従う。

## ライセンス

このアプリは[MIT License](LICENSE)でライセンスされています。詳細はLICENSEファイルを参照してください。

## 連絡先

- **開発者**: Dian Mukti Wibowo
- **Email**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Website**: [onyet.id](https://onyet.id)

質問や問題がある場合は、このリポジトリでissueを作成してください。
# Firebase Authentication Flutter Template

マルチ環境対応のFirebase認証テンプレートアプリケーション。

## 機能

- Firebase認証（メール/パスワード）
- マルチ環境対応（開発/ステージング/本番）
- Riverpodを使用した状態管理
- 環境ごとのアプリID設定

## セットアップ

### 1. アプリIDの設定

アプリIDを変更するには、以下のスクリプトを実行します：

```bash
./change_app_id.sh <新しいアプリID>
```

例：
```bash
./change_app_id.sh com.mycompany.myapp
```

このスクリプトは以下の環境用のアプリIDを自動的に設定します：
- 本番環境: com.mycompany.myapp
- ステージング環境: com.mycompany.myapp.stg
- 開発環境: com.mycompany.myapp.dev

### 2. Firebase設定

1. Firebase Consoleで各環境用のプロジェクトを作成
2. 各環境の設定ファイルを以下のディレクトリに配置：
   - 本番環境: `config/firebase/prod/firebase_config.json`
   - ステージング環境: `config/firebase/stg/firebase_config.json`
   - 開発環境: `config/firebase/dev/firebase_config.json`

### 3. 環境別のビルドと実行

開発環境:
```bash
flutter run --flavor dev -t lib/main_dev.dart
```

ステージング環境:
```bash
flutter run --flavor stg -t lib/main_stg.dart
```

本番環境:
```bash
flutter run --flavor prod -t lib/main_prod.dart
```

## プロジェクト構成

```
lib/
├── screens/          # 画面UI実装
├── services/         # Firebase認証サービス
├── providers/        # 状態管理（Riverpod）
├── config/          # 環境設定
├── main_dev.dart    # 開発環境エントリーポイント
├── main_stg.dart    # ステージング環境エントリーポイント
└── main_prod.dart   # 本番環境エントリーポイント

config/
└── firebase/        # Firebase設定ファイル
    ├── dev/
    ├── stg/
    └── prod/
```

## 状態管理

Riverpodを使用して以下の状態を管理：
- 認証状態
- ローディング状態
- エラー状態

## 環境別の設定

各環境で以下の項目が個別に設定可能：
- アプリID
- アプリ名
- Firebase設定
- その他環境固有の設定

## 注意事項

- Firebase設定ファイルは.gitignoreに含まれています
- 環境変数は`flavor_config.dart`で管理されています
- デバッグモードでは現在の環境がバナーで表示されます

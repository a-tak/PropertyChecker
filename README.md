# PropertyChecker スクリプト

DaVinci Resolveのメディアプールで選択したメディア（動画・スチル画像）のプロパティとメタデータを表示するスクリプト。

## 機能

- メディアプールの現在のフォルダ内のメディアファイルを検出
- 各メディアの基本情報を表示（タイプ、フォーマット）
- 詳細プロパティを表示（GetClipProperty）
- 詳細なメタデータ情報を表示（GetMetadata）
  - カメラ情報（メーカー、モデル）
  - レンズ情報
  - その他のEXIFデータ

## インストール方法

1. スクリプトファイルを以下のフォルダに配置：
   ```
   Windows: %APPDATA%\Blackmagic Design\DaVinci Resolve\Support\Fusion\Scripts\Edit
   Mac: ~/Library/Application Support/Blackmagic Design/DaVinci Resolve/Fusion/Scripts/Edit
   Linux: ~/.local/share/DaVinciResolve/Fusion/Scripts/Edit
   ```

2. DaVinci Resolveを再起動

## 使用方法

1. DaVinci Resolveのメディアプールで確認したいスチル画像があるフォルダを選択
2. ワークスペースメニュー > スクリプト > PropertyChecker を選択
3. コンソールに各画像のプロパティとメタデータが表示されます

## 表示される情報

### 基本情報
- クリップ名
- フォーマット

### GetClipPropertyの情報
- ファイル関連の基本プロパティ
- メディアの基本情報
- その他のクリッププロパティ

### GetMetadataの情報
- カメラ情報（製造元、モデル）
- レンズ情報（メーカー、モデル、焦点距離など）
- 撮影設定（ISO、シャッタースピード、絞り値など）
- その他のEXIFメタデータ

## 注意事項

- すべてのメディアタイプに対応
- メタデータの取得にはDaVinci Resolve 17以降が必要
- 一部のメタデータはファイルフォーマットやカメラによって取得できない場合があります

## 技術情報

### 使用しているAPI
- `GetClipProperty()`: 基本的なクリッププロパティの取得
- `GetMetadata()`: 詳細なメタデータの取得

### コードの主要機能
- `printTable()`: テーブル形式のデータを階層的に表示
- メディアプールからのクリップリスト取得
- プロパティとメタデータの再帰的な表示処理

### データの表示形式
- インデントを使用した階層構造
- nil値は「未設定」として表示
- テーブル形式のデータは再帰的に展開

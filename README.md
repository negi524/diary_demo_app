# diary_demo_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## アプリケーション実行

```bash
flutter run
```

## GitHub Pages公開

### 1. ビルド

```bash
flutter build web --base-href "/diary_demo_app/"
```

### 2. 公開用ディレクトリに配置

```bash
rm -rf docs && mv build/web/ docs
```

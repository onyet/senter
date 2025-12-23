<div align="center">

**Choose Language**

Click on a language option to switch languages.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md)

</div>

# Flashlight App

A simple Flutter-based flashlight app designed with a yellow banana theme. This app allows users to turn on the camera flash as a light source, with an intuitive interface and multi-language support.

## Main Features

- **Flashlight Control**: Power button to turn on/off the camera flash.
- **Dynamic Animations**: Smooth transitions with glow and gradient effects when the light is on.
- **Multi-Language**: Support for 6 languages: Indonesian, English, Mandarin, Japanese, Russian, and Arabic.
- **AdMob Ads**: Interstitial ads integration when exiting the app for monetization.
- **Responsive**: Design that adapts to various screen sizes and virtual navigation buttons.
- **Splash Screen**: Opening screen with OpenMoji icon.

## Screenshots

| Screenshot 1 | Screenshot 2 |
|--------------|--------------|
| ![Screenshot 1](screenshot/1.jpeg) | ![Screenshot 2](screenshot/2.jpeg) |

| Screenshot 3 | Screenshot 4 |
|--------------|--------------|
| ![Screenshot 3](screenshot/3.jpeg) | ![Screenshot 4](screenshot/4.jpeg) |

## System Requirements

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Deployment target 11.0 (if required)

## Setting Up the App

### 1. Clone Repository

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. Install Dependencies

Make sure Flutter is installed and the path is configured.

```bash
flutter pub get
```

### 3. Configure AdMob (Optional, for Monetization)

- Sign up for an AdMob account at [admob.google.com](https://admob.google.com).
- Create an app and interstitial ad unit.
- Update the app ID and ad unit in the following files:
  - `android/app/src/main/AndroidManifest.xml`: Replace `android:value` with your AdMob App ID.
  - `lib/main.dart`: Replace `adUnitId` in `_loadInterstitialAd()` with your interstitial Unit ID.

### 4. Generate Localization (If Needed)

If there are changes to ARB files in `lib/l10n/`, regenerate:

```bash
flutter pub run intl_utils:generate
```

### 5. Build for Android

```bash
flutter build apk --release
```

Or for debug:

```bash
flutter build apk --debug
```

## Running the App

### Debug Mode

```bash
flutter run
```

Select the target device (Android/iOS emulator or physical device).

### Release Mode

```bash
flutter run --release
```

## Contributing

We welcome contributions from the community! Follow these steps:

1. Fork this repository.
2. Create a new feature branch: `git checkout -b new-feature`.
3. Make changes and commit: `git commit -m 'Add new feature'`.
4. Push to the branch: `git push origin new-feature`.
5. Create a Pull Request on GitHub.

### Contribution Guidelines

- Ensure code follows Flutter style (use `flutter format`).
- Add tests if necessary.
- Update documentation if features change.
- Follow the [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## License

This app is licensed under the [MIT License](LICENSE). See the LICENSE file for more details.

The app icon (light bulb) from [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) by Sina Schulz, uses the [CC BY-SA 4.0](https://openmoji.org/) license.

## Contact

- **Developer**: Dian Mukti Wibowo
- **Email**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Website**: [onyet.id](https://onyet.id)

If you have questions or issues, please create an issue in this repository.
<div align="center">

**Sprache wählen**

Klicken Sie auf eine Sprachoption, um die Sprachen zu wechseln.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md) | [Deutsch](README.de.md) | [Português](README.pt_BR.md) | [Kiswahili](README.sw.md)

</div>

# Taschenlampen-App

Eine einfache Flutter-basierte Taschenlampen-App, die mit einem gelben Bananen-Thema gestaltet ist. Diese App ermöglicht es Benutzern, das Kamerablitzlicht als Lichtquelle einzuschalten, mit einer intuitiven Benutzeroberfläche und Mehrsprachenunterstützung.

## Hauptmerkmale

- **Taschenlampen-Steuerung**: Power-Taste zum Ein-/Ausschalten des Kamerablitzes.
- **Dynamische Animationen**: Sanfte Übergänge mit Glow- und Gradient-Effekten, wenn das Licht eingeschaltet ist.
- **Mehrsprachig**: Unterstützung für 9 Sprachen: Indonesisch, Englisch, Mandarin, Japanisch, Russisch, Arabisch, Deutsch, Portugiesisch und Swahili.
- **AdMob-Anzeigen**: Integration von Interstitial-Anzeigen beim Beenden der App zur Monetarisierung.
- **Responsiv**: Design, das sich an verschiedene Bildschirmgrößen und virtuelle Navigationsschaltflächen anpasst.
- **Startbildschirm**: Eröffnungsbildschirm mit OpenMoji-Symbol.

## Screenshots

| Screenshot 1 | Screenshot 2 |
|--------------|--------------|
| ![Screenshot 1](screenshot/1.jpeg) | ![Screenshot 2](screenshot/2.jpeg) |

| Screenshot 3 | Screenshot 4 |
|--------------|--------------|
| ![Screenshot 3](screenshot/3.jpeg) | ![Screenshot 4](screenshot/4.jpeg) |

## Systemanforderungen

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Deployment-Ziel 11.0 (falls erforderlich)

## App einrichten

### 1. Repository klonen

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. Abhängigkeiten installieren

Stellen Sie sicher, dass Flutter installiert und der Pfad konfiguriert ist.

```bash
flutter pub get
```

### 3. AdMob-Konfiguration (Optional, für Monetarisierung)

- Erstellen Sie ein AdMob-Konto unter [admob.google.com](https://admob.google.com).
- Erstellen Sie eine App und eine Interstitial-Anzeigeneinheit.
- Aktualisieren Sie die App-ID und Anzeigeneinheit-ID in den folgenden Dateien:
  - `android/app/src/main/AndroidManifest.xml`: Ersetzen Sie `android:value` mit Ihrer AdMob-App-ID.
  - `lib/main.dart`: Ersetzen Sie `adUnitId` in `_loadInterstitialAd()` mit Ihrer Interstitial-Anzeigeneinheit-ID.

### 4. Lokalisierung generieren (falls erforderlich)

Wenn Änderungen an den ARB-Dateien in `lib/l10n/` vorgenommen wurden, generieren Sie erneut:

```bash
flutter pub run intl_utils:generate
```

### 5. Für Android bauen

```bash
flutter build apk --release
```

Oder für Debug:

```bash
flutter build apk --debug
```

## App ausführen

### Debug-Modus

```bash
flutter run
```

Wählen Sie das Zielgerät (Android/iOS-Emulator oder physisches Gerät).

### Release-Modus

```bash
flutter run --release
```

## Mitwirken

Wir freuen uns über Beiträge aus der Community! Folgen Sie diesen Schritten:

1. Forken Sie dieses Repository.
2. Erstellen Sie einen neuen Feature-Branch: `git checkout -b neues-feature`.
3. Nehmen Sie Änderungen vor und committen Sie: `git commit -m 'Neues Feature hinzufügen'`.
4. Pushen Sie zum Branch: `git push origin neues-feature`.
5. Erstellen Sie einen Pull Request auf GitHub.

### Mitwirkungsrichtlinien

- Stellen Sie sicher, dass der Code den Flutter-Stil einhält (verwenden Sie `flutter format`).
- Fügen Sie Tests hinzu, falls erforderlich.
- Aktualisieren Sie die Dokumentation bei Feature-Änderungen.
- Befolgen Sie den [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## Lizenz

Diese App ist unter der [MIT License](LICENSE) lizenziert. Siehe die LICENSE-Datei für Details.

Das App-Symbol (Glühbirne) stammt von [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) von Sina Schulz, verwendet die [CC BY-SA 4.0](https://openmoji.org/) Lizenz.

## Kontakt

- **Entwickler**: Dian Mukti Wibowo
- **E-Mail**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Website**: [onyet.id](https://onyet.id)

Wenn Sie Fragen oder Probleme haben, erstellen Sie bitte ein Issue in diesem Repository.
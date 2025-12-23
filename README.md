
<div align="center">

**Pilih Bahasa**

Klik pilihan bahasa untuk berpindah bahasa.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md)

</div>

# Lampu Senter (Flashlight App)

Aplikasi lampu senter sederhana berbasis Flutter yang dirancang dengan tema pisang kuning. Aplikasi ini memungkinkan pengguna untuk menyalakan lampu flash kamera sebagai sumber cahaya, dengan antarmuka yang intuitif dan mendukung multi-bahasa.

## Fitur Utama

- **Kontrol Lampu Senter**: Tombol power untuk menyalakan/mematikan lampu flash kamera.
- **Animasi Dinamis**: Transisi halus dengan efek glow dan gradient saat lampu menyala.
- **Multi-Bahasa**: Dukungan 6 bahasa: Bahasa Indonesia, English, 中文 (Mandarin), 日本語 (Japanese), Русский (Russian), dan العربية (Arabic).
- **Iklan AdMob**: Integrasi interstitial ads saat keluar aplikasi untuk monetisasi.
- **Responsif**: Desain yang menyesuaikan dengan berbagai ukuran layar dan tombol navigasi virtual.
- **Splash Screen**: Layar pembuka dengan ikon OpenMoji.

## Screenshot

| Screenshot 1 | Screenshot 2 |
|--------------|--------------|
| ![Screenshot 1](screenshot/1.jpeg) | ![Screenshot 2](screenshot/2.jpeg) |

| Screenshot 3 | Screenshot 4 |
|--------------|--------------|
| ![Screenshot 3](screenshot/3.jpeg) | ![Screenshot 4](screenshot/4.jpeg) |

## Persyaratan Sistem

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Deployment target 11.0 (jika diperlukan)

## Menyiapkan Aplikasi

### 1. Clone Repository

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. Install Dependencies

Pastikan Flutter sudah terinstall dan path sudah dikonfigurasi.

```bash
flutter pub get
```

### 3. Konfigurasi AdMob (Opsional, untuk Monetisasi)

- Daftar akun AdMob di [admob.google.com](https://admob.google.com).
- Buat aplikasi dan unit iklan interstitial.
- Update ID aplikasi dan unit iklan di file berikut:
  - `android/app/src/main/AndroidManifest.xml`: Ganti `android:value` dengan App ID AdMob Anda.
  - `lib/main.dart`: Ganti `adUnitId` di `_loadInterstitialAd()` dengan Unit ID interstitial Anda.

### 4. Generate Localization (Jika Diperlukan)

Jika ada perubahan pada file ARB di `lib/l10n/`, generate ulang:

```bash
flutter pub run intl_utils:generate
```

### 5. Build untuk Android

```bash
flutter build apk --release
```

Atau untuk debug:

```bash
flutter build apk --debug
```

## Menjalankan Aplikasi

### Mode Debug

```bash
flutter run
```

Pilih device target (Android/iOS emulator atau perangkat fisik).

### Mode Release

```bash
flutter run --release
```

## Berkontribusi

Kami menyambut kontribusi dari komunitas! Ikuti langkah-langkah berikut:

1. Fork repository ini.
2. Buat branch fitur baru: `git checkout -b fitur-baru`.
3. Lakukan perubahan dan commit: `git commit -m 'Tambah fitur baru'`.
4. Push ke branch: `git push origin fitur-baru`.
5. Buat Pull Request di GitHub.

### Panduan Kontribusi

- Pastikan kode mengikuti style Flutter (gunakan `flutter format`).
- Tambahkan test jika diperlukan.
- Update dokumentasi jika ada perubahan fitur.
- Ikuti [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## Lisensi

Aplikasi ini dilisensikan di bawah [MIT License](LICENSE). Lihat file LICENSE untuk detail lebih lanjut.

Ikon aplikasi (bola lampu) dari [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) oleh Sina Schulz, menggunakan lisensi [CC BY-SA 4.0](https://openmoji.org/).

## Kontak

- **Pengembang**: Dian Mukti Wibowo
- **Email**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Website**: [onyet.id](https://onyet.id)

Jika ada pertanyaan atau masalah, silakan buat issue di repository ini.

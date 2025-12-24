<div align="center">

**Chagua Lugha**

Bonyeza chaguo la lugha ili kubadili lugha.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md) | [Deutsch](README.de.md) | [Português](README.pt_BR.md) | [Kiswahili](README.sw.md)

</div>

# Programu ya Taa ya Mkono

Programu rahisi ya taa ya mkono iliyojengwa na Flutter, iliyoundwa na mandhari ya ndizi ya njano. Programu hii inaruhusu watumiaji kuwasha taa ya kamera kama chanzo cha mwanga, na kiolesura rahisi na usaidizi wa lugha nyingi.

## Vipengele Vikuu

- **Udhibiti wa Taa ya Mkono**: Kitufe cha nguvu cha kuwasha/kuzima taa ya kamera.
- **Michoro ya Nguvu**: Mpito laini na athari za mwanga na gradient wakati taa imewashwa.
- **Lugha Nyingi**: Usaidizi wa lugha 9: Kiindonesia, Kiingereza, Kimandarini, Kijapani, Kirusi, Kiarabu, Kijerumani, Kireno na Kiswahili.
- **Matangazo ya AdMob**: Ujumuishaji wa matangazo ya kuingilia wakati wa kutoka kwenye programu kwa ajili ya kupata mapato.
- **Inayojibu**: Ubunifu unaobadilika kwa ukubwa mbalimbali wa skrini na vifungo vya urambazaji pepe.
- **Skrini ya Kuanza**: Skrini ya ufunguzi na ikoni ya OpenMoji.

## Picha za Skrini

| Picha ya Skrini 1 | Picha ya Skrini 2 |
|-------------------|-------------------|
| ![Picha ya Skrini 1](screenshot/1.jpeg) | ![Picha ya Skrini 2](screenshot/2.jpeg) |

| Picha ya Skrini 3 | Picha ya Skrini 4 |
|-------------------|-------------------|
| ![Picha ya Skrini 3](screenshot/3.jpeg) | ![Picha ya Skrini 4](screenshot/4.jpeg) |

## Mahitaji ya Mfumo

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Lengo la kupeleka 11.0 (ikiwa inahitajika)

## Kuweka Programu

### 1. Nakala Hazina

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. Sakinisha Utegemezi

Hakikisha Flutter imesakinishwa na njia imesanidiwa.

```bash
flutter pub get
```

### 3. Usanidi wa AdMob (Hiari, kwa Mapato)

- Fungua akaunti ya AdMob katika [admob.google.com](https://admob.google.com).
- Unda programu na kitengo cha tangazo la kuingilia.
- Sasisha kitambulisho cha programu na kitengo cha tangazo katika faili zifuatazo:
  - `android/app/src/main/AndroidManifest.xml`: Badilisha `android:value` na kitambulisho cha programu yako ya AdMob.
  - `lib/main.dart`: Badilisha `adUnitId` katika `_loadInterstitialAd()` na kitambulisho cha kitengo cha kuingilia.

### 4. Tengeneza Utafsiri (Ikiwa Inahitajika)

Ikiwa kuna mabadiliko katika faili za ARB katika `lib/l10n/`, tengeneza upya:

```bash
flutter pub run intl_utils:generate
```

### 5. Jenga kwa Android

```bash
flutter build apk --release
```

Au kwa debug:

```bash
flutter build apk --debug
```

## Kuendesha Programu

### Modi ya Debug

```bash
flutter run
```

Chagua kifaa cha lengo (emulator ya Android/iOS au kifaa halisi).

### Modi ya Release

```bash
flutter run --release
```

## Kuchangia

Tunakaribisha michango kutoka jamii! Fuata hatua hizi:

1. Fork hazina hii.
2. Unda tawi jipya la kipengele: `git checkout -b kipengele-kipya`.
3. Fanya mabadiliko na commit: `git commit -m 'Ongeza kipengele kipya'`.
4. Push kwenye tawi: `git push origin kipengele-kipya`.
5. Unda Ombi la Kuvuta kwenye GitHub.

### Miongozo ya Kuchangia

- Hakikisha msimbo unafuata mtindo wa Flutter (tumia `flutter format`).
- Ongeza majaribio ikiwa inahitajika.
- Sasisha nyaraka wakati wa mabadiliko ya vipengele.
- Fuata [Mwongozo wa Mtindo wa Dart](https://dart.dev/guides/language/effective-dart/style).

## Leseni

Programu hii imeidhinishwa chini ya [Leseni ya MIT](LICENSE). Angalia faili ya LICENSE kwa maelezo zaidi.

Ikoni ya programu (taa) inatoka [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) na Sina Schulz, inatumia leseni [CC BY-SA 4.0](https://openmoji.org/).

## Mawasiliano

- **Msanidi**: Dian Mukti Wibowo
- **Barua pepe**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **Tovuti**: [onyet.id](https://onyet.id)

Ikiwa una maswali au matatizo, tafadhali unda suala katika hazina hii.
<div align="center">

**اختر اللغة**

انقر على خيار اللغة لتبديل اللغات.

[English](README.en.md) | [Bahasa Indonesia](README.md) | [Русский](README.ru.md) | [日本語](README.ja.md) | [中文](README.zh.md) | [العربية](README.ar.md) | [Deutsch](README.de.md) | [Português](README.pt_BR.md) | [Kiswahili](README.sw.md)

</div>

# تطبيق المصباح اليدوي

تطبيق مصباح يدوي بسيط مبني على Flutter، مصمم بموضوع موز أصفر. يتيح هذا التطبيق للمستخدمين تشغيل فلاش الكاميرا كمصدر للضوء، مع واجهة سهلة الاستخدام ودعم متعدد اللغات.

## الميزات الرئيسية

- **التحكم في المصباح اليدوي**: زر الطاقة لتشغيل/إيقاف فلاش الكاميرا.
- **الرسوم المتحركة الديناميكية**: انتقالات سلسة مع تأثيرات التوهج والتدرج عند تشغيل الضوء.
- **متعدد اللغات**: دعم 9 لغات: الإندونيسية، الإنجليزية، الماندرين، اليابانية، الروسية، العربية، الألمانية، البرتغالية والسواحلية.
- **إعلانات AdMob**: تكامل إعلانات بين الصفحات عند الخروج من التطبيق للربح.
- **متجاوب**: تصميم يتكيف مع أحجام الشاشات المختلفة وأزرار التنقل الافتراضية.
- **شاشة البداية**: شاشة افتتاحية مع أيقونة OpenMoji.

## لقطات الشاشة

| لقطة شاشة 1 | لقطة شاشة 2 |
|-------------|-------------|
| ![لقطة شاشة 1](screenshot/1.jpeg) | ![لقطة شاشة 2](screenshot/2.jpeg) |

| لقطة شاشة 3 | لقطة شاشة 4 |
|-------------|-------------|
| ![لقطة شاشة 3](screenshot/3.jpeg) | ![لقطة شاشة 4](screenshot/4.jpeg) |

## متطلبات النظام

- Flutter SDK: ^3.10.4
- Dart SDK: ^3.0.0
- Android: minSdkVersion 21 (Android 5.0)
- iOS: Deployment target 11.0 (إذا لزم الأمر)

## إعداد التطبيق

### 1. استنساخ المستودع

```bash
git clone https://github.com/username/senter.git
cd senter
```

### 2. تثبيت التبعيات

تأكد من تثبيت Flutter وتكوين المسار.

```bash
flutter pub get
```

### 3. تكوين AdMob (اختياري، للربح)

- سجل حساب AdMob على [admob.google.com](https://admob.google.com).
- أنشئ تطبيقًا ووحدة إعلان بين الصفحات.
- حدث معرف التطبيق ووحدة الإعلان في الملفات التالية:
  - `android/app/src/main/AndroidManifest.xml`: استبدل `android:value` بمعرف تطبيق AdMob الخاص بك.
  - `lib/main.dart`: استبدل `adUnitId` في `_loadInterstitialAd()` بمعرف وحدة الإعلان البيني الخاص بك.

### 4. إنشاء الترجمة (إذا لزم الأمر)

إذا كانت هناك تغييرات في ملفات ARB في `lib/l10n/`، أعد الإنشاء:

```bash
flutter pub run intl_utils:generate
```

### 5. البناء لـ Android

```bash
flutter build apk --release
```

أو للتصحيح:

```bash
flutter build apk --debug
```

## تشغيل التطبيق

### وضع التصحيح

```bash
flutter run
```

اختر الجهاز المستهدف (محاكي Android/iOS أو جهاز مادي).

### وضع الإصدار

```bash
flutter run --release
```

## المساهمة

نرحب بالمساهمات من المجتمع! اتبع هذه الخطوات:

1. Fork هذا المستودع.
2. أنشئ فرع ميزة جديد: `git checkout -b new-feature`.
3. قم بالتغييرات والالتزام: `git commit -m 'Add new feature'`.
4. ادفع إلى الفرع: `git push origin new-feature`.
5. أنشئ طلب سحب على GitHub.

### إرشادات المساهمة

- تأكد من أن الكود يتبع نمط Flutter (استخدم `flutter format`).
- أضف اختبارات إذا لزم الأمر.
- حدث الوثائق عند تغيير الميزات.
- اتبع [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style).

## الترخيص

هذا التطبيق مرخص بموجب [MIT License](LICENSE). راجع ملف LICENSE للتفاصيل.

أيقونة التطبيق (المصباح) من [OpenMoji](https://openmoji.org/library/emoji-1F4A1/) بواسطة Sina Schulz، تستخدم ترخيص [CC BY-SA 4.0](https://openmoji.org/).

## الاتصال

- **المطور**: Dian Mukti Wibowo
- **البريد الإلكتروني**: onyetcorp@gmail.com
- **WhatsApp**: +6282221874400
- **الموقع**: [onyet.id](https://onyet.id)

إذا كان لديك أسئلة أو مشاكل، يرجى إنشاء issue في هذا المستودع.
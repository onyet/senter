// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Flashlight';

  @override
  String get torchOn => 'Light On';

  @override
  String get torchOff => 'Light Off';

  @override
  String get turnOn => 'Turn On Light';

  @override
  String get turnOff => 'Turn Off Light';

  @override
  String get help => 'Help';

  @override
  String get helpTitle => 'Help';

  @override
  String get appDescription => 'Flashlight App';

  @override
  String get pressButton => 'Press the button to turn on/off the flashlight.';

  @override
  String get support => 'Support:';

  @override
  String get author => 'Dian Mukti Wibowo';

  @override
  String get email => 'Email: onyetcorp@gmail.com';

  @override
  String get whatsapp => 'WhatsApp: +6282221874400';

  @override
  String get website => 'Website: onyet.id';

  @override
  String get close => 'Close';

  @override
  String get language => 'Language';

  @override
  String get torchNotAvailable =>
      'Torch feature is not available on this device.';
}

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flashlight`
  String get appTitle {
    return Intl.message('Flashlight', name: 'appTitle', desc: '', args: []);
  }

  /// `Light On`
  String get torchOn {
    return Intl.message('Light On', name: 'torchOn', desc: '', args: []);
  }

  /// `Light Off`
  String get torchOff {
    return Intl.message('Light Off', name: 'torchOff', desc: '', args: []);
  }

  /// `Turn On Light`
  String get turnOn {
    return Intl.message('Turn On Light', name: 'turnOn', desc: '', args: []);
  }

  /// `Turn Off Light`
  String get turnOff {
    return Intl.message('Turn Off Light', name: 'turnOff', desc: '', args: []);
  }

  /// `Help`
  String get help {
    return Intl.message('Help', name: 'help', desc: '', args: []);
  }

  /// `Help`
  String get helpTitle {
    return Intl.message('Help', name: 'helpTitle', desc: '', args: []);
  }

  /// `Flashlight App`
  String get appDescription {
    return Intl.message(
      'Flashlight App',
      name: 'appDescription',
      desc: '',
      args: [],
    );
  }

  /// `Press the button to turn on/off the flashlight.`
  String get pressButton {
    return Intl.message(
      'Press the button to turn on/off the flashlight.',
      name: 'pressButton',
      desc: '',
      args: [],
    );
  }

  /// `Support:`
  String get support {
    return Intl.message('Support:', name: 'support', desc: '', args: []);
  }

  /// `Dian Mukti Wibowo`
  String get author {
    return Intl.message(
      'Dian Mukti Wibowo',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Email: onyetcorp@gmail.com`
  String get email {
    return Intl.message(
      'Email: onyetcorp@gmail.com',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp: +6282221874400`
  String get whatsapp {
    return Intl.message(
      'WhatsApp: +6282221874400',
      name: 'whatsapp',
      desc: '',
      args: [],
    );
  }

  /// `Website: onyet.id`
  String get website {
    return Intl.message(
      'Website: onyet.id',
      name: 'website',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message('Close', name: 'close', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Torch feature is not available on this device.`
  String get torchNotAvailable {
    return Intl.message(
      'Torch feature is not available on this device.',
      name: 'torchNotAvailable',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:torch_control/torch_control.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/foundation.dart';
import 'generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Locale _locale = const Locale('id'); // Default to Indonesian

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lampu Senter',
      locale: _locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('id'), // Indonesian
        Locale('zh'), // Mandarin
        Locale('ja'), // Japanese
        Locale('ru'), // Russian
        Locale('ar'), // Arabic
        Locale('de'), // German
        Locale('pt', 'BR'), // Portuguese (Brazil)
        Locale('sw'), // Swahili
      ],
      theme: ThemeData(
        primaryColor: const Color(0xFFFFD700), // Yellow banana
        scaffoldBackgroundColor: const Color(0xFFFFF8DC), // Light yellow
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFFD700),
            foregroundColor: Colors.black,
          ),
        ),
      ),
      home: SenterPage(onLocaleChange: _changeLanguage, currentLocale: _locale),
    );
  }
}

class SenterPage extends StatefulWidget {
  final Function(Locale) onLocaleChange;
  final Locale currentLocale;

  const SenterPage({super.key, required this.onLocaleChange, required this.currentLocale});

  @override
  State<SenterPage> createState() => _SenterPageState();
}

class _SenterPageState extends State<SenterPage> with SingleTickerProviderStateMixin {
  bool _isTorchOn = false;
  InterstitialAd? _interstitialAd;
  bool _isAdShowing = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: kDebugMode
          ? 'ca-app-pub-3940256099942544/1033173712' // Test ad unit
          : 'ca-app-pub-7967860040352202/3448155290', // Production ad unit
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('InterstitialAd loaded successfully');
          _interstitialAd = ad;
          _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdShowedFullScreenContent: (ad) {
              debugPrint('Ad showed');
              _isAdShowing = true;
            },
            onAdDismissedFullScreenContent: (ad) {
              debugPrint('Ad dismissed, reloading');
              _isAdShowing = false;
              _interstitialAd!.dispose();
              _loadInterstitialAd(); // Load ulang ad setelah ditutup
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Failed to show interstitial: $error');
              _isAdShowing = false;
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void _toggleTorch() async {
    try {
      if (_isTorchOn) {
        await TorchControl.turnOff();
        _animationController.reverse();
      } else {
        await TorchControl.turnOn();
        _animationController.forward();
      }
      setState(() {
        _isTorchOn = !_isTorchOn;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).torchNotAvailable),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Icons.help_outline, color: Theme.of(context).primaryColor, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    S.of(context).helpTitle,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).appDescription,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.touch_app, color: Colors.blue, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              S.of(context).pressButton,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.support, color: Colors.green, size: 20),
                          const SizedBox(width: 10),
                          Text(
                            S.of(context).support,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.person, color: Colors.purple),
                        title: const Text('Dian Mukti Wibowo'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.red),
                        title: const Text('onyetcorp@gmail.com'),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.green),
                        title: const Text('+6282221874400'),
                      ),
                      ListTile(
                        leading: Icon(Icons.web, color: Colors.blue),
                        title: const Text('onyet.id'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                ),
                child: Text(S.of(context).close),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).language),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('🇺🇸 English'),
              onTap: () {
                widget.onLocaleChange(const Locale('en'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇮🇩 Bahasa Indonesia'),
              onTap: () {
                widget.onLocaleChange(const Locale('id'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇨🇳 中文'),
              onTap: () {
                widget.onLocaleChange(const Locale('zh'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇯🇵 日本語'),
              onTap: () {
                widget.onLocaleChange(const Locale('ja'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇷🇺 Русский'),
              onTap: () {
                widget.onLocaleChange(const Locale('ru'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇸🇦 العربية'),
              onTap: () {
                widget.onLocaleChange(const Locale('ar'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇩🇪 Deutsch'),
              onTap: () {
                widget.onLocaleChange(const Locale('de'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇧🇷 Português'),
              onTap: () {
                widget.onLocaleChange(const Locale('pt', 'BR'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('🇹🇿 Kiswahili'),
              onTap: () {
                widget.onLocaleChange(const Locale('sw'));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        debugPrint('onWillPop called, ad: $_interstitialAd, showing: $_isAdShowing');
        if (_interstitialAd != null && !_isAdShowing) {
          _isAdShowing = true;
          _interstitialAd!.show();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).appTitle),
          backgroundColor: const Color(0xFFFFD700),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () => _showLanguageDialog(context),
            ),
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: () => _showHelp(context),
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: _isTorchOn
                        ? [const Color(0xFFFFD700), const Color(0xFFFFF8DC)]
                        : [const Color(0xFF2C2C2C), const Color(0xFF1A1A1A)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: _isTorchOn
                          ? [const Color(0xFFFFD700), const Color(0xFFFFA500)]
                          : [const Color(0xFF424242), const Color(0xFF212121)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: _isTorchOn ? Colors.white.withOpacity(0.8) : Colors.grey.withOpacity(0.5),
                      width: 4,
                    ),
                    boxShadow: _isTorchOn
                        ? [
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.8),
                              spreadRadius: 20,
                              blurRadius: 30,
                              offset: const Offset(0, 0),
                            ),
                            BoxShadow(
                              color: Colors.yellow.withOpacity(0.4),
                              spreadRadius: 10,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                          ]
                        : [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                  ),
                  child: InkWell(
                    onTap: _toggleTorch,
                    borderRadius: BorderRadius.circular(75),
                    child: Icon(
                      Icons.power_settings_new,
                      size: 80,
                      color: _isTorchOn ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 20,
                right: 20,
                child: AnimatedOpacity(
                  opacity: _opacityAnimation.value,
                  duration: const Duration(milliseconds: 500),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _isTorchOn ? Colors.black.withOpacity(0.7) : Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _isTorchOn ? Colors.yellow : Colors.white,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isTorchOn ? Icons.flashlight_on : Icons.flashlight_off,
                              color: Colors.white,
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                _isTorchOn
                                    ? S.of(context).torchOn
                                    : S.of(context).torchOff,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                S.of(context).pressButton,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

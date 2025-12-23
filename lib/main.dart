import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:torch_control/torch_control.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test ad unit
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void _toggleTorch() async {
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
  }

  void _showHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).helpTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).appDescription),
            const SizedBox(height: 10),
            Text(S.of(context).pressButton),
            const SizedBox(height: 10),
            Text(S.of(context).support),
            Text(S.of(context).author),
            Text(S.of(context).email),
            Text(S.of(context).whatsapp),
            Text(S.of(context).website),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(S.of(context).close),
          ),
        ],
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
              title: const Text('English'),
              onTap: () {
                widget.onLocaleChange(const Locale('en'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Bahasa Indonesia'),
              onTap: () {
                widget.onLocaleChange(const Locale('id'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('中文'),
              onTap: () {
                widget.onLocaleChange(const Locale('zh'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('日本語'),
              onTap: () {
                widget.onLocaleChange(const Locale('ja'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('Русский'),
              onTap: () {
                widget.onLocaleChange(const Locale('ru'));
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text('العربية'),
              onTap: () {
                widget.onLocaleChange(const Locale('ar'));
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
        if (_interstitialAd != null) {
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
        body: AnimatedContainer(
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Icon(
                        _isTorchOn ? Icons.flashlight_on : Icons.flashlight_off,
                        size: 120,
                        color: _isTorchOn ? Colors.yellowAccent : Colors.grey,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                AnimatedOpacity(
                  opacity: _opacityAnimation.value,
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    _isTorchOn
                        ? S.of(context).torchOn
                        : S.of(context).torchOff,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: _isTorchOn ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                InkWell(
                  onTap: _toggleTorch,
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: _isTorchOn
                            ? [const Color(0xFFFFD700), const Color(0xFFFFA500)]
                            : [const Color(0xFF424242), const Color(0xFF212121)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: _isTorchOn ? Colors.yellow.withOpacity(0.5) : Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Text(
                      _isTorchOn
                          ? S.of(context).turnOff
                          : S.of(context).turnOn,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: _isTorchOn ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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

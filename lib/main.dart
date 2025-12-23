import 'package:flutter/material.dart';
import 'package:torch_control/torch_control.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lampu Senter',
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
      home: const SenterPage(),
    );
  }
}

class SenterPage extends StatefulWidget {
  const SenterPage({super.key});

  @override
  State<SenterPage> createState() => _SenterPageState();
}

class _SenterPageState extends State<SenterPage> {
  bool _isTorchOn = false;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    _loadInterstitialAd();
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
    } else {
      await TorchControl.turnOn();
    }
    setState(() {
      _isTorchOn = !_isTorchOn;
    });
  }

  void _showHelp() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bantuan'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aplikasi Lampu Senter'),
            SizedBox(height: 10),
            Text('Tekan tombol untuk menyalakan/mematikan lampu senter.'),
            SizedBox(height: 10),
            Text('Support:'),
            Text('Dian Mukti Wibowo'),
            Text('Email: onyetcorp@gmail.com'),
            Text('WhatsApp: +6282221874400'),
            Text('Website: onyet.id'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tutup'),
          ),
        ],
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
          title: const Text('Lampu Senter'),
          backgroundColor: const Color(0xFFFFD700),
          actions: [
            IconButton(
              icon: const Icon(Icons.help_outline),
              onPressed: _showHelp,
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _isTorchOn ? Icons.flashlight_on : Icons.flashlight_off,
                size: 100,
                color: _isTorchOn ? Colors.yellow : Colors.grey,
              ),
              const SizedBox(height: 20),
              Text(
                _isTorchOn ? 'Lampu Menyala' : 'Lampu Mati',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _toggleTorch,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  _isTorchOn ? 'Matikan Lampu' : 'Nyalakan Lampu',
                  style: const TextStyle(fontSize: 18),
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
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../data/translations.dart';
import '../widgets/language_picker.dart';
import 'main_game_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch gs so screen rebuilds when language changes
    context.watch<GameState>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: [Color(0xFFFDF4E3), Color(0xFFF5E6C0), Color(0xFFEDD5A0)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 28),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              // Language picker top right
              Align(
                alignment: Alignment.centerRight,
                child: const LanguagePickerButton(),
              ),
              const SizedBox(height: 20),
              // Lamp
              Container(
                width: 92, height: 92,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(colors: [Color(0xFFE8956D), AppTheme.clay]),
                  boxShadow: [BoxShadow(color: AppTheme.clay.withOpacity(0.4), blurRadius: 28, offset: const Offset(0, 6))],
                ),
                child: const Center(child: Text('🪔', style: TextStyle(fontSize: 44))),
              ),
              const SizedBox(height: 22),
              Text(Tr.get('app_name'), style: AppTheme.display(28, color: AppTheme.clayDark), textAlign: TextAlign.center),
              const SizedBox(height: 6),
              Text(Tr.get('tagline'), style: AppTheme.body(15, color: AppTheme.inkSoft), textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(Tr.get('pitch'), style: AppTheme.body(13.5, color: AppTheme.clay), textAlign: TextAlign.center),
              const SizedBox(height: 28),
              Wrap(
                spacing: 8, runSpacing: 8, alignment: WrapAlignment.center,
                children: [
                  _Chip(Tr.get('chip_jars')),    _Chip(Tr.get('chip_scam')),
                  _Chip(Tr.get('chip_events')),  _Chip(Tr.get('chip_offline')),
                  _Chip(Tr.get('chip_voice')),   _Chip(Tr.get('chip_badges')),
                ],
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<GameState>().resetForNewGame();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const MainGameScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    backgroundColor: AppTheme.clay,
                    elevation: 4, shadowColor: AppTheme.clay.withOpacity(0.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text(Tr.get('start_game'), style: AppTheme.display(17, color: Colors.white)),
                ),
              ),
              const SizedBox(height: 16),
              Text(Tr.get('team'), style: AppTheme.body(12, color: AppTheme.inkMuted)),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip(this.label);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 6),
    decoration: BoxDecoration(
      color: AppTheme.clay.withOpacity(0.10),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: AppTheme.clay.withOpacity(0.28)),
    ),
    child: Text(label, style: AppTheme.body(12.5, color: AppTheme.clayDark, weight: FontWeight.w500)),
  );
}

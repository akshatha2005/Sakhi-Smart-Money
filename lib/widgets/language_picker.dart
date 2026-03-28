import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';

class LanguagePickerButton extends StatelessWidget {
  const LanguagePickerButton({super.key});

  static const _langs = [
    {'code': 'en', 'label': 'English', 'native': 'English', 'flag': '🇬🇧'},
    {'code': 'hi', 'label': 'Hindi',   'native': 'हिंदी',    'flag': '🇮🇳'},
    {'code': 'kn', 'label': 'Kannada', 'native': 'ಕನ್ನಡ',    'flag': '🏳️'},
  ];

  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    final current = _langs.firstWhere((l) => l['code'] == gs.language, orElse: () => _langs[0]);

    return GestureDetector(
      onTap: () => _showPicker(context, gs),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppTheme.warmBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.border),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(current['flag']!, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 5),
          Text(current['native']!, style: AppTheme.display(12, color: AppTheme.inkSoft)),
          const SizedBox(width: 4),
          const Icon(Icons.keyboard_arrow_down_rounded, size: 16, color: AppTheme.inkMuted),
        ]),
      ),
    );
  }

  void _showPicker(BuildContext context, GameState gs) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppTheme.paper,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          // Handle bar
          Container(width: 40, height: 4, decoration: BoxDecoration(
            color: AppTheme.border, borderRadius: BorderRadius.circular(2),
          )),
          const SizedBox(height: 18),
          Text('Choose Language / भाषा चुनें / ಭಾಷೆ ಆರಿಸಿ',
            style: AppTheme.display(16), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ..._langs.map((lang) {
            final isSelected = gs.language == lang['code'];
            return GestureDetector(
              onTap: () {
                gs.setLanguage(lang['code']!);
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isSelected ? AppTheme.clay.withOpacity(0.08) : AppTheme.cream,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: isSelected ? AppTheme.clay : AppTheme.border,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Row(children: [
                  Text(lang['flag']!, style: const TextStyle(fontSize: 28)),
                  const SizedBox(width: 14),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(lang['native']!, style: AppTheme.display(17)),
                    Text(lang['label']!, style: AppTheme.body(13, color: AppTheme.inkSoft)),
                  ])),
                  if (isSelected)
                    const Icon(Icons.check_circle_rounded, color: AppTheme.clay, size: 24),
                ]),
              ),
            );
          }),
          const SizedBox(height: 8),
        ]),
      ),
    );
  }
}

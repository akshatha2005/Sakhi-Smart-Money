import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../data/translations.dart';
import '../widgets/game_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CardTitle(text: Tr.get('home_title'), emoji: '🏠'),
        VoiceBubble(text: Tr.get('home_voice')),
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: const Color(0xFFFEF9EE), borderRadius: BorderRadius.circular(11),
            border: Border.all(color: const Color(0xFFE5D098)),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(Tr.get('monthly_target'), style: AppTheme.display(14, color: AppTheme.clayDark)),
            const SizedBox(height: 7),
            Text(Tr.get('target_desc'), style: AppTheme.body(13.5, color: AppTheme.inkMid)),
          ]),
        ),
        const SizedBox(height: 14),
        Row(children: [
          _Stat('💰', Tr.get('saved'),        '₹${gs.saved}'),
          const SizedBox(width: 8),
          _Stat('🛡️', Tr.get('scams_beaten'), '${gs.scamsDefeated}/4'),
          const SizedBox(width: 8),
          _Stat('🤔', Tr.get('decisions'),    '${gs.decisions}'),
        ]),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 15)),
          child: Text('${Tr.get('begin_month')} ${gs.month}', style: AppTheme.display(16, color: Colors.white)),
        )),
      ])),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: AppTheme.sage.withOpacity(0.08), borderRadius: BorderRadius.circular(11),
          border: Border.all(color: AppTheme.sage.withOpacity(0.25)),
        ),
        child: Row(children: [
          const Text('📴', style: TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Expanded(child: Text(Tr.get('offline_msg'), style: AppTheme.body(13, color: AppTheme.sage))),
        ]),
      ),
    ]);
  }
}

class _Stat extends StatelessWidget {
  final String emoji, label, value;
  const _Stat(this.emoji, this.label, this.value);
  @override
  Widget build(BuildContext context) => Expanded(child: Container(
    padding: const EdgeInsets.all(11),
    decoration: BoxDecoration(color: AppTheme.cream, borderRadius: BorderRadius.circular(11), border: Border.all(color: AppTheme.border)),
    child: Column(children: [
      Text(emoji, style: const TextStyle(fontSize: 22)),
      const SizedBox(height: 2),
      Text(label, style: AppTheme.body(10, color: AppTheme.inkMuted), textAlign: TextAlign.center),
      Text(value, style: AppTheme.display(14)),
    ]),
  ));
}

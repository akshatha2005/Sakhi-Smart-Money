import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../data/translations.dart';
import '../widgets/game_card.dart';

class ProgressTab extends StatelessWidget {
  const ProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    final badges = [
      {'id':'scam',  'ico':'🛡️', 'name': Tr.get('badge_scam'),  'desc': Tr.get('badge_scam_d')},
      {'id':'saver', 'ico':'💰', 'name': Tr.get('badge_saver'), 'desc': Tr.get('badge_saver_d')},
      {'id':'boss',  'ico':'📊', 'name': Tr.get('badge_boss'),  'desc': Tr.get('badge_boss_d')},
      {'id':'queen', 'ico':'👑', 'name': Tr.get('badge_queen'), 'desc': Tr.get('badge_queen_d')},
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Level hero
      Container(
        width: double.infinity, margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFEF5E2), Color(0xFFFAEAD0)]),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE0C070)),
        ),
        child: Column(children: [
          Text(gs.levelIcon, style: const TextStyle(fontSize: 54)),
          const SizedBox(height: 8),
          Text('Level ${gs.level}', style: AppTheme.display(26, color: AppTheme.clayDark)),
          Text(gs.levelName, style: AppTheme.body(15, color: AppTheme.inkSoft)),
          const SizedBox(height: 12),
          ClipRRect(borderRadius: BorderRadius.circular(5), child: LinearProgressIndicator(
            value: (gs.xp / gs.xpNeeded).clamp(0.0, 1.0),
            backgroundColor: AppTheme.border,
            valueColor: const AlwaysStoppedAnimation(AppTheme.clay), minHeight: 9,
          )),
          const SizedBox(height: 5),
          Text('${gs.xpNeeded - gs.xp} ${Tr.get('xp_remaining')}', style: AppTheme.body(12, color: AppTheme.inkMuted)),
        ]),
      ),
      // Stats
      GridView.count(
        crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.1,
        children: [
          _StatBox('⭐', Tr.get('total_score'),  '${gs.score}',     AppTheme.turmeric),
          _StatBox('📅', Tr.get('months_done'),  '${gs.month-1}/12',AppTheme.sage),
          _StatBox('🛡️', Tr.get('scams_beaten'), '${gs.scamsDefeated}', AppTheme.rose),
          _StatBox('💰', Tr.get('saved'),         '₹${gs.saved}',   AppTheme.sage),
        ],
      ),
      const SizedBox(height: 14),
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CardTitle(text: Tr.get('achievements'), emoji: '🎖️'),
        GridView.count(
          crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 2.4,
          children: badges.map((b) {
            final earned = gs.badgesEarned.contains(b['id']);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: earned ? const Color(0xFFFEF5E2) : AppTheme.cream,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: earned ? AppTheme.turmeric : AppTheme.border, width: earned ? 1.5 : 1),
              ),
              child: Row(children: [
                Text(b['ico']!, style: TextStyle(fontSize: 28, color: earned ? null : const Color(0xFFCCC0A8))),
                const SizedBox(width: 8),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(b['name']!, style: AppTheme.display(12, color: earned ? AppTheme.turmeric : AppTheme.inkMuted)),
                  Text(b['desc']!, style: AppTheme.body(10, color: AppTheme.inkMuted)),
                ])),
              ]),
            );
          }).toList(),
        ),
      ])),
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CardTitle(text: Tr.get('monthly_report'), emoji: '📋'),
        _Row(Tr.get('rep_health'), '${gs.health}%', gs.health > 60),
        _Row(Tr.get('rep_stress'), '${gs.stress}%', gs.stress < 40),
        _Row(Tr.get('rep_conf'),   '${gs.confidence}%', gs.confidence > 50),
        _Row(Tr.get('rep_scams'),  '${gs.scamsDefeated}/4', gs.scamsDefeated > 0),
        _Row(Tr.get('rep_dec'),    '${gs.decisions}', gs.decisions > 3),
        _Row(Tr.get('rep_saved'),  '₹${gs.saved}', gs.saved > 0),
        const SizedBox(height: 14),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () {
            if (gs.month >= 12) {
              showDialog(context: context, builder: (_) => ResultDialog(
                icon: '👑', title: Tr.get('year_done'), body: Tr.get('year_body'),
                effects: [{'text': '🎊 ${Tr.get("play_again")}', 'good': true}],
              ));
            } else {
              gs.setupNextMonth();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('🎉 Month ${gs.month}!'), backgroundColor: AppTheme.clay,
              ));
            }
          },
          child: Text(gs.month >= 12 ? Tr.get('final_results') : Tr.get('next_month'),
            style: AppTheme.display(16, color: Colors.white)),
        )),
      ])),
    ]);
  }
}

Widget _Row(String label, String value, bool good) => Padding(
  padding: const EdgeInsets.symmetric(vertical: 8),
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Text(label, style: AppTheme.body(14, color: AppTheme.inkSoft)),
    Text(value, style: AppTheme.display(14, color: good ? AppTheme.sage : AppTheme.rose)),
  ]),
);

class _StatBox extends StatelessWidget {
  final String emoji, label, value; final Color color;
  const _StatBox(this.emoji, this.label, this.value, this.color);
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: color.withOpacity(0.08), borderRadius: BorderRadius.circular(12), border: Border.all(color: color.withOpacity(0.2))),
    child: Row(children: [
      Text(emoji, style: const TextStyle(fontSize: 24)),
      const SizedBox(width: 8),
      Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(value, style: AppTheme.display(16, color: color)),
        Text(label, style: AppTheme.body(10, color: AppTheme.inkMuted)),
      ]),
    ]),
  );
}

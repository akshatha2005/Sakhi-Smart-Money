import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../widgets/game_card.dart';

class JarsTab extends StatefulWidget {
  const JarsTab({super.key});
  @override
  State<JarsTab> createState() => _JarsTabState();
}

class _JarsTabState extends State<JarsTab> {
  final _controllers = {
    'home': TextEditingController(),
    'biz':  TextEditingController(),
    'save': TextEditingController(),
    'emrg': TextEditingController(),
  };

  @override
  void dispose() {
    for (var c in _controllers.values) c.dispose();
    super.dispose();
  }

  void _updateJar(GameState gs, String key, String val) {
    final v = int.tryParse(val) ?? 0;
    setState(() {
      switch (key) {
        case 'home': gs.jarHome = v; break;
        case 'biz':  gs.jarBiz  = v; break;
        case 'save': gs.jarSave = v; break;
        case 'emrg': gs.jarEmrg = v; break;
      }
    });
  }

  void _addToken(GameState gs, String key, int amount) {
    final cur = int.tryParse(_controllers[key]!.text) ?? 0;
    _controllers[key]!.text = (cur + amount).toString();
    _updateJar(gs, key, _controllers[key]!.text);
  }

  void _submit(BuildContext context, GameState gs) {
    if (gs.jarsSubmitted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pehle se submit ho chuka hai!'), backgroundColor: AppTheme.clay),
      );
      return;
    }
    final tgts = gs.jarTargets;
    final vals = {'home': gs.jarHome, 'biz': gs.jarBiz, 'save': gs.jarSave, 'emrg': gs.jarEmrg};
    int score = 0, correct = 0;
    vals.forEach((k, v) {
      final tgt = tgts[k]!;
      final ok = (k == 'home' || k == 'biz') ? (v - tgt).abs() <= 500 : v >= tgt;
      if (ok) { score += 50; correct++; }
    });
    gs.addScore(score);
    gs.jarsSubmitted = true;
    gs.saved += gs.jarSave;
    if (correct == 4) gs.updateMeters(deltaHealth: 10, deltaConf: 10);
    else gs.updateMeters(deltaStress: (4 - correct) * 5);
    gs.checkBadges();
    showDialog(context: context, builder: (_) => ResultDialog(
      icon: correct == 4 ? '🏺' : '⚠️',
      title: correct == 4 ? 'Perfect Split!' : 'Kuch galat tha',
      body: correct == 4
          ? 'Sabhee 4 jar sahi bhare! Business aur ghar ka paisa alag rakhna bahut zaroori hai.'
          : '$correct/4 jar sahi. Paisa mix karna debt aur confusion badhata hai.',
      effects: [
        {'text': '+$score pts', 'good': true},
        {'text': correct == 4 ? '+Health, +Confidence' : 'Stress badh gayi', 'good': correct == 4},
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    final tgts = gs.jarTargets;
    int total = (int.tryParse(_controllers['home']!.text) ?? 0) +
                (int.tryParse(_controllers['biz']!.text) ?? 0) +
                (int.tryParse(_controllers['save']!.text) ?? 0) +
                (int.tryParse(_controllers['emrg']!.text) ?? 0);
    final remaining = gs.income - total;

    final jars = [
      {'key': 'home', 'ico': '🏠', 'name': 'Ghar',     'color': AppTheme.clay},
      {'key': 'biz',  'ico': '🏪', 'name': 'Dukaan',   'color': AppTheme.turmeric},
      {'key': 'save', 'ico': '🐷', 'name': 'Bachat',   'color': AppTheme.sage},
      {'key': 'emrg', 'ico': '🚨', 'name': 'Emergency','color': AppTheme.rose},
    ];
    final tokenAmounts = [
      (gs.income * 0.35).round(), (gs.income * 0.25).round(),
      (gs.income * 0.2).round(),  (gs.income * 0.1).round(),
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(
          width: 34, height: 34,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppTheme.clay),
          child: Center(child: Text('2', style: AppTheme.display(16, color: Colors.white))),
        ),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Money Jar Puzzle', style: AppTheme.display(17)),
          Text('Paisa sahi dabbon mein daalo', style: AppTheme.body(12, color: AppTheme.inkSoft)),
        ]),
      ]),
      const SizedBox(height: 14),
      const VoiceBubble(text: 'Yeh 4 dabba hain — ghar, dukaan, bachat, aur emergency ke liye. Sahi jagah paisa daalo!'),
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text('🏺  Paisa Baanto — ', style: AppTheme.display(15)),
          Text('₹${gs.income.toLocaleString()}', style: AppTheme.display(15, color: AppTheme.turmeric)),
        ]),
        const SizedBox(height: 14),
        // Jar tiles grid
        GridView.count(
          crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 1.4,
          children: jars.map((j) {
            final key = j['key'] as String;
            final color = j['color'] as Color;
            final amt = int.tryParse(_controllers[key]!.text) ?? 0;
            final tgt = tgts[key]!;
            final ok = (key == 'home' || key == 'biz') ? (amt - tgt).abs() <= 500 : amt >= tgt;
            return Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ok ? color.withOpacity(0.08) : AppTheme.cream,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: ok ? color : AppTheme.border, width: ok ? 2 : 1),
              ),
              child: Stack(children: [
                Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                  Text(j['ico'] as String, style: const TextStyle(fontSize: 26)),
                  const SizedBox(height: 3),
                  Text(j['name'] as String, style: AppTheme.body(12, color: color, weight: FontWeight.w600)),
                  Text('₹$amt', style: AppTheme.display(16)),
                  Text(
                    (key == 'home' || key == 'biz') ? 'Target: ₹$tgt' : 'Min: ₹$tgt',
                    style: AppTheme.body(10, color: AppTheme.inkMuted),
                  ),
                ]),
                if (ok) const Positioned(top: 0, right: 0, child: Text('✅', style: TextStyle(fontSize: 14))),
              ]),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        // Token buttons
        Text('💴  Quick tokens — tap to add:', style: AppTheme.body(12, color: AppTheme.inkMuted)),
        const SizedBox(height: 8),
        ...jars.map((j) {
          final key = j['key'] as String;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${j['ico']}  ${j['name']}', style: AppTheme.body(12, color: AppTheme.inkSoft, weight: FontWeight.w600)),
              const SizedBox(height: 4),
              Wrap(spacing: 7, children: tokenAmounts.take(3).map((v) => GestureDetector(
                onTap: () => _addToken(gs, key, v),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFE8C870), Color(0xFFC8870A)]),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: AppTheme.turmeric.withOpacity(0.25), blurRadius: 6, offset: const Offset(0, 2))],
                  ),
                  child: Text('+₹$v', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Color(0xFF2C1A0E))),
                ),
              )).toList()),
            ]),
          );
        }),
        const SizedBox(height: 6),
        // Input fields
        Text('Ya seedha amount likho:', style: AppTheme.body(12, color: AppTheme.inkMuted)),
        const SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8, crossAxisSpacing: 8, childAspectRatio: 3.2,
          children: jars.map((j) {
            final key = j['key'] as String;
            return TextField(
              controller: _controllers[key],
              keyboardType: TextInputType.number,
              onChanged: (v) { _updateJar(gs, key, v); setState(() {}); },
              style: AppTheme.body(14),
              decoration: InputDecoration(
                labelText: '${j['ico']}  ${j['name']}',
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Bacha hua paisa:', style: AppTheme.body(13, color: AppTheme.inkSoft)),
          Text('₹$remaining', style: AppTheme.display(14, color: remaining == 0 ? AppTheme.sage : AppTheme.clay)),
        ]),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: gs.jarsSubmitted ? null : () => _submit(context, gs),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.sage,
              disabledBackgroundColor: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            child: Text(gs.jarsSubmitted ? '✅  Submit ho gaya!' : '✅  Submit Karo',
              style: AppTheme.display(16, color: Colors.white)),
          ),
        ),
      ])),
    ]);
  }
}

extension on int {
  String toLocaleString() => toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]},',
  );
}

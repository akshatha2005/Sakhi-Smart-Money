import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../data/game_data.dart';
import '../utils/app_theme.dart';
import '../widgets/game_card.dart';

class EventsTab extends StatefulWidget {
  const EventsTab({super.key});
  @override
  State<EventsTab> createState() => _EventsTabState();
}

class _EventsTabState extends State<EventsTab> {
  bool _showScam = false;

  @override
  Widget build(BuildContext context) {
    return _showScam ? _scamView(context) : _eventView(context);
  }

  Widget _eventView(BuildContext context) {
    final gs = context.watch<GameState>();
    final ev = lifeEvents[(gs.month - 1) % lifeEvents.length];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _stepHead('3', 'Life Event', 'Ek challenge aaya!', AppTheme.clay),
      // Event banner
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Color(0xFFFEF5E2), Color(0xFFFBE7BC)]),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDFBF6A)),
        ),
        child: Column(children: [
          Text(ev.icon, style: const TextStyle(fontSize: 52)),
          const SizedBox(height: 8),
          Text(ev.title, style: AppTheme.display(18, color: AppTheme.clayDark), textAlign: TextAlign.center),
          const SizedBox(height: 6),
          Text(ev.desc, style: AppTheme.body(14, color: AppTheme.inkMid), textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
              color: AppTheme.rose.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppTheme.rose.withOpacity(0.3)),
            ),
            child: Text('⏱  Sochne ka waqt: 0:45',
              style: AppTheme.body(12, color: AppTheme.rose, weight: FontWeight.w600)),
          ),
        ]),
      ),
      const VoiceBubble(text: 'Priya, sochkar faisla karo. Apni bachat aur emergency fund ka sahi use karo!'),
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CardTitle(text: 'Kya Karogi?', emoji: '💡'),
        ...List.generate(ev.choices.length, (i) {
          final c = ev.choices[i];
          return ChoiceButton(
            emoji: c.emoji, text: c.text, pts: c.pts,
            isBad: c.pts < -50, disabled: gs.eventDone,
            tags: [
              if (c.health != 0) 'Health ${c.health > 0 ? "+" : ""}${c.health}%',
              if (c.stress != 0) 'Stress ${c.stress > 0 ? "+" : ""}${c.stress}%',
              if (c.debt > 0) 'Debt +₹${c.debt}',
            ],
            onTap: () => _pickEvent(context, gs, c),
          );
        }),
        if (gs.eventDone) ...[
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(
            onPressed: () => setState(() => _showScam = true),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.rose),
            child: Text('⚡  Scam Challenge →', style: AppTheme.display(15, color: Colors.white)),
          )),
        ],
      ])),
    ]);
  }

  void _pickEvent(BuildContext context, GameState gs, EventChoice c) {
    if (gs.eventDone) return;
    gs.eventDone = true;
    gs.addScore(c.pts);
    gs.updateMeters(deltaHealth: c.health, deltaStress: c.stress, deltaConf: c.conf);
    gs.decisions++;
    gs.checkBadges();
    setState(() {});
    showDialog(context: context, builder: (_) => ResultDialog(
      icon: c.pts > 0 ? '✅' : '⚠️',
      title: c.pts > 0 ? 'Bahut badhia!' : 'Isse seekho',
      body: c.msg,
      effects: [
        {'text': '${c.pts > 0 ? "+" : ""}${c.pts} pts', 'good': c.pts > 0},
        if (c.health != 0) {'text': 'Health ${c.health > 0 ? "+" : ""}${c.health}%', 'good': c.health > 0},
      ],
    ));
  }

  Widget _scamView(BuildContext context) {
    final gs = context.watch<GameState>();
    final sc = scamEvents[(gs.month - 1) % scamEvents.length];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _stepHead('!', 'Scam Alert!', 'Dhoka ho sakta hai — sambhalo', AppTheme.rose),
      // Scam message card
      Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8F5),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.rose, width: 2),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            _PulseDot(),
            const SizedBox(width: 8),
            Expanded(child: Text(sc.urgency, style: AppTheme.display(14, color: AppTheme.rose))),
          ]),
          const SizedBox(height: 8),
          Text(sc.type, style: AppTheme.body(12, color: AppTheme.inkMuted)),
          const SizedBox(height: 3),
          Text(sc.sender, style: AppTheme.display(12, color: AppTheme.rose)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFEF0EE),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),
              ),
              border: const Border(left: BorderSide(color: AppTheme.rose, width: 3)),
            ),
            child: Text(sc.message, style: AppTheme.body(13.5, color: AppTheme.inkMid)),
          ),
          const SizedBox(height: 12),
          Text('🚩  Red Flags:', style: AppTheme.display(13, color: AppTheme.rose)),
          const SizedBox(height: 6),
          ...sc.redFlags.map((f) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('⚠️', style: TextStyle(fontSize: 13)),
              const SizedBox(width: 6),
              Expanded(child: Text(f, style: AppTheme.body(13, color: const Color(0xFF7A1C18)))),
            ]),
          )),
        ]),
      ),
      const VoiceBubble(text: 'Priya, ruko! Yeh sach lag raha hai? Red flags dekho — jaldi mat karo!'),
      GameCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const CardTitle(text: 'Tumhara Jawab?', emoji: '🤔'),
        ...List.generate(sc.choices.length, (i) {
          final c = sc.choices[i];
          return ChoiceButton(
            emoji: c.isScam ? '❌' : '✅',
            text: c.text, pts: c.pts,
            isBad: c.isScam, disabled: gs.scamDone,
            tags: [c.isScam ? 'Scam!' : 'Safe 🛡️'],
            onTap: () => _pickScam(context, gs, c),
          );
        }),
        const TipBox(text: 'Asli banks kabhi OTP ya Aadhaar phone par nahi maangte. Hamesha official number par call karo.'),
        if (gs.scamDone) ...[
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: ElevatedButton(
            onPressed: () {},
            child: Text('📊  Progress Dekho →', style: AppTheme.display(15, color: Colors.white)),
          )),
        ],
      ])),
    ]);
  }

  void _pickScam(BuildContext context, GameState gs, ScamChoice c) {
    if (gs.scamDone) return;
    gs.scamDone = true;
    gs.addScore(c.pts);
    gs.updateMeters(deltaStress: c.stress, deltaConf: c.conf);
    if (!c.isScam) gs.scamsDefeated++;
    gs.checkBadges();
    setState(() {});
    showDialog(context: context, builder: (_) => ResultDialog(
      icon: c.isScam ? '😰' : '🛡️',
      title: c.isScam ? 'Scam mein phas gayi!' : 'Scam Defeat!',
      body: c.msg,
      effects: [
        {'text': '${c.pts > 0 ? "+" : ""}${c.pts} pts', 'good': c.pts > 0},
        {'text': c.isScam ? 'Dhyan rakhna!' : 'Bahut badhia!', 'good': !c.isScam},
      ],
    ));
  }

  Widget _stepHead(String num, String title, String sub, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(children: [
        Container(
          width: 34, height: 34,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Center(child: Text(num, style: AppTheme.display(16, color: Colors.white))),
        ),
        const SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTheme.display(17)),
          Text(sub, style: AppTheme.body(12, color: AppTheme.inkSoft)),
        ]),
      ]),
    );
  }
}

class _PulseDot extends StatefulWidget {
  @override
  State<_PulseDot> createState() => _PulseDotState();
}
class _PulseDotState extends State<_PulseDot> with SingleTickerProviderStateMixin {
  late AnimationController _ac;
  @override
  void initState() {
    super.initState();
    _ac = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..repeat(reverse: true);
  }
  @override
  void dispose() { _ac.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _ac,
    builder: (_, __) => Opacity(
      opacity: 0.3 + _ac.value * 0.7,
      child: Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppTheme.rose, shape: BoxShape.circle)),
    ),
  );
}

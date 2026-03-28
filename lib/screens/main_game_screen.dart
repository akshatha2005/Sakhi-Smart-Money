import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../data/translations.dart';
import '../widgets/game_card.dart';
import '../widgets/language_picker.dart';
import 'home_tab.dart';
import 'income_tab.dart';
import 'jars_tab.dart';
import 'events_tab.dart';
import 'progress_tab.dart';

class MainGameScreen extends StatefulWidget {
  const MainGameScreen({super.key});
  @override
  State<MainGameScreen> createState() => _MainGameScreenState();
}

class _MainGameScreenState extends State<MainGameScreen> {
  int _tab = 0;

  Widget _buildTab() {
    switch (_tab) {
      case 0: return const HomeTab();
      case 1: return const IncomeTab();
      case 2: return const JarsTab();
      case 3: return const EventsTab();
      case 4: return const ProgressTab();
      default: return const HomeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    return Scaffold(
      backgroundColor: AppTheme.warmBg,
      body: SafeArea(child: Column(children: [
        _TopBar(gs: gs),
        _MetersBar(gs: gs),
        _StepDots(active: _tab),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 280),
            child: SingleChildScrollView(
              key: ValueKey(_tab),
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 90),
              child: _buildTab(),
            ),
          ),
        ),
      ])),
      bottomNavigationBar: _BottomNav(selected: _tab, onTap: (i) => setState(() => _tab = i)),
    );
  }
}

class _TopBar extends StatelessWidget {
  final GameState gs;
  const _TopBar({required this.gs});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.paper,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(children: [
        Container(
          width: 44, height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(colors: [Color(0xFFE8956D), AppTheme.clay]),
            border: Border.all(color: AppTheme.clay.withOpacity(0.3), width: 2),
          ),
          child: const Center(child: Text('🌸', style: TextStyle(fontSize: 22))),
        ),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Sakhi – Priya', style: AppTheme.display(14)),
          Text('Level ${gs.level}: ${gs.levelName}', style: AppTheme.body(11, color: AppTheme.inkSoft)),
          const SizedBox(height: 3),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: (gs.xp / gs.xpNeeded).clamp(0.0, 1.0),
              backgroundColor: AppTheme.border,
              valueColor: const AlwaysStoppedAnimation(AppTheme.clay),
              minHeight: 4,
            ),
          ),
        ])),
        const SizedBox(width: 8),
        Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          // Language picker
          const LanguagePickerButton(),
          const SizedBox(height: 4),
          Text('Month ${gs.month}/12', style: AppTheme.body(11, color: AppTheme.inkSoft)),
          Text('⭐ ${gs.score} pts', style: AppTheme.display(13, color: AppTheme.turmeric)),
        ]),
      ]),
    );
  }
}

class _MetersBar extends StatelessWidget {
  final GameState gs;
  const _MetersBar({required this.gs});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.paper,
      padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
      child: Row(children: [
        MetricMeter(label: Tr.get('health'), emoji: '💚', value: gs.health, color: AppTheme.sage),
        const SizedBox(width: 10),
        MetricMeter(label: Tr.get('stress'), emoji: '😰', value: gs.stress, color: AppTheme.rose),
        const SizedBox(width: 10),
        MetricMeter(label: Tr.get('confidence'), emoji: '✨', value: gs.confidence, color: AppTheme.turmeric),
      ]),
    );
  }
}

class _StepDots extends StatelessWidget {
  final int active;
  const _StepDots({required this.active});
  @override
  Widget build(BuildContext context) => Container(
    color: AppTheme.warmBg,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(children: List.generate(5, (i) {
      Color c = AppTheme.border;
      if (i < active) c = AppTheme.sage;
      if (i == active) c = AppTheme.clay;
      return Expanded(child: Container(
        height: 5, margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(3)),
      ));
    })),
  );
}

class _BottomNav extends StatelessWidget {
  final int selected;
  final ValueChanged<int> onTap;
  const _BottomNav({required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Watch gs so nav labels update with language
    context.watch<GameState>();
    final items = [
      ('🏠', Tr.get('nav_home')),
      ('💵', Tr.get('nav_income')),
      ('🏺', Tr.get('nav_jars')),
      ('⚡', Tr.get('nav_events')),
      ('🏆', Tr.get('nav_progress')),
    ];
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.paper,
        border: Border(top: BorderSide(color: AppTheme.border)),
        boxShadow: [BoxShadow(color: AppTheme.shadow, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: Row(children: List.generate(items.length, (i) {
        final active = i == selected;
        return Expanded(child: GestureDetector(
          onTap: () => onTap(i),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(
                color: active ? AppTheme.clay : Colors.transparent, width: 2,
              )),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(items[i].$1, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 2),
              Text(items[i].$2, style: TextStyle(
                fontSize: 10, fontFamily: 'Mukta',
                color: active ? AppTheme.clay : AppTheme.inkMuted,
                fontWeight: active ? FontWeight.w700 : FontWeight.normal,
              )),
            ]),
          ),
        ));
      })),
    );
  }
}

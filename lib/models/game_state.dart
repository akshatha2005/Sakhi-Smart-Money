import 'package:flutter/foundation.dart';
import '../data/translations.dart';

class GameState extends ChangeNotifier {
  int score = 0;
  int month = 1;
  int health = 60;
  int stress = 20;
  int confidence = 50;
  int xp = 50;
  int level = 1;
  int scamsDefeated = 0;
  int saved = 0;
  int decisions = 0;
  List<String> badgesEarned = [];
  int jarHome = 0, jarBiz = 0, jarSave = 0, jarEmrg = 0;
  bool jarsSubmitted = false, eventDone = false, scamDone = false;
  String language = 'en'; // 'en', 'hi', 'kn'

  void setLanguage(String lang) {
    language = lang;
    Tr.lang = lang;
    notifyListeners();
  }

  int get income => monthlyIncomes[(month - 1) % monthlyIncomes.length]['amount']!;
  int get bizIncome => monthlyIncomes[(month - 1) % monthlyIncomes.length]['biz']!;
  int get familyIncome => monthlyIncomes[(month - 1) % monthlyIncomes.length]['family']!;
  Map<String, int> get jarTargets => allJarTargets[(month - 1) % allJarTargets.length];

  String get levelName {
    final keys = ['lvl1','lvl2','lvl3','lvl4','lvl5'];
    return Tr.get(keys[(level - 1).clamp(0, 4)]);
  }
  String get levelIcon => levels[level - 1]['icon'] as String;
  int get xpNeeded => levels[level - 1]['xpNeeded'] as int;

  static const List<Map<String, int>> monthlyIncomes = [
    {'amount': 12000, 'biz': 8000, 'family': 4000},
    {'amount': 9500,  'biz': 5500, 'family': 4000},
    {'amount': 14000, 'biz': 10000,'family': 4000},
    {'amount': 11000, 'biz': 7000, 'family': 4000},
    {'amount': 16000, 'biz': 12000,'family': 4000},
    {'amount': 10000, 'biz': 6000, 'family': 4000},
  ];

  static const List<Map<String, int>> allJarTargets = [
    {'home': 5000, 'biz': 3500, 'save': 2000, 'emrg': 1500},
    {'home': 4000, 'biz': 2500, 'save': 1500, 'emrg': 1500},
    {'home': 6000, 'biz': 4000, 'save': 2500, 'emrg': 1500},
    {'home': 4500, 'biz': 3000, 'save': 2000, 'emrg': 1500},
    {'home': 7000, 'biz': 5000, 'save': 2500, 'emrg': 1500},
    {'home': 4000, 'biz': 2500, 'save': 2000, 'emrg': 1500},
  ];

  static const List<Map<String, dynamic>> levels = [
    {'level': 1, 'icon': '🌱', 'xpNeeded': 200},
    {'level': 2, 'icon': '📊', 'xpNeeded': 500},
    {'level': 3, 'icon': '💼', 'xpNeeded': 900},
    {'level': 4, 'icon': '🌟', 'xpNeeded': 1400},
    {'level': 5, 'icon': '👑', 'xpNeeded': 99999},
  ];

  void addScore(int pts) {
    score += pts; xp += pts.abs();
    _checkLevelUp(); notifyListeners();
  }

  void updateMeters({int deltaHealth=0, int deltaStress=0, int deltaConf=0}) {
    health = (health + deltaHealth).clamp(0, 100);
    stress = (stress + deltaStress).clamp(0, 100);
    confidence = (confidence + deltaConf).clamp(0, 100);
    notifyListeners();
  }

  void _checkLevelUp() {
    for (int i = levels.length - 1; i >= 0; i--) {
      if (xp >= (levels[i]['xpNeeded'] as int)) { level = i + 1; break; }
    }
  }

  void earnBadge(String badge) {
    if (!badgesEarned.contains(badge)) { badgesEarned.add(badge); notifyListeners(); }
  }

  void checkBadges() {
    if (scamsDefeated >= 1) earnBadge('scam');
    if (saved >= 2000) earnBadge('saver');
    if (score >= 500) earnBadge('boss');
    if (decisions >= 5 && scamsDefeated >= 2) earnBadge('queen');
  }

  void setupNextMonth() {
    month++;
    jarsSubmitted = false; eventDone = false; scamDone = false;
    jarHome = 0; jarBiz = 0; jarSave = 0; jarEmrg = 0;
    notifyListeners();
  }

  void resetForNewGame() {
    score = 0; month = 1; health = 60; stress = 20;
    confidence = 50; xp = 50; level = 1;
    scamsDefeated = 0; saved = 0; decisions = 0;
    badgesEarned = [];
    jarsSubmitted = false; eventDone = false; scamDone = false;
    jarHome = 0; jarBiz = 0; jarSave = 0; jarEmrg = 0;
    notifyListeners();
  }
}

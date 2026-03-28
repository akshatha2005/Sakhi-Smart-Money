import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class GameCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? borderColor;
  final Gradient? gradient;
  final Color? bgColor;

  const GameCard({
    super.key, required this.child,
    this.padding, this.borderColor, this.gradient, this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: padding ?? const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: gradient == null ? (bgColor ?? AppTheme.paper) : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: borderColor ?? AppTheme.border, width: 1),
        boxShadow: const [BoxShadow(color: AppTheme.shadow, blurRadius: 10, offset: Offset(0, 2))],
      ),
      child: child,
    );
  }
}

class CardTitle extends StatelessWidget {
  final String text;
  final String? emoji;
  const CardTitle({super.key, required this.text, this.emoji});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(children: [
        if (emoji != null) ...[Text(emoji!, style: const TextStyle(fontSize: 20)), const SizedBox(width: 7)],
        Expanded(child: Text(text, style: AppTheme.display(16))),
      ]),
    );
  }
}

class VoiceBubble extends StatelessWidget {
  final String text;
  const VoiceBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF9EE),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(14), topRight: Radius.circular(14),
          bottomRight: Radius.circular(14), bottomLeft: Radius.circular(4),
        ),
        border: Border.all(color: const Color(0xFFE5D098)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('👩', style: TextStyle(fontSize: 26)),
        const SizedBox(width: 10),
        Expanded(child: Text(text, style: AppTheme.body(13.5, color: AppTheme.inkMid))),
      ]),
    );
  }
}

class MetricMeter extends StatelessWidget {
  final String label, emoji;
  final int value;
  final Color color;
  const MetricMeter({super.key, required this.label, required this.emoji, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('$emoji $label', style: const TextStyle(fontSize: 10, color: AppTheme.inkMuted)),
          Text('$value%', style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 3),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value / 100,
            backgroundColor: AppTheme.border,
            valueColor: AlwaysStoppedAnimation(color),
            minHeight: 7,
          ),
        ),
      ]),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final String emoji, text;
  final int pts;
  final List<String> tags;
  final bool disabled;
  final bool isBad;
  final VoidCallback onTap;

  const ChoiceButton({
    super.key, required this.emoji, required this.text,
    required this.pts, this.tags = const [], this.disabled = false,
    this.isBad = false, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.only(bottom: 9),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: disabled ? AppTheme.cream.withOpacity(0.6) : AppTheme.cream,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isBad ? AppTheme.rose.withOpacity(0.3) : AppTheme.border,
            width: 1.5,
          ),
          boxShadow: disabled ? [] : const [BoxShadow(color: AppTheme.shadow, blurRadius: 4, offset: Offset(0, 1))],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Expanded(child: Text(text, style: AppTheme.display(14, weight: FontWeight.w600, color: disabled ? AppTheme.inkMuted : AppTheme.ink))),
          ]),
          const SizedBox(height: 6),
          Wrap(spacing: 5, children: [
            _Tag('${pts > 0 ? "+" : ""}$pts pts', pts > 0),
            ...tags.map((t) => _Tag(t, !t.contains('+') || t.contains('Health+') || t.contains('Conf'))),
          ]),
        ]),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final bool positive;
  const _Tag(this.text, this.positive);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: (positive ? AppTheme.sage : AppTheme.rose).withOpacity(0.12),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(text, style: TextStyle(
        fontSize: 11, fontWeight: FontWeight.w600,
        color: positive ? const Color(0xFF2A4C2C) : const Color(0xFF6E1C18),
      )),
    );
  }
}

class TipBox extends StatelessWidget {
  final String text;
  const TipBox({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F8F3),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: AppTheme.sage.withOpacity(0.28)),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('💡', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: AppTheme.body(13, color: AppTheme.inkMid))),
      ]),
    );
  }
}

class ResultDialog extends StatelessWidget {
  final String icon, title, body;
  final List<Map<String, dynamic>> effects;
  const ResultDialog({super.key, required this.icon, required this.title, required this.body, required this.effects});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.paper,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppTheme.border),
      ),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(icon, style: const TextStyle(fontSize: 52)),
        const SizedBox(height: 10),
        Text(title, style: AppTheme.display(20), textAlign: TextAlign.center),
        const SizedBox(height: 8),
        Text(body, style: AppTheme.body(13.5, color: AppTheme.inkSoft), textAlign: TextAlign.center),
        const SizedBox(height: 14),
        ...effects.map((e) => Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: (e['good'] == true ? AppTheme.sage : AppTheme.rose).withOpacity(0.11),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Row(children: [
            Text(e['good'] == true ? '✅' : '❌'),
            const SizedBox(width: 8),
            Text(e['text'] as String, style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 14,
              color: e['good'] == true ? const Color(0xFF2A4C2C) : const Color(0xFF6E1C18),
            )),
          ]),
        )),
        const SizedBox(height: 16),
        SizedBox(width: double.infinity, child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Theek hai, aage chalte hain'),
        )),
      ]),
    );
  }
}

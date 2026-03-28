import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/game_state.dart';
import '../utils/app_theme.dart';
import '../data/translations.dart';
import '../widgets/game_card.dart';

class IncomeTab extends StatelessWidget {
  const IncomeTab({super.key});
  @override
  Widget build(BuildContext context) {
    final gs = context.watch<GameState>();
    final expKeys = ['exp_groceries','exp_education','exp_electricity','exp_business','exp_transport'];
    final expPcts = [0.18, 0.12, 0.06, 0.15, 0.05];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [
        Container(width:34,height:34,decoration:const BoxDecoration(shape:BoxShape.circle,color:AppTheme.clay),
          child:Center(child:Text('1',style:AppTheme.display(16,color:Colors.white)))),
        const SizedBox(width:10),
        Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
          Text(Tr.get('income_title'),style:AppTheme.display(17)),
          Text(Tr.get('income_sub'),style:AppTheme.body(12,color:AppTheme.inkSoft)),
        ]),
      ]),
      const SizedBox(height:14),
      VoiceBubble(text: Tr.get('income_voice')),
      Container(
        width:double.infinity, padding:const EdgeInsets.all(22),
        decoration:BoxDecoration(
          gradient:const LinearGradient(colors:[Color(0xFFFEF5E2),Color(0xFFFAE6BC)]),
          borderRadius:BorderRadius.circular(14), border:Border.all(color:const Color(0xFFE0C070)),
        ),
        child:Column(children:[
          Text(Tr.get('total_income'),style:AppTheme.body(13,color:AppTheme.inkSoft)),
          const SizedBox(height:6),
          Text('₹${gs.income}',style:AppTheme.display(44,color:AppTheme.sage)),
          const SizedBox(height:4),
          Text('Business: ₹${gs.bizIncome} + Family: ₹${gs.familyIncome}',style:AppTheme.body(13,color:AppTheme.inkSoft)),
        ]),
      ),
      const SizedBox(height:14),
      GameCard(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
        CardTitle(text:Tr.get('main_expenses'),emoji:'📋'),
        ...List.generate(expKeys.length,(i){
          final amt=(gs.income*expPcts[i]).round();
          return Padding(padding:const EdgeInsets.symmetric(vertical:8),
            child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
              Text(Tr.get(expKeys[i]),style:AppTheme.body(13.5,color:AppTheme.inkMid)),
              Text('₹$amt',style:AppTheme.display(14,color:AppTheme.rose)),
            ]));
        }),
        TipBox(text:Tr.get('income_tip')),
      ])),
    ]);
  }
}

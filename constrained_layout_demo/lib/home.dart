// MIT License
// Copyright (c) 2022 hackware1993



import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

import 'arbitrary_position.dart';
import 'badge.dart';
import 'barrier.dart';
import 'charts.dart';
import 'circle_position.dart';
import 'coming_soon.dart';
import 'complex_list.dart';
import 'constraint_controller.dart';
import 'dimension_ratio.dart';
import 'grid.dart';
import 'guideline.dart';
import 'horizontal_list.dart';
import 'margin.dart';
import 'open_grammar.dart';
import 'percentage_layout.dart';
import 'pinned_position.dart';
import 'relative_id.dart';
import 'self_wrap_content.dart';
import 'staggered_grid.dart';
import 'summary.dart';
import 'translate.dart';
import 'vertical_list.dart';
import 'wrapper_constraints.dart';

class ExampleHome extends StatelessWidget {
  ExampleHome({Key? key}) : super(key: key);

  final Map<String, Widget?> exampleMap = {
    'Summary': const SummaryExample(),
    'Open Grammar': const OpenGrammarExample(),
    'Guideline': const GuidelineExample(),
    'Barrier': const BarrierExample(),
    'Complex List': const ComplexListExample(),
    'Badge': const BadgeExample(),
    'Percentage Layout': const PercentageLayoutExample(),
    'Dimension Ratio': const DimensionRatioExample(),
    'Relative Id': const RelativeIdExample(),
    'Wrapper Constraints': const WrapperConstraintsExample(),
    'Grid': const GridExample(),
    'Horizontal List': const HorizontalListExample(),
    'Vertical List': const VerticalListExample(),
    'Staggered Grid': const StaggeredGridExample(),
    'Circle Position': const CirclePositionExample(),
    'Pinned Position': const PinnedPositionExample(),
    'Arbitrary Position': const ArbitraryPositionExample(),
    'Constraint Controller': const ConstraintControllerExample(),
    'Self wrapContent': const SelfWrapContentExample(),
    'Margin': const MarginExample(),
    'Translate': const TranslateExample(),
    'Charts': const ChartsExample(),
    'Chain (Coming soon)': const ComingSoonWidget(),
  };

  @override
  Widget build(BuildContext context) {
    List<String> keyList = exampleMap.keys.toList();
    return Scaffold(
      body: ConstraintLayout(
        children: [
          const Text(
            'Flutter ConstraintLayout Example\nby hackware',
            style: TextStyle(
              fontSize: 32,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ).applyConstraint(
            topCenterTo: parent,
          ),
          ListView.builder(
            itemBuilder: (_, index) {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return exampleMap[keyList[index]]!;
                  }));
                },
                child: Text(
                  keyList[index],
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              );
            },
            itemCount: keyList.length,
            itemExtent: 40,
          ).applyConstraint(
            width: matchParent,
            height: matchConstraint,
            top: sId(-1).bottom,
            bottom: sId(1).top,
          ),
          const Text(
            'Powered by Flutter Web & ConstraintLayout',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ).applyConstraint(
            bottomCenterTo: parent,
            margin: const EdgeInsets.only(
              bottom: 20,
            ),
          ),
          Image.asset(
            'assets/official_account.webp',
          ).applyConstraint(
            centerLeftTo: parent.leftMargin(200),
          ),
          const Text(
            '扫码关注微信公众号 FlutterFirst，一起成长！',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ).applyConstraint(
            outBottomCenterTo: sId(-1).topMargin(16),
          ),
          Image.asset(
            'assets/communication.webp',
          ).applyConstraint(
            centerRightTo: parent.rightMargin(200),
          ),
          const Text(
            '扫码添加我的个人微信，拉你进 Flutter 交流群，请备注【加群】',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ).applyConstraint(
            outBottomCenterTo: sId(-1).topMargin(16),
          ),
        ],
      ),
    );
  }
}

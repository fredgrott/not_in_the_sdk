// MIT License
// Copyright (c) 2022 hackware1993



import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

import 'custom_app_bar.dart';

class GridExample extends StatelessWidget {
  const GridExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blueAccent,
      Colors.orangeAccent,
      Colors.yellow,
      Colors.pink,
      Colors.lightBlueAccent
    ];
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Grid',
        codePath: 'lib/grid.dart',
      ),
      body: ConstraintLayout(
        children: [
          ...constraintGrid(
              id: ConstraintId('grid'),
              left: parent.left,
              top: parent.top,
              itemCount: 50,
              columnCount: 8,
              itemSize: 100,
              itemBuilder: (index, _, __) {
                return Container(
                  color: colors[index % colors.length],
                );
              },
              itemMarginBuilder: (index, _, __) {
                return const EdgeInsets.only(
                  left: 10,
                  top: 10,
                );
              })
        ],
      ),
    );
  }
}

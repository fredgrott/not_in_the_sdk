// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original Copyright 2019 Floreent 39, Inc
// Apache License


import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

class JacksmanPage extends StatelessWidget {
  const JacksmanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShapeOfView(
          elevation: 4,
          height: 300,
          shape: DiagonalShape(
            angle: DiagonalAngle.deg(angle: 15),
          ),
          child: Stack(
            children: [
              KenBurns(
                maxScale: 5,
                child: Image.asset(
                  "assets/diagonallayout_background.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 18, top: 120),
                    child: Text(
                      "Hugh Jackman",
                      style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 1,
                                offset: Offset(1, 1)),
                          ]),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, top: 6.0),
                    child: Text(
                      "Actor Producer",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 20,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 1,
                                offset: Offset(1, 1)),
                          ]),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 230),
          child: ShapeOfView(
            height: 100,
            width: 100,
            shape: CircleShape(borderColor: Colors.white, borderWidth: 3),
            elevation: 12,
            child: Image.asset(
              "assets/diagonallayout_hughjackman.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

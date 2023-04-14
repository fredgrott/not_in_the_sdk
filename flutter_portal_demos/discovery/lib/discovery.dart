// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:discovery/barrier.dart';
import 'package:discovery/hole_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class Discovery extends StatelessWidget {
  const Discovery({
    Key? key,
    required this.visible,
    required this.onClose,
    required this.description,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Widget description;
  final bool visible;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Barrier(
      visible: visible,
      onClose: onClose,
      child: PortalTarget(
        visible: visible,
        closeDuration: kThemeAnimationDuration,
        anchor: const Aligned(
          target: Alignment.center,
          follower: Alignment.center,
        ),
        portalFollower: Stack(
          children: [
            CustomPaint(
              painter: HolePainter(Theme.of(context).colorScheme.secondary),
              child: TweenAnimationBuilder<double>(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                tween: Tween(begin: 50, end: visible ? 200 : 50),
                builder: (context, radius, _) {
                  return Padding(
                    padding: EdgeInsets.all(radius),
                    child: child,
                  );
                },
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              width: 200,
              // child: DefaultTextStyle(
              // style: Theme.of(context).textTheme.headline5!,
              child: TweenAnimationBuilder<double>(
                duration: kThemeAnimationDuration,
                curve: Curves.easeOut,
                tween: Tween(begin: 0, end: visible ? 1 : 0),
                builder: (context, opacity, _) {
                  return Opacity(
                    opacity: opacity,
                    child: description,
                  );
                },
              ),
            )
          ],
        ),
        child: child,
      ),
    );
  }
}

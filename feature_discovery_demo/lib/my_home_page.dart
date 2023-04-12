// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under MIT license
// Copyright (c) 2019 Ali Mohammadi

import 'dart:developer';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:feature_discovery_demo/content.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    action() async {
      log('IconButton of $feature7 tapped.');
      return true;
    }
    const icon1 = Icon(Icons.drive_eta);
    const icon2 = Icon(Icons.menu);
    const icon3 = Icon(Icons.search);
    const icon4 = Icon(Icons.add);

    var feature1OverflowMode = OverflowMode.clipContent;
    var feature1EnablePulsingAnimation = false;

    var feature3ItemCount = 15;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: <Widget>[
              DescribedFeatureOverlay(
                featureId: feature7,
                tapTarget: icon1,
                backgroundColor: Colors.blue,
                contentLocation: ContentLocation.below,
                title: const Text('Find the fastest route'),
                description: const Text(
                    'Get car, walking, cycling, or public transit directions to this place'),
                onComplete: action,
                onOpen: () async {
                  log('The $feature7 overlay is about to be displayed.');
                  return true;
                },
                child: IconButton(
                  icon: icon1,
                  onPressed: action,
                ),
              ),
            ],
          ),
        ),
        leading: StatefulBuilder(
          builder:
              (BuildContext context, void Function(void Function()) setState) =>
                  DescribedFeatureOverlay(
            featureId: feature1,
            tapTarget: icon2,
            backgroundColor: Colors.teal,
            title: const Text(
                'This is overly long on purpose to test OverflowMode.clip!'),
            overflowMode: feature1OverflowMode,
            enablePulsingAnimation: feature1EnablePulsingAnimation,
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    'Also, notice how the pulsing animation is not playing because it is deactivated for this feature.'),
                TextButton(
                  onPressed: () => setState(() {
                    feature1EnablePulsingAnimation =
                        !feature1EnablePulsingAnimation;
                  }),
                  child: Text('Toggle enablePulsingAnimation',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white)),
                ),
                const Text(
                    'Ignore the items below or tap the button to toggle between OverflowMode.clip and OverflowMode.doNothing!'),
                TextButton(
                  onPressed: () => setState(() {
                    feature1OverflowMode =
                        feature1OverflowMode == OverflowMode.clipContent
                            ? OverflowMode.ignore
                            : OverflowMode.clipContent;
                  }),
                  child: Text('Toggle overflowMode',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white)),
                ),
                for (int n = 42; n > 0; n--)
                  const Text('Testing clipping (ignore or toggle)',
                      style: TextStyle(backgroundColor: Colors.black)),
              ],
            ),
            child: IconButton(
              icon: icon2,
              onPressed: () {},
            ),
          ),
        ),
        actions: <Widget>[
          DescribedFeatureOverlay(
            featureId: feature2,
            tapTarget: icon3,
            backgroundColor: Colors.green,
            title: const Text('Search your compounds'),
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    'Tap the magnifying glass to quickly scan your compounds'),
                TextButton(
                  onPressed: () async =>
                      FeatureDiscovery.completeCurrentStep(context),
                  child: Text(
                    'Understood',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
                TextButton(
                  onPressed: () => FeatureDiscovery.dismissAll(context),
                  child: Text(
                    'Dismiss',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
            child: IconButton(
              icon: icon3,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: const Content(),
      floatingActionButton: StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) =>
                DescribedFeatureOverlay(
          featureId: feature3,
          tapTarget: icon4,
          backgroundColor: Colors.green,
          overflowMode: OverflowMode.extendBackground,
          title: const Text('FAB feature'),
          description: Column(children: <Widget>[
            const Text(
                'This is overly long to test OverflowMode.extendBackground. The green circle should be large enough to cover all of the text.'),
            TextButton(
              onPressed: () => setState(() {
                feature3ItemCount++;
              }),
              child: Text('Add another item',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white)),
            ),
            for (int n = feature3ItemCount; n > 0; n--)
              const Text('Testing OverflowMode.extendBackground'),
          ]),
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Increment',
            child: icon4,
          ),
        ),
      ),
    );
  }
}

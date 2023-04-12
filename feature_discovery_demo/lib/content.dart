// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under MIT license
// Copyright (c) 2019 Ali Mohammadi

import 'dart:developer';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:feature_discovery_demo/main.dart';
import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  GlobalKey<EnsureVisibleState>? ensureKey;
  GlobalKey<EnsureVisibleState>? ensureKey2;

  @override
  void initState() {
    ensureKey = GlobalKey<EnsureVisibleState>();
    ensureKey2 = GlobalKey<EnsureVisibleState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{
          feature7,
          feature1,
          feature2,
          feature3,
          feature4,
          feature5,
          feature6
        },
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var feature6ItemCount = 0;

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 200,
                width: double.infinity,
                child: Text(
                    'Imagine there would be a beautiful picture here.'),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                color: Colors.blue,
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'DISH REPUBLIC',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Text(
                      'Eat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 600.0,
                color: Colors.orangeAccent,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: DescribedFeatureOverlay(
                  featureId: feature5,
                  tapTarget: const Icon(Icons.drive_eta),
                  backgroundColor: Colors.green,
                  onComplete: () async {
                    log('Tapped tap target of $feature5.');
                    return true;
                  },
                  onOpen: () async {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ensureKey!.currentState!.ensureVisible(
                        preciseAlignment: 0.5,
                        duration: const Duration(milliseconds: 400),
                      );
                    });
                    return true;
                  },
                  title: const Text('Discover Features'),
                  description: const Text(
                      'Find all available features in this application with this button.'),
                  contentLocation: ContentLocation.below,
                  child: EnsureVisible(
                    key: ensureKey,
                    child: ElevatedButton(
                      onPressed: () {
                        FeatureDiscovery.discoverFeatures(
                          context,
                          const <String>{
                            feature1,
                            feature2,
                            feature3,
                            feature4,
                            feature5,
                            feature6
                          },
                        );
                      },
                      child: const Text('Start Feature Discovery'),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1500,
                color: Colors.blueAccent,
              ),
              StatefulBuilder(
                builder: (BuildContext context,
                        void Function(void Function()) setState) =>
                    DescribedFeatureOverlay(
                  barrierDismissible: false,
                  featureId: feature6,
                  tapTarget: const Icon(Icons.drive_eta),
                  backgroundColor: Colors.green,
                  onComplete: () async {
                    log('Tapped tap target of $feature6.');
                    return true;
                  },
                  onOpen: () async {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ensureKey2!.currentState!.ensureVisible(
                          duration: const Duration(milliseconds: 600));
                    });
                    return true;
                  },
                  description: Column(children: <Widget>[
                    const Text(
                        'You can test OverflowMode.wrapBackground here.'),
                    TextButton(
                      onPressed: () => setState(() {
                        feature6ItemCount++;
                      }),
                      child: Text('Add item',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.white)),
                    ),
                    for (int n = feature6ItemCount; n > 0; n--)
                      const Text('Testing OverflowMode.wrapBackground'),
                  ]),
                  overflowMode: OverflowMode.wrapBackground,
                  child: EnsureVisible(
                    key: ensureKey2,
                    child: const Text(
                      'Custom text',
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                color: Colors.red,
              ),
            ],
          ),
        ),
        Positioned(
          top: 200.0,
          right: 0.0,
          child: FractionalTranslation(
            translation: const Offset(-.5, -0.5),
            child: DescribedFeatureOverlay(
              featureId: feature4,
              tapTarget: const Icon(Icons.drive_eta),
              backgroundColor: Colors.green,
              onOpen: () async {
                log('Tapped tap target of $feature4.');
                return true;
              },
              title: const Text('Find the fastest route'),
              description: const Text(
                  'Get car, walking, cycling or public transit directions to this place.'),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                onPressed: () {
                  log('Floating action button tapped.');
                },
                child: const Icon(Icons.drive_eta),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

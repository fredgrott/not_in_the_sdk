// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under MIT license
// Copyright (c) 2019 Ali Mohammadi

import 'package:feature_discovery_demo/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Feature Discovery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // Required: this widget works like an inherited widget.
        home: const FeatureDiscovery.withProvider(
          persistenceProvider: NoPersistenceProvider(),
          child: MyHomePage(title: 'Flutter Feature Discovery'),
        ),
      );
}

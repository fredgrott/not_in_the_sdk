// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:discovery/discovery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showDiscovery = false;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Discovery')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have clicked the button this many times:'),
                // Text('$count', style: Theme.of(context).textTheme.headline4),
                Text('$count'),
                ElevatedButton(
                  onPressed: () => setState(() => showDiscovery = true),
                  child: const Text('Show discovery'),
                )
              ],
            ),
          ),
          floatingActionButton: Discovery(
            visible: showDiscovery,
            description: const Text('Click to increment the counter'),
            onClose: () => setState(() => showDiscovery = false),
            child: FloatingActionButton(
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      showDiscovery = false;
      count++;
    });
  }
}

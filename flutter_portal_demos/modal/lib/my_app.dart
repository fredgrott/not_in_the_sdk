// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:modal/modal.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showModal = false;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('DiscoveryModal')),
          body: Center(
            child: Modal(
              visible: showModal,
              modal: const Dialog(
                child: Text('Hello world'),
              ),
              onClose: () => setState(() => showModal = false),
              child: ElevatedButton(
                onPressed: () => setState(() => showModal = true),
                child: const Text('Show modal'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

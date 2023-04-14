// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:context_menu/context_menu_example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('ContextMenu'),
          ),
          body: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const ContextualMenuExample(),
          ),
        ),
      ),
    );
  }
}

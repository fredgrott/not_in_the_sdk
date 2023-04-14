// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet


import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:medium_clap/clap_button.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('MediumClap'),
          ),
          body: const Center(child: ClapButton()),
        ),
      ),
    );
  }
}

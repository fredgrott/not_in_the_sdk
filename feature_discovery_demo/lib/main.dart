// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original under MIT license
// Copyright (c) 2019 Ali Mohammadi


import 'package:feature_discovery_demo/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const String feature1 = 'feature1',
    feature2 = 'feature2',
    feature3 = 'feature3',
    feature4 = 'feature4',
    feature5 = 'feature5',
    feature6 = 'feature6',
    feature7 = 'feature7';

void main() {
  // You can increase the timeDilation value if you want to see
  // the animations more slowly.
  timeDilation = 1.0;

  runApp(const MyApp());
}

// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:flutter/material.dart';
import 'package:rounded_corners/modal_entry.dart';
import 'package:rounded_corners/popup.dart';

class RoundedCornersExample extends StatefulWidget {
  const RoundedCornersExample({Key? key}) : super(key: key);

  @override
  State<RoundedCornersExample> createState() => _RoundedCornersExampleState();
}

class _RoundedCornersExampleState extends State<RoundedCornersExample> {
  bool _showPopup = false;

  @override
  Widget build(BuildContext context) {
    return ModalEntry(
      visible: _showPopup,
      onClose: () => setState(() => _showPopup = false),
      popup: Popup(
        children: [
          for (var i = 0; i < 12; i++)
            ListTile(
              onTap: () => setState(() => _showPopup = false),
              title: Text('$i'),
            ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => setState(() => _showPopup = true),
        child: const Text('show popup'),
      ),
    );
  }
}

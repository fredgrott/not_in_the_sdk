// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original MIT License
// Copyright (c) 2019 Remi Rousselet

import 'package:date_picker/declarative_date_picker.dart';
import 'package:flutter/material.dart';

class DatePickerUsageExample extends StatefulWidget {
  const DatePickerUsageExample({Key? key}) : super(key: key);

  @override
  State<DatePickerUsageExample> createState() => _DatePickerUsageExampleState();
}

class _DatePickerUsageExampleState extends State<DatePickerUsageExample> {
  DateTime? pickedDate;
  bool showDatePicker = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DeclarativeDatePicker(
        visible: showDatePicker,
        onClose: (date) => setState(() {
          showDatePicker = false;
          pickedDate = date;
        }),
        onDismissed: () => setState(() => showDatePicker = false),
        child: pickedDate == null
            ? ElevatedButton(
                onPressed: () => setState(() => showDatePicker = true),
                child: const Text('pick a date'),
              )
            : Text('The date picked: $pickedDate'),
      ),
    );
  }
}

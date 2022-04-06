// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'routes.dart';
import 'Classes/activity.dart';



void main() {
  runApp(
    const MaterialApp(
      title: 'My app',
      debugShowCheckedModeBanner: false,// used by the OS task switcher
      home: WelcomeRoute(),
    ),
  );
}

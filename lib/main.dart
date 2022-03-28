// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'routes.dart';



void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: WelcomeRoute(),
    ),
  );
}



// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';


class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      // Column is a vertical, linear layout.
      child: Column(
        children: [
              const Expanded(
                child: Center(
                  child: Text('Bienvenue dans ADIAP')
                ),
              ),

              Container(
                height: 60,
                width: 250,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(color: Colors.blue[500]),
                alignment: Alignment.center,
                child: Text('Créer mon profil')
              )
            ],
          ),
      );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}
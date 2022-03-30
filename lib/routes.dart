import 'package:adiap/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:adiap/welcome_screen.dart';
import 'package:adiap/main_screen.dart';

class WelcomeRoute extends StatelessWidget {
  const WelcomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomeScaffold();
  }
}

class MainRoute extends StatelessWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold();
  }
}

class ActivityRoute extends StatelessWidget {
  const ActivityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ActivityScaffold();
  }
}
import 'package:adiap/activity_screen.dart';
import 'package:flutter/material.dart';
import 'package:adiap/welcome_screen.dart';
import 'package:adiap/main_screen.dart';
import 'package:adiap/knowledge_screen.dart';
import 'package:adiap/parameter_screen.dart';
import 'package:adiap/profile_screen.dart';

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

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProfileScaffold();
  }
}

class KnowledgeRoute extends StatelessWidget {
  const KnowledgeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const KnowledgeScaffold();
  }
}

class ParameterRoute extends StatelessWidget {
  const ParameterRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ParameterScaffold();
  }
}
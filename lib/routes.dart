import 'package:adiap/Classes/OneActivity.dart';
import 'package:adiap/Classes/User.dart';
import 'package:adiap/Classes/activity.dart';
import 'package:adiap/screens/Seance_screen.dart';
import 'package:adiap/screens/activity_screen.dart';
import 'package:adiap/screens/create_activity.dart';
import 'package:adiap/screens/one_Activity_screen.dart';
import 'package:adiap/screens/proposition_screen.dart';
import 'package:adiap/screens/retour_screen.dart';
import 'package:flutter/material.dart';
import 'package:adiap/screens/welcome_screen.dart';
import 'package:adiap/screens/main_screen.dart';
import 'package:adiap/screens/knowledge_screen.dart';
import 'package:adiap/screens/parameter_screen.dart';
import 'package:adiap/screens/profile_screen.dart';
import 'package:adiap/screens/start_activity_screen.dart';
import 'package:adiap/screens/activity_historic_screen.dart';
import 'package:adiap/create_perso.dart';

import 'Classes/activity.dart';

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

class OneActivityRoute extends StatelessWidget {
  final Activity currentActivity;

  const OneActivityRoute({Key, key, required this.currentActivity,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OneActivityScaffold(currentActivity: currentActivity,);
  }
}

class StartActivityRoute extends StatelessWidget {
  final Activity startingActivity;

  const StartActivityRoute({Key, key, required this.startingActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StartActivityScaffold(startingActivity: startingActivity,);
  }
}

class HistoricActivityRoute extends StatelessWidget {
  final Activity concernedActivity;

  const HistoricActivityRoute({Key, key, required this.concernedActivity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HistoricActivityScaffold(concernedActivity: concernedActivity,);
  }
}

class UserFormRoute extends StatelessWidget{
  const UserFormRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateUserScaffold();
  }
}

class PropositionRoute extends StatelessWidget {
  final Activity activity;
  final OneActivity oneActivity;
  final User user;

  const PropositionRoute({Key, key, required this.activity, required this.oneActivity, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PropositionScaffold(activity: activity, oneActivity: oneActivity, user: user);
  }
}

class SeanceRoute extends StatelessWidget {
  final OneActivity oneActivity;
  final Activity activity;

  const SeanceRoute({Key, key, required this.oneActivity, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SeanceScaffold(oneActivity: oneActivity, activity: activity,);
  }
}

class RetourRoute extends StatelessWidget {
  final OneActivity oneActivity;
  final Activity activity;

  const RetourRoute({Key, key, required this.oneActivity, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RetourScaffold(oneActivity: oneActivity, activity: activity,);
  }
}

class CreateActivityRoute extends StatelessWidget {
  const CreateActivityRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CreateActivityScaffold();
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:postit/dashboard/dash.dart';
import 'firebase_options.dart';
import 'pages/optionpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POSTit',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        primarySwatch: Colors.yellow,
      ),
      navigatorKey: navigatorkey,
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('something went wrong'));
            } else if (snapshot.hasData) {
              return const Dash();
            } else {
              return const OptionsPage();
            }
          }),
    );
  }
}

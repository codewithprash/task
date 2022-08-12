import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  Future out() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              tooltip: 'Logout',
              iconSize: 26,
              onPressed: out,
              icon: const Icon(
                Icons.logout_rounded,
              )),
        ],
        title: const Text(
          'Profile',
        ),
        // elevation: 0,

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    user.email!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(onPressed: out, child: const Text('Log Out'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

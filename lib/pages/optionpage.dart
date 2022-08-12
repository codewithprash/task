import 'package:flutter/material.dart';
import 'package:postit/pages/signuppage.dart';
import 'loginpage.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Welcome',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Automatic identity verification which enables you to verify your identity',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                const Image(
                  image: AssetImage('assets/bg1.png'),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1)),
                    child: const Text(
                      "Login",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1)),
                    child: const Text(
                      "Sign up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

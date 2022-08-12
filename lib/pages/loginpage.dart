import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postit/pages/signuppage.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future signin() async {
    FocusScope.of(context).unfocus();
    final isValidForm = formkey.currentState!.validate();
    if (isValidForm) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ),
      );

      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(),
          password: _pass.text.trim(),
        );
        navigatorkey.currentState!.popUntil((route) => route.isFirst);
      } on FirebaseAuthException catch (e) {
        //print(e);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(e.message.toString()), backgroundColor: Colors.red),
        );
      }
    }
  }

  final formkey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formkey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Center(
                        child: Text(
                          'Login to your account',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text('Email'),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _email,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                              // borderRadius: BorderRadius.circular(20),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            // fillColor: Colors.transparent,
                            // filled: true,
                          ),
                          validator: (value) {
                            final regExp = RegExp(
                                r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');

                            if (!regExp.hasMatch(value!)) {
                              return 'Enter a valid email';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text('Password'),
                      const SizedBox(height: 5),
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller: _pass,
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.length < 8) {
                              return 'Your password must have at least 8 characters';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(height: 60),
                      GestureDetector(
                        onTap: signin,
                        child: Container(
                          alignment: Alignment.center,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(width: 1)),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(
                                    context,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()),
                                  );
                                },
                                child: const Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage('assets/login.jpg'),
                  fit: BoxFit.fitWidth,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

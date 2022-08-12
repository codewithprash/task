import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postit/pages/loginpage.dart';
import '../main.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  Future signup() async {
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
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _pass.text.trim(),
        );
        navigatorkey.currentState!.popUntil((route) => route.isFirst);
      } on FirebaseAuthException catch (e) {
        // print(e);
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
  //final TextEditingController _confirmpass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    //_confirmpass.dispose();

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Center(
                    child: Text(
                      'Sign up',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Create an account, it's free",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 45),
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
                      obscureText: true,
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
                      ),
                      validator: (value) {
                        if (value != null && value.length < 8) {
                          return 'Your password must have at least 8 characters';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text('Confirm Password'),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      obscureText: false,
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
                      ),
                      validator: (value) {
                        if (value != _pass.text) {
                          return 'password do not match';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  const SizedBox(height: 80),
                  GestureDetector(
                    onTap: signup,
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(width: 1)),
                      child: const Text(
                        "sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                            },
                            child: const Text(
                              'Login',
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
          ),
        ),
      ),
    );
  }
}

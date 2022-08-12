import 'package:flutter/material.dart';

class Comingsoon extends StatelessWidget {
  const Comingsoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Coming soon',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Made with ❤ by PRASHANT 2022',
              ),
            ],
          ),
        ),
      );
}

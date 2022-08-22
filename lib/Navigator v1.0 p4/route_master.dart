import 'package:flutter/material.dart';
import 'utils.dart';

class RouteMaster extends StatelessWidget {
  const RouteMaster({Key? key}) : super(key: key);
  static const routeName = '/route-master';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RouteMaster')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.buildTitle('RouteMaster'),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- To Home',
              onPressed: () {},
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- Back',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

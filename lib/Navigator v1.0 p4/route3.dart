import 'package:flutter/material.dart';
import 'utils.dart';

class RouteThree extends StatelessWidget {
  const RouteThree({Key? key}) : super(key: key);
  static const routeName = '/route3';

  @override
  Widget build(BuildContext context) {
    // String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('RouteThree')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.buildTitle("data"),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- To Home',
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

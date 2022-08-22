import 'package:flutter/material.dart';
import 'package:navigator/Navigator%20v1.0%20p4/home.dart';
import 'utils.dart';
import 'route3.dart';

class RouteTwo extends StatelessWidget {
  const RouteTwo({Key? key}) : super(key: key);
  static const routeName = '/route2';

  @override
  Widget build(BuildContext context) {
    // String data = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: const Text('RouteTwo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.buildTitle('data'),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: 'Route3 ->',
              onPressed: () {
                // using MaterialPageRoute
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RouteThree(),
                  ),
                );
              },
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- To Home',
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName(HomePage.routeName),
                );
              },
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: '<- Back',
              onPressed: () {
                Navigator.of(context).pop('Tesla');
              },
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: 'Send And Receive Data',
              onPressed: () {
                //* sending and receiving data using namedRoutes
                Navigator.pushNamed(
                  context,
                  RouteThree.routeName,
                  arguments: 'Tesla',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

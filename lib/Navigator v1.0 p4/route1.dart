import 'package:flutter/material.dart';
import 'package:navigator/Navigator%20v1.0%20p4/home.dart';
import 'package:navigator/Navigator%20v1.0%20p4/route2.dart';
import 'utils.dart';

class RouteOne extends StatelessWidget {
  RouteOne({Key? key}) : super(key: key);
  static const routeName = '/route1';
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RouteOne')),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(counter++);
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.buildTitle('RouteOne'),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: 'Route2 ->',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const RouteTwo(),
                  ),
                );
                // using NamedRoutes
                // Navigator.pushNamed(context, RouteTwo.routeName);
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
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: 'Send Data To Route 2',
              onPressed: () async {
                String data = 'Hello World';
                Navigator.of(context)
                    .push(
                      MaterialPageRoute(
                        builder: (context) => const RouteTwo(),
                        settings: RouteSettings(arguments: data),
                        maintainState: false,
                      ),
                    )
                    .then((value) => print(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}

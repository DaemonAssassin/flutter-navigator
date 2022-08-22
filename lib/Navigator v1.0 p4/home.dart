import 'package:flutter/material.dart';
import 'route1.dart';
import 'utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Utils.buildTitle('HomePage'),
            const SizedBox(height: 24.0),
            Utils.buildButton(
              title: 'Route1 ->',
              onPressed: () {
                // using MaterialPageRoute
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const RouteOne();
                //     },
                //   ),
                // );
                // using NamedRoutes
                Navigator.of(context)
                    .pushNamed(RouteOne.routeName, arguments: 'Hello');
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigator/Navigator%20v1.0%20p2/model/route_arguments.dart';

class Route4 extends StatelessWidget {
  const Route4({Key? key}) : super(key: key);
  static const routeName = '/route4';

  final String title = 'Route4';

  @override
  Widget build(BuildContext context) {
    //* getting/receiving data from the ModalRoute
    RouteArguments argument =
        ModalRoute.of(context)!.settings.arguments as RouteArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('${argument.title} | ${argument.message}'),
      ),
      backgroundColor: Colors.lime.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                '->',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                '<- Route3',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* Navigator.of(context).popAndPushNamed()
              onPressed: () {
                Navigator.of(context).popAndPushNamed('/route-master');
              },

              child: const Text(
                'PopAndPush Master',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              child: const Text(
                '<- Route3 Maybe',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* Navigator.popUntil()
              //* Navigator.of(context).popUntil()
              //? using custom predicate (range)
              onPressed: () {
                int range = 0;
                Navigator.of(context).popUntil(
                  (route) {
                    return range++ == 2;
                  },
                );
              },
              child: const Text(
                'Pop Till Home',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* Navigator.pushNamedAndRemoveUntil()
              //* Navigator.of(context).pushNamedAndRemoveUntil()
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/route-master',
                  (route) => false, // when false returning the navigator
                  // is continue to pop until no element. when true the pop
                  // stopped
                );
              },
              //? Route1 -> Route2 -> Route3 -> Route4
              //? RouteMaster

              child: const Text(
                'pushAndRemoveUntil (-> Master)',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

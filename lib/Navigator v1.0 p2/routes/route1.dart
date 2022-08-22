import 'package:flutter/material.dart';
import '../model/route_arguments.dart';
import 'route4.dart';

import 'route2.dart';

class Route1 extends StatelessWidget {
  static const routeName = '/';

  Route1({Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController();
  final String title = 'Route1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
              //* Navigator.of(context).pushNamed()
              onPressed: () {
                Navigator.of(context).pushNamed('/route2');
              },
              child: const Text(
                'Route2 ->',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* Navigator.canPop()
              onPressed: () {
                Navigator.canPop(context);
                // true -> if this is not last route in stack
                // false -> if this is last route in stack
              },
              //* Navigator.of(context).canPop()

              child: const Text(
                '<-',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Title of next route',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* receiving data from closing route/activity
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  String name = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Route2(),
                    ),
                  );
                  //? name got the result(data)
                }
              },
              child: const Text(
                'Send Data',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* sending data using named routes (using arguments)
              onPressed: () {
                String name = _controller.text;
                if (name.isNotEmpty) {
                  Navigator.of(context).pushNamed(
                    '/route3',
                    arguments: name,
                  );
                }
              },

              child: const Text(
                'Send Data To Route 3',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              //* sending data using named routes
              //* (using arguments)
              //* (using model class)
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Route4.routeName,
                  arguments: const RouteArguments(
                    title: 'Route 4G',
                    message: 'Message 4G',
                  ),
                );
              },

              child: const Text(
                'Send Data To Route 4',
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

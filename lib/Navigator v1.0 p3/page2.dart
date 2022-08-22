import 'package:flutter/material.dart';

import 'page3.dart';

typedef MapSD = Map<String, dynamic>;

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  static const routeName = '/page2';

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int a = 3;

  @override
  Widget build(BuildContext context) {
    //* getting/receiving data from ModalRoute
    var name = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page2 $a'),
      ),
      backgroundColor: Colors.red.shade200,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Page3(),
                  ),
                );
              },
              child: const Text(
                'Route3 ->',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => a++),
      ),
    );
  }
}

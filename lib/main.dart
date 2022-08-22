import 'package:flutter/material.dart';
import 'Navigator v1.0 p1/screen1.dart';
import 'Navigator v1.0 p1/screen2.dart';
import 'Navigator v1.0 p1/screen3.dart';
import 'Navigator v1.0 p2/routes/route1.dart';
import 'Navigator v1.0 p2/routes/route2.dart';
import 'Navigator v1.0 p2/routes/route3.dart';
import 'Navigator v1.0 p2/routes/route4.dart';
import 'Navigator v1.0 p2/routes/route_master.dart';
import 'Navigator v1.0 p3/page1.dart';
import 'Navigator v1.0 p3/page2.dart';
import 'Navigator v1.0 p4/home.dart';
import 'Navigator v1.0 p4/route1.dart';
import 'Navigator v1.0 p4/route2.dart';
import 'Navigator v1.0 p4/route3.dart';
import 'Navigator v1.0 p4/route_master.dart' as p4;

void main(List<String> args) {
  runApp(const Navigator1P4());
}

class Navigator1P1 extends StatelessWidget {
  const Navigator1P1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/screen2': (BuildContext context) => const Screen2(),
        '/screen3': (BuildContext context) => const Screen3(),
      },
      home: const Screen1(),
    );
  }
}

class Navigator1P2 extends StatelessWidget {
  const Navigator1P2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //* routes
      routes: {
        Route1.routeName: (_) => Route1(),
        Route2.routeName: (_) => const Route2(),
        Route3.routeName: (_) => const Route3(),
        Route4.routeName: (_) => const Route4(),
        RouteMaster.routeName: (_) => const RouteMaster(),
      },
      initialRoute: Route1.routeName,
    );
  }
}

class Navigator1P3 extends StatelessWidget {
  const Navigator1P3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _getOnGenerateRoute,
      onUnknownRoute: _getOnUnknownRoute,
    );
  }

  //* onGenerateRoute
  //* we have to check that setting belongs to which route.
  //* according to that we open specific route/activity/page.
  //* and can extract args from setting and pass to the opening
  //* route.
  Route? _getOnGenerateRoute(RouteSettings settings) {
    if (settings.name == Page1.routeName) {
      return MaterialPageRoute(
        builder: (context) => const Page1(),
        settings: settings,
      );
    } else if (settings.name == Page2.routeName) {
      return MaterialPageRoute(
        builder: (context) => const Page2(),
        settings: settings,
      );
    }
    return null;
  }

  //* Called when onGenerateRoute fails to generate a route.
  Route? _getOnUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return const ErrorWidget();
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text(
          'Error',
          style: TextStyle(
            fontSize: 48.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}

class Navigator1P4 extends StatelessWidget {
  const Navigator1P4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      // initialRoute: HomePage.routeName,
      // routes: {
      //   HomePage.routeName: (_) => const HomePage(),
      //   RouteOne.routeName: (_) => RouteOne(),
      //   RouteTwo.routeName: (_) => const RouteTwo(),
      //   RouteThree.routeName: (_) => const RouteThree(),
      //   p4.RouteMaster.routeName: (_) => const p4.RouteMaster(),
      // },
      onGenerateRoute: getOnGenerateRoute,
    );
  }

  Route? getOnGenerateRoute(RouteSettings settings) {
    Widget route = const ErrorWidget();
    switch (settings.name) {
      case HomePage.routeName:
        route = const HomePage();
        break;
      case RouteOne.routeName:
        route = RouteOne();
        break;
      case RouteTwo.routeName:
        route = const RouteTwo();
        break;
      case RouteThree.routeName:
        route = const RouteThree();
        break;
      case p4.RouteMaster.routeName:
        route = const p4.RouteMaster();
        break;
      default:
        route = const ErrorWidget();
    }
    return MaterialPageRoute(
      builder: (context) => route,
      settings: settings,
    );
  }
}

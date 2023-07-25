import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation_practice/router_config.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main(){
  usePathUrlStrategy();
  runApp(MyApp());
}


AppConfig config = AppConfig();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerDelegate: config.router.routerDelegate,
      routeInformationParser: config.router.routeInformationParser,
    );
  }
}


class MyHomePage extends StatefulWidget {
    MyHomePage({Key? key,required this.child}) : super(key: key);
    Widget child;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    print(config.router.location);
    String url = Uri.parse(config.router.location).pathSegments.last;

    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: Column(
              children: [
                ListTile(
                  title: url == 'dashboard' ? Text('Dashboard',style: TextStyle(color: Colors.red),):  Text('Dashboard'),
                  onTap: (){
                    GoRouter.of(context).goNamed('dashboard');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                 title: url == 'market_place' ? Text('MarketPlace',style: TextStyle(color: Colors.red),):  Text('MarketPlace'),
                    onTap: (){
                      GoRouter.of(context).goNamed('market_place');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: url == 'organisation' ? Text('Organiastion',style: TextStyle(color: Colors.red),):  Text('Organisation'),
                    onTap: (){
                      GoRouter.of(context).pushNamed('organisation');
                    },
                  ),
                ),

                ListTile(
                  title: url == 'app_builder' ? Text('App Builder',style: TextStyle(color: Colors.red),):  Text('App Builder'),
                  onTap: (){
                    GoRouter.of(context).pushNamed('app_builder');
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: ListTile(
                    title: url == 'navigation_menu' ? Text('Navigation Menu',style: TextStyle(color: Colors.red),):  Text('Navigation Menu'),
                    onTap: (){
                      GoRouter.of(context).pushNamed('navigation_menu');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: ListTile(
                    title: url == 'ui_builder' ? Text('UI Builder',style: TextStyle(color: Colors.red),):  Text('UI Builder'),
                    onTap: (){
                      GoRouter.of(context).pushNamed('ui_builder');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: ListTile(
                    title: url == 'story_board' ? Text('Story Board',style: TextStyle(color: Colors.red),):  Text('Story Board'),
                    onTap: (){
                      GoRouter.of(context).pushNamed('story_board');
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: widget.child)
        ],
      ),
    );
  }
}

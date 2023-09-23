import 'package:flutter/material.dart';
import 'package:ulearning_app_bloc/pages/application/widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(0),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.amber,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'Search',
                  icon: Icon(Icons.search),
                ),
                BottomNavigationBarItem(
                  label: 'Play',
                  icon: Icon(Icons.play_arrow),
                ),
                BottomNavigationBarItem(
                  label: 'Chat',
                  icon: Icon(Icons.message),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                ),
              ]),
        ),
      ),
    );
  }
}

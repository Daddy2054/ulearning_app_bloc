import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app_bloc/app_blocs.dart';
import 'package:ulearning_app_bloc/app_events.dart';
import 'package:ulearning_app_bloc/app_states.dart';
import 'package:ulearning_app_bloc/pages/application/application_page.dart';
import 'package:ulearning_app_bloc/pages/bloc_providers.dart';
import 'package:ulearning_app_bloc/pages/sign_in/sign_in.dart';
import 'package:ulearning_app_bloc/pages/welcome/welcome.dart';

import 'common/values/colors.dart';
import 'firebase_options.dart';
import 'pages/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

//  on step 16-17? add multidex support running "flutter run" from terminal

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
//          home: const Welcome(),
          home: const ApplicationPage(),
          routes: {
            'myHomePage': (context) => const MyHomePage(title: 'title'),
            'signIn': (context) => const SignIn(),
            'register': (context) => const Register(),
          },
      theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(
                          color: AppColors.primaryText,
                        ),
                        elevation: 0,
                        backgroundColor: Colors.white)),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: BlocBuilder<AppBlocs, AppStates>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  //   '$_counter',
                  '${BlocProvider.of<AppBlocs>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

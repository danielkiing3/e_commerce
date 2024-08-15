import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: UAppTheme.lightTheme,
        darkTheme: UAppTheme.dartTheme,

        // Shows circular progress indicator meanwhile Authenication Repository is deciding to show relevant screen
        home: const Scaffold(
          backgroundColor: UColors.primary,
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}

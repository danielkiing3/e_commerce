import 'package:e_commerce/app.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authenication/authenication_repository.dart';

Future<void> main() async {
  /// -- Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent));

  /// -- GetX Local Storage
  await GetStorage.init();

  /// -- Await Native Splash until other items loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // TODO: Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp _) => Get.put(AuthenicationRepository()));
  // TODO: Initialize Authenication
  //

  runApp(const App());
}

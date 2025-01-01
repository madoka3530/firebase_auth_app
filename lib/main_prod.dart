import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_config.dart';
import 'flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  FlavorConfig(
    flavor: Flavor.prod,
    name: "Production",
  );

  final firebaseOptions = await FirebaseConfig.getConfig('prod');
  await Firebase.initializeApp(options: firebaseOptions);
  
  runApp(const ProviderScope(child: MyApp()));
}

// Import and use MyApp from your existing main.dart

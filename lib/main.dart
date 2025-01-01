import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';
import 'config/firebase_config.dart';
import 'flavors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final firebaseOptions = await FirebaseConfig.getConfig(F.name);
  await Firebase.initializeApp(options: firebaseOptions);
  
  runApp(const ProviderScope(child: App()));
}

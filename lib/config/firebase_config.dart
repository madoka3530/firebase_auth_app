import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<FirebaseOptions> getConfig(String environment) async {
    final String configPath = 'config/firebase/$environment/firebase_config.json';
    final String jsonString = await rootBundle.loadString(configPath);
    final Map<String, dynamic> json = jsonDecode(jsonString);

    return FirebaseOptions(
      apiKey: json['apiKey'] as String,
      authDomain: json['authDomain'] as String,
      projectId: json['projectId'] as String,
      storageBucket: json['storageBucket'] as String,
      messagingSenderId: json['messagingSenderId'] as String,
      appId: json['appId'] as String,
    );
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hackmotion_test_assignment/models/swing_model.dart';

class SwingProcessor {
  Future<List<Swing>> getSwings() async {
    List<Swing> swings = [];
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      final swingFiles = manifestMap.keys
          .where((String key) =>
              key.contains('data/swings') && key.endsWith('.json'))
          .toList();

      for (var file in swingFiles) {
        final String response = await rootBundle.loadString(file);
        final data = json.decode(response);
        swings.add(Swing.fromJson(data));
      }
    } catch (e) {
      print('Failed to load swings: $e');
    }
    return swings;
  }
}

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hackmotion_test_assignment/models/swing_model.dart';

class SwingProcessor {
  Stream<Swing> getSwings({bool includeFilePath = false}) async* {
    try {
      final AssetManifest assetManifest =
          await AssetManifest.loadFromAssetBundle(rootBundle);
      final swingFiles = assetManifest
          .listAssets()
          .where((key) => key.contains('data/swings') && key.endsWith('.json'))
          .toList();

      yield* loadAndParseSwings(swingFiles, includeFilePath: includeFilePath);
    } catch (e) {
      print('Failed to load swings: $e');
    }
  }
}

Stream<Swing> loadAndParseSwings(List<String> swingFiles,
    {bool includeFilePath = false}) async* {
  for (var file in swingFiles) {
    final swing =
        await loadAndParseSwing(file, includeFilePath: includeFilePath);
    yield swing;
  }
}

Future<Swing> loadAndParseSwing(String file,
    {bool includeFilePath = false}) async {
  final String response = await rootBundle.loadString(file);
  final data = json.decode(response);
  final swing = Swing.fromJson(data);
  if (includeFilePath) {
    swing.filePath = file;
  }
  return swing;
}

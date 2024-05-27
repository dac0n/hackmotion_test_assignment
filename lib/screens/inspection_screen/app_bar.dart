import 'package:flutter/material.dart';

AppBar buildInspectionScreenAppBar(BuildContext context) {
  return AppBar(
    title: const Text('Inspection'),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}

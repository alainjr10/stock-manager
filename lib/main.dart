import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/app.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

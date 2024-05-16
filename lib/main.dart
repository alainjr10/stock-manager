import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

const supabaseKey = String.fromEnvironment("Supabase-API-Key");
void main() async {
  await Supabase.initialize(
    url: 'https://qvhfpqthswskhahnrmzc.supabase.co',
    anonKey: supabaseKey,
  );
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    // size: Size(950, 650),
    minimumSize: Size(950, 650),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    // titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const ProviderScope(child: MainApp()));
}

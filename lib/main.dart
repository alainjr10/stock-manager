import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseKey = String.fromEnvironment("Supabase-API-Key");
void main() async {
  await Supabase.initialize(
    url: 'https://qvhfpqthswskhahnrmzc.supabase.co',
    anonKey: supabaseKey,
  );
  runApp(const ProviderScope(child: MainApp()));
}

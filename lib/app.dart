import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager/src/config/router/router.dart';
import 'package:stock_manager/src/config/themes/stock_man_theme.dart';

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      builder: (context, child) {
        final router = ref.watch(routerProvider);
        return MaterialApp.router(
          title: 'Stock Manager',
          theme: StockManCustomTheme.themeData(true, context),
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

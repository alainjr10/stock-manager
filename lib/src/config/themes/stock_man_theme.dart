import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mbele_app/app/utils/constants.dart';

class StockManCustomTheme {
  static ThemeData themeData(bool isDarkMode, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkMode ? const Color(0xFF222222) : Colors.white,
      useMaterial3: true,
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.all(
          isDarkMode ? const Color(0xFF303330) : kGreyColor,
        ),
        thumbColor: MaterialStateProperty.all(
          const Color(0xff554AF0),
        ),
      ),

      textTheme: Theme.of(context)
          .textTheme
          .copyWith(
            bodyMedium: GoogleFonts.poppins().copyWith(),
            bodySmall: GoogleFonts.poppins().copyWith(),
            bodyLarge: GoogleFonts.poppins().copyWith(),
            titleLarge: GoogleFonts.poppins().copyWith(),
            titleMedium: GoogleFonts.poppins().copyWith(),
            titleSmall: GoogleFonts.poppins().copyWith(),
            displayLarge: GoogleFonts.poppins().copyWith(),
            displayMedium: GoogleFonts.poppins().copyWith(),
            displaySmall: GoogleFonts.poppins().copyWith(),
            headlineLarge: GoogleFonts.poppins().copyWith(),
            headlineMedium: GoogleFonts.poppins().copyWith(),
            headlineSmall: GoogleFonts.poppins().copyWith(),
            labelLarge: GoogleFonts.poppins().copyWith(),
            labelMedium: GoogleFonts.poppins().copyWith(),
            labelSmall: GoogleFonts.poppins().copyWith(),
          )
          .apply(
            bodyColor: isDarkMode ? Colors.white : Colors.black,
            displayColor: Colors.grey,
          ),
      // primaryColor: isDarkMode ? const Color(0xFF202320) : Colors.white,
      primaryColor: const Color(0xff554AF0),
      indicatorColor:
          isDarkMode ? const Color(0xFF0E1D36) : const Color(0xFFCBDCF8),
      // hintColor: isDarkMode ? const Color(0xFF280C0B) : const Color(0xff133762),
      // highlightColor:
      //     isDarkMode ? const Color(0xFF372901) : const Color(0xff133762),
      // hoverColor:
      //     isDarkMode ? const Color(0xFF3A3A3B) : const Color(0xff133762),
      // focusColor:
      //     isDarkMode ? const Color(0xFF0B2512) : const Color(0xff133762),
      disabledColor: Colors.grey,
      cardColor: isDarkMode ? const Color(0xFF303330) : Colors.white,
      canvasColor: isDarkMode ? Colors.black : Colors.grey[50],
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkMode
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme.of(context).copyWith(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.white,
        ),
        backgroundColor: isDarkMode ? const Color(0xFF333333) : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: isDarkMode ? Colors.white : Colors.black,
          size: 32,
          weight: 700,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            isDarkMode ? Colors.white : Colors.black,
          ),
          iconSize: MaterialStateProperty.all<double>(28.0),
          iconColor: MaterialStateProperty.all<Color>(
            isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),

      // cardTheme: CardTheme.of(context).copyWith(
      //   color: kPrimaryColor.withOpacity(0.08),
      //   elevation: 0,
      //   shadowColor: isDarkMode ? const Color(0xFF333333) : Colors.white,
      // ),

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff554AF0),
      ).copyWith(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        // primary: const Color(0xff554AF0),
        // onPrimary:
        //     isDarkMode ? const Color(0xFFF9FBF8) : const Color(0xFFF9FBF8),
        // primaryContainer: isDarkMode ? const Color(0xFF222222) : Colors.white,
        // onPrimaryContainer:
        //     isDarkMode ? const Color(0xFFF9FBF8) : const Color(0xFF202320),
        // secondary:
        //     isDarkMode ? const Color(0xFF444444) : const Color(0xffF8F8FA),
        // onSecondary: isDarkMode ? const Color(0xFFF9FBF8) : Colors.black,
        // secondaryContainer: kPrimaryColor.withOpacity(0.15),
        // onSecondaryContainer: Colors.black,
        // background: isDarkMode ? const Color(0xFF222222) : Colors.white,
        // brightness: isDarkMode ? Brightness.dark : Brightness.light,
        // surface: isDarkMode ? const Color(0xFF333333) : const Color(0xFFE5E5E5),
        // onSurface:
        //     isDarkMode ? const Color(0xFFFFFFFF) : const Color(0xFF333333),
        // tertiary:
        //     isDarkMode ? const Color(0xFF444444) : const Color(0xFFE5E5E5),
        // error: const Color(0xffFF0000),
        // onError: const Color(0xffffffff),
        // errorContainer: const Color(0xfffcd8df),
        // onErrorContainer: const Color(0xff141213),
        // onBackground: const Color(0xff090909),
        // surfaceVariant: const Color(0xffe0e4e8),
        // onSurfaceVariant: const Color(0xff111112),
        // outline: const Color(0xff828282),
        // outlineVariant: const Color(0xffc8c8c8),
        // shadow: const Color(0xff000000),
        // scrim: const Color(0xff000000),
        // inverseSurface: const Color(0xff101214),
        // onInverseSurface: const Color(0xfff5f5f5),
        // inversePrimary: const Color(0xff92c5ee),
        // surfaceTint: const Color(0xff004881),
      ),
    );
  }
}

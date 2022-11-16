import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:otdohni_app/constants.dart';
import 'package:otdohni_app/l10n/l10n.dart';
import 'package:otdohni_app/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time for Rest',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme(
            primary: primaryColor,
            primaryVariant: primaryColor,
            secondary: secondaryColor,
            secondaryVariant: secondaryColor,
            surface: surfaceColor,
            background: backgroundColor,
            error: errorColor,
            onPrimary: textColorOnDark,
            onSecondary: textColorOnLight,
            onSurface: onSurfaceColor,
            onBackground: onBackgroundColor,
            onError: onErrorColor,
            brightness: Brightness.light),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: primaryColor,
          actionsIconTheme: IconThemeData(
            color: onPrimaryColor,
          ),
          iconTheme: IconThemeData(
            color: onPrimaryColor,
          ),
        ),
        textTheme: const TextTheme(
          headline4: TextStyle(
              fontSize: 75.0,
              color: onBackgroundColor,
              fontWeight: FontWeight.bold),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: HomeScreen(),
    );
  }
}

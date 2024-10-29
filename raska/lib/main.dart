import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raska/pages/main_page.dart';
import 'package:raska/pages/splash_page(1).dart';
import 'package:raska/pages/splash_page(2).dart';
import 'domain/providers/donation_provider.dart';
import 'domain/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonationProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Raska App',
          theme: themeProvider.themeData, // Apply the theme based on provider
          home: Splash1(),
          routes: {
            '/splash2':(context) => Splash2(),
            '/main_page':(context) => MainPage(),

          },
        );
      },
    );
  }
}

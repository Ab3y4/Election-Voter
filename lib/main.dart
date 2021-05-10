import 'package:easy_localization/easy_localization.dart';
import 'package:election_voter/Screens/Instructions.dart';
import 'package:election_voter/Screens/Login.dart';
import 'package:election_voter/Screens/PartyScreen.dart';
import 'package:election_voter/Screens/PeopleList.dart';
import 'package:election_voter/Screens/SignupScreen.dart';
import 'package:election_voter/Screens/SplashScreen.dart';
import 'package:election_voter/translations/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:election_voter/Screens/LanguageScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        path: 'assets/translations',
        supportedLocales: [
          Locale('en'),
          Locale('fr'),
        ],
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Election Voter',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language': (context) => LanguageScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/party': (context) => PartyScreen(),
        '/candidates': (context) => PeopleList(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

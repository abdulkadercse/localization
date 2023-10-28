import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/Language/language_provider.dart';
import 'package:localization/home.dart';
import 'package:provider/provider.dart' as pro;
import 'package:localization/generated/l10n.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return pro.ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context)=>LanguageChangeProvider(),
      child: Builder(builder: (context){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: pro.Provider.of<LanguageChangeProvider>(context,listen: true).currentLocal,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const[
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          home: const HomeScreen(),
        );
      }),
    );
  }
}




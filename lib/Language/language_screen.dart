import 'package:flutter/material.dart';
import 'package:localization/Language/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:localization/generated/l10n.dart' as lang;

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  List<String> languageName = [
    "English",
    "Bangla"
  ];

  String selectedLanguage = 'English';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lang.S.of(context).language),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: languageName.length,
              itemBuilder: (context,index){
            return ListTile(
              onTap: (){
                setState(() {

                  selectedLanguage= languageName[index];
                  selectedLanguage=='English'?
                      context.read<LanguageChangeProvider>().changeLocal("en"):
                  selectedLanguage=='Bangla'?
                  context.read<LanguageChangeProvider>().changeLocal("bn"):
                  context.read<LanguageChangeProvider>().changeLocal("en");

                });
              },
              title: Text(languageName[index]),
            );
          })
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:localization/Language/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:localization/generated/l10n.dart' as lang;
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> saveData(String data)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("savedLanguage", data);
  }
  getData()async{
    final prefs = await SharedPreferences.getInstance();
    selectedLanguage = prefs.getString("savedLanguage")??selectedLanguage;
    setState(() {

    });
  }

  Future<void>saveDataOnLocal ({required String key,required String type, required dynamic value})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if(type=="bool") prefs.setBool(key, value);
    if(type=="string") prefs.setString(key, value);
  }

  @override
  void initState() {
    getData();
    selectedLanguage;
    // TODO: implement initState
    super.initState();
  }


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
                  saveDataOnLocal(key: "savedLanguage", type: "string", value: selectedLanguage);
                  saveData(selectedLanguage);

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

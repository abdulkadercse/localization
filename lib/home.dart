import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:localization/Language/language_provider.dart';
import 'package:localization/Language/language_screen.dart';
import 'package:localization/generated/l10n.dart' as lang;
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
enum Language {english,bangla}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(lang.S.of(context).name),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          const SizedBox(height: 20,),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const LanguageScreen()));
            },
            child: Container(
              color: Colors.red,
              height: 30,
              width: 40,
            ),
          )
        ],
      ),
    );
  }
}

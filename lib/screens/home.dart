import 'package:flutter/material.dart';
import 'package:hiragana_katakana/controllers/character_controller.dart';
import 'package:hiragana_katakana/models/character_model.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CharacterController characterController = CharacterController();

  List<Character> characters = [];

  @override
  void initState() {
    characters.add(Character(
        "getting data", "getting data", "getting data", "getting data"));
    getCharacters();
    super.initState();
  }

  void getCharacters() async {
    characters = await characterController.getData(context);
    updateCharacters();
  }

  void updateCharacters() {
    setState(() {
      characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(characters[0].hiragana),
        // child: FutureBuilder(future: characterController.getDataFromXML(context), builder: (context, data){
        //   if(data.hasData){
        //     List<Character> characters = data.data;
        //     return ListView.builder(itemCount: characters.length,
        //     itemBuilder: (context, index){
        //       return ListTile(title: Text(characters[index].english), subtitle: Text(characters[index].hiragana),);
        //     });
        //   } else {
        //     return Center(child: CircularProgressIndicator());
        //   }
        // },),
      )),
    );
  }
}

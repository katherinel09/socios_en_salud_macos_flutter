import 'package:flutter/material.dart';
import 'package:socios_en_salud_macos_flutter/main.dart';
import 'package:socios_en_salud_macos_flutter/SurveyBot.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Socios en Salud'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when clicked.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text('Return to homepage'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the second page when clicked.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SesSurvey()));
                },
                child: Text('To chatbott'),
              ),
            ],
          ),
        ));
  }
}

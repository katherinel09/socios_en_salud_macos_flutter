import 'package:flutter/material.dart';
import 'package:ses_chatter_bot_app/chatbot/chat_complete_page.dart';
import 'package:ses_chatter_bot_app/chatbot/completion.dart';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:ses_chatter_bot_app/main.dart';

const apiKey = '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';

void main() => runApp(ChatBot(chatGpt: ChatGpt(apiKey: apiKey)));

class ChatBot extends StatelessWidget {
  final ChatGpt chatGpt;

  const ChatBot({super.key, required this.chatGpt});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: Colors.transparent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Socios en Salud'),
          backgroundColor: Colors.orange,
          actions: [
            ElevatedButton(
                onPressed: () {
                  // Navigate to the chatbot when clicked.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GeneratorPage(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Color(0xFF202226),
                        fontSize: screenHeight * 0.02, // 2% of screen height
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0.09,
                        letterSpacing: -0.21,
                      ),
                    ),
                  ),
                ))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Text('Chat completion')),
              Tab(icon: Text('Completion')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatCompletionPage(chatGpt: chatGpt),
            CompletionPage(chatGpt: chatGpt),
          ],
        ),
      ),
    );
  }
}

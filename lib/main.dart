import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ses_chatter_bot_app/chatbot/completion.dart';
import '/sub_paginas/comida.dart';
import '/sub_paginas/salud_mental.dart';
import '/sub_paginas/ejercicios.dart';

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';

import 'package:flutter/material.dart';

import 'chatbot/chat_complete_page.dart';

const apiKey = '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';

void main() => runApp(MyApp(chatGpt: ChatGpt(apiKey: apiKey)));

class MyApp extends StatelessWidget {
  final ChatGpt chatGpt;

  const MyApp({super.key, required this.chatGpt});

  @override
  Widget build(BuildContext context) {
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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
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
      ),
    );
  }
}


// Future main() async {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'Socios en Salud App',
//         theme: ThemeData(
//           useMaterial3: true,
//           colorScheme:
//               ColorScheme.fromSeed(seedColor: Color.fromRGBO(233, 158, 82, 1)),
//         ),
//         routes: <String, WidgetBuilder>{
//           '/salud_mental': (BuildContext context) => SaludMentalPagina(),
//           '/ejercicio': (BuildContext context) => EjercicioPagina(),
//           '/comida': (BuildContext context) => ComidaPagina(),
//         },
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();

//   void getNext() {
//     current = WordPair.random();
//     notifyListeners();
//   }

//   // ↓ Add the code below.
//   var favorites = <WordPair>[];

//   void toggleFavorite() {
//     if (favorites.contains(current)) {
//       favorites.remove(current);
//     } else {
//       favorites.add(current);
//     }
//     notifyListeners();
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     Widget page;
//     switch (selectedIndex) {
//       case 0:
//         page = GeneratorPage();
//       //break;
//       case 1:
//         page = ComidaPagina();
//       //break;
//       default:
//         throw UnimplementedError('no widget for $selectedIndex');
//     }

//     return LayoutBuilder(builder: (context, constraints) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Socios en Salud'),
//           backgroundColor: Colors.orange,
//         ),
//         body: Row(
//           children: [
//             SafeArea(
//               child: NavigationRail(
//                 extended: constraints.maxWidth >= 600,
//                 destinations: [
//                   NavigationRailDestination(
//                     icon: Icon(Icons.home),
//                     label: Text('Home'),
//                   ),
//                   NavigationRailDestination(
//                     icon: Icon(Icons.favorite),
//                     label: Text('Favorites'),
//                   ),
//                 ],
//                 selectedIndex: selectedIndex,
//                 onDestinationSelected: (value) {
//                   setState(() {
//                     selectedIndex = value;
//                   });
//                   print('selected: $value');
//                 },
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 color: Theme.of(context).colorScheme.primaryContainer,
//                 child: page,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class GeneratorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair = appState.current;

//     // IconData likeIcon;
//     // if (appState.favorites.contains(pair)) {
//     //   likeIcon = Icons.favorite;
//     // } else {
//     //   likeIcon = Icons.favorite_border;
//     // }

//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center, // ← Add this.
//           children: [
//             // BigCard(),
//             // SizedBox(height: 10),
//             // Row(
//             //   mainAxisSize: MainAxisSize.min,
//             //   children: [
//             //     ElevatedButton.icon(
//             //       onPressed: () {
//             //         appState.toggleFavorite();
//             //       },
//             //       icon: Icon(likeIcon),
//             //       label: Text('Like'),
//             //     ),
//             //     SizedBox(width: 10),
//             //     ElevatedButton(
//             //       onPressed: () {
//             //         appState.getNext();
//             //       },
//             //       child: Text('Next'),
//             //     ),
//             //   ],
//             // ),
//             Row(mainAxisSize: MainAxisSize.min, children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(200, 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ComidaPagina(),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.insert_emoticon),
//                       label: Text('ChatBot'),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(200, 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => EjercicioPagina(),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.directions_run),
//                       label: Text('Ejercicios'),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(200, 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SaludMentalPagina(),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.health_and_safety),
//                       label: Text('Salud mental'),
//                     ),
//                     SizedBox(height: 10),
//                     ElevatedButton.icon(
//                       style: ElevatedButton.styleFrom(
//                         fixedSize: Size(200, 40),
//                       ),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ComidaPagina(),
//                           ),
//                         );
//                       },
//                       icon: Icon(Icons.restaurant_menu),
//                       label: Text('Alimentacion'),
//                     ),
//                   ],
//                 ),
//               )
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BigCard extends StatelessWidget {
//   final String pair = "ChatBot";

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final style = theme.textTheme.displayMedium!
//         .copyWith(color: theme.colorScheme.onPrimary, fontSize: 20);

//     return Card(
//       color: theme.colorScheme.primaryContainer,
//       child: Padding(
//         padding: const EdgeInsets.all(20),

//         // ↓ Make the following change.
//         child: Text(
//           pair,
//           style: style,
//           semanticsLabel: pair,
//         ),
//       ),
//     );
//   }
// }

import 'package:chat_gpt_flutter/chat_gpt_flutter.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ses_chatter_bot_app/chatbot/chatbot.dart';
import '/sub_paginas/comida.dart';
import '/sub_paginas/salud_mental.dart';
import '/sub_paginas/ejercicios.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String apiKey = "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";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Socios en Salud App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(233, 158, 82, 1)),
        ),
        routes: <String, WidgetBuilder>{
          '/salud_mental': (BuildContext context) => const SaludMentalPagina(),
          '/ejercicio': (BuildContext context) => EjercicioPagina(),
          '/comida': (BuildContext context) => const ComidaPagina(),
          // '/chatbot': (BuildContext context) => ChatBot(),
        },
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  // ↓ Add the code below.
  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
      //break;
      case 1:
        page = const ComidaPagina();
      //break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Socios en Salud'),
          backgroundColor: Colors.orange,
        ),
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                  // print('selected: $value');
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    // IconData likeIcon;
    // if (appState.favorites.contains(pair)) {
    //   likeIcon = Icons.favorite;
    // } else {
    //   likeIcon = Icons.favorite_border;
    // }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // ← Add this.
          children: [
            // BigCard(),
            // SizedBox(height: 10),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     ElevatedButton.icon(
            //       onPressed: () {
            //         appState.toggleFavorite();
            //       },
            //       icon: Icon(likeIcon),
            //       label: Text('Like'),
            //     ),
            //     SizedBox(width: 10),
            //     ElevatedButton(
            //       onPressed: () {
            //         appState.getNext();
            //       },
            //       child: Text('Next'),
            //     ),
            //   ],
            // ),
            Row(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChatBot(chatGpt: ChatGpt(apiKey: apiKey)),
                          ),
                        );
                      },
                      icon: const Icon(Icons.insert_emoticon),
                      label: const Text('ChatBot'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EjercicioPagina(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.directions_run),
                      label: const Text('Ejercicios'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SaludMentalPagina(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.health_and_safety),
                      label: const Text('Salud mental'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 40),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ComidaPagina(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.restaurant_menu),
                      label: const Text('Alimentacion'),
                    ),
                  ],
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  final String pair = "ChatBot";

  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.onPrimary, fontSize: 20);

    return Card(
      color: theme.colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),

        // ↓ Make the following change.
        child: Text(
          pair,
          style: style,
          semanticsLabel: pair,
        ),
      ),
    );
  }
}

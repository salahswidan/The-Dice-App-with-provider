// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   //can't make update for any variable
//   const MyApp({super.key}); // constrator
//   // This widget is the root of your application.
//   @override // because StatelessWidget is abstract
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   //can make update for any variable
//   const MyHomePage({super.key, required this.title});
//   final String title;
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       // to make update for the variable
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(App());
// }

// class App extends StatefulWidget {
//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text("The Dice App "),
//           backgroundColor: Colors.green[700],
//           actions: [Text(' ROLL ONE DICE')],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Center(
//                 child: Text(
//                   'Shake to throw',
//                   style: TextStyle(
//                     fontSize: 32,
//                   ),
//                 ),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Spacer(
//                     flex: 2,
//                   ),
//                   Image(
//                       image: AssetImage(images[
//                           currentIndex])), // display the current image from the list
//                   Spacer(
//                     flex: 1,
//                   ),
//                   Image(
//                       image: AssetImage(images[
//                           secondIndex])), // display the second image from the list
//                   Spacer(
//                     flex: 2,
//                   ),
//                 ],
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   changeImage();
//                   changeSecondImage();
//                 },
//                 child: Text('ROLL DICE'),
//               ),
//               Spacer(
//                 flex: 1,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<String> images = [
//     'images/dice-result-two.png',
//     'images/dice-roll.png',
//     'images/die-face (1).png',
//     'images/die-face.png',
//     'images/dice (1).png',
//     'images/dice.png',
//   ];

//   int currentIndex = 0;
//   int secondIndex = 0;

//   void changeImage() {
//     setState(() {
//       currentIndex = Random().nextInt(images.length);
//     });
//   }

//   void changeSecondImage() {
//     setState(() {
//       do {
//         secondIndex = Random().nextInt(images.length);
//       } while (secondIndex == currentIndex);
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DiceState(),
      child: App(),
    ),
  );
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("The Dice App "),
          backgroundColor: Colors.green[700],
          actions: [Text(' ROLL ONE DICE')],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Shake to throw',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Consumer<DiceState>(
                    builder: (context, diceState, child) {
                      return Image(
                        image: AssetImage(images[diceState.currentIndex]),
                      );
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Consumer<DiceState>(
                    builder: (context, diceState, child) {
                      return Image(
                        image: AssetImage(images[diceState.secondIndex]),
                      );
                    },
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<DiceState>(context, listen: false).changeImage();
                  Provider.of<DiceState>(context, listen: false)
                      .changeSecondImage();
                },
                child: Text('ROLL DICE'),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> images = [
    'images/dice-result-two.png',
    'images/dice-roll.png',
    'images/die-face (1).png',
    'images/die-face.png',
    'images/dice (1).png',
    'images/dice.png',
  ];
}

class DiceState extends ChangeNotifier {
  int currentIndex = 0;
  int secondIndex = 0;

  void changeImage() {
    currentIndex = Random().nextInt(6);
    notifyListeners();
  }

  void changeSecondImage() {
    do {
      secondIndex = Random().nextInt(6);
    } while (secondIndex == currentIndex);
    notifyListeners();
  }
}

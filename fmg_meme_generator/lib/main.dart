
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Meme Generator Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class Meme{
  final String title;
  final String image; //Location of image

  //Custom class for memes

  Meme({
    required this.title,
    required this.image
  });
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  final List<Meme> memes = [
    Meme(title: 'Perry the niffler', image: 'res/images/perry_the_niffler.png'),
    Meme(title: 'You are known for...', image: 'res/images/you_are_known_for.jpeg'),
    Meme(title: 'Did you finish your task?', image: 'res/images/did_you_finish.jpg')
  ];


    void _generateMeme() {
    setState(() {
      final rand = Random();

      //Generate random new index:
      int newIndex = _index;
      while(newIndex == _index){
        newIndex = rand.nextInt(memes.length);
      }
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  memes[_index].title,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(memes[_index].image),
            ),
            //
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SizedBox(
                    width: 160.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: _generateMeme,
                      child: const Text(
                        'Generate Meme')
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

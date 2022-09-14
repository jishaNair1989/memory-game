import 'package:flutter/material.dart';
import 'package:memory_game/utils/game_logic.dart';
import 'package:memory_game/widgets/scoreboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Game _game = Game();
  int tries = 0;
  int score = 0;
  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xffe55870),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Memory Game",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [scoreBoard('Tries', '$tries'), scoreBoard('Score', '$score')],
          ),
          SizedBox(
            height: screenWidth,
            width: screenWidth,
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print(_game.cardList[index]);
                        setState(() {
                          tries++;
                          _game.gameImg![index] = _game.cardList[index];
                          _game.matchCheck.add({index: _game.cardList[index]});
                        });
                        if (_game.matchCheck.length == 2) {
                          if (_game.matchCheck[0].values.first ==
                              _game.matchCheck[1].values.first) {
                            print("true");
                            score += 100;
                            _game.matchCheck.clear();
                          } else {
                            print("false");
                            Future.delayed(Duration(milliseconds: 500), () {
                              print(_game.gameImg);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardPath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardPath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB46A),
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: AssetImage(_game.gameImg![index]),
                              fit: BoxFit.cover),
                        ),
                      ));
                }),
          )
        ],
      ),
    );
  }
}

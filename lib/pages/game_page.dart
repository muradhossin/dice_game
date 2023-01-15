import 'package:dice_game/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);
  static const String routeName = "/gamepage";

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late GameProvider gameProvider;

  @override
  void didChangeDependencies() {
    gameProvider = Provider.of<GameProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),

      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          buildPointCount(),
          const SizedBox(height: 50,),
          buildGameBody(),
        ],
      ),
    );
  }

  Padding buildPointCount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                children: [
                  Text('  Win: ${gameProvider.win}', style: Theme.of(context).textTheme.headline6,),
                  Text('Lose: ${gameProvider.lose}', style: Theme.of(context).textTheme.headline6,),
                ],
              )
            ],
          ),
    );
  }

  Column buildGameBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          gameProvider.status,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 50,
        ),
        if (gameProvider.hasGameStarted)
          Text(
            'The sum of dice are: ${gameProvider.sum}',
            style: Theme.of(context).textTheme.headline6,
          ),
        const SizedBox(
          height: 10,
        ),
        if (gameProvider.point > 0)
          Text(
            'Your point is: ${gameProvider.point}',
            style: Theme.of(context).textTheme.headline6,
          ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              gameProvider.diceList[gameProvider.index1],
              width: 150,
              height: 150,
            ),
            Image.asset(
              gameProvider.diceList[gameProvider.index2],
              width: 150,
              height: 150,
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        gameProvider.hasGameStopped? ElevatedButton(
          onPressed: () {
            setState(() {
              gameProvider.reset();

            });
          },
          child: const Text(
            'Restart Game',
            style: TextStyle(fontSize: 20),
          ),
        ): ElevatedButton(
          onPressed: () {
            setState(() {
              gameProvider.rollTheDices();
              gameProvider.checkResult();
            });
          },
          child: const Text(
                  'Roll the Dices',
                  style: TextStyle(fontSize: 20),
                ),
        ),
      ],
    );
  }
}

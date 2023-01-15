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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
            const SizedBox(height: 50,),
            ElevatedButton(
              onPressed: (){
                setState(() {
                  gameProvider.rollTheDices();
                });

              },
              child: const Text('Roll the Dices', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:dice_game/pages/game_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dice Game'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rules',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "You roll two dice. "
                  "Each die has six faces, which contain one, "
                  "two, three, four, five and six spots, "
                  "respectively. After the dice have come "
                  "to rest, the sum of the spots onthe two "
                  "upward faces is calculated.",
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "-If the sum is 7 or 11 on the first throw, you win. "),
                const Text(
                    "-If the sum is 2, 3 or 12 on the first throw, you lose"),
                const Text(
                    "-If the sum is 4, 5, 6, 8, 9 or 10 on the first throw,"
                    "that sum becomes your “point.”"),
                const Text(
                    "-To win,you must continue rolling the dice until you "
                    "“make your point”"),
                const Text(
                    "-You lose by rolling a 7 before making your point."),
              ],
            ),
          ),
          Image.asset(
            "images/fire_dice.png",
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, GamePage.routeName);
            },
            child: Text(
              "PLAY NOW",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    );
  }
}

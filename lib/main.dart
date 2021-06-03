import 'dart:ui';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XO Game',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int player = 1;
  int winner = 0;
  List<String> symbol = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  void onTap(index) {
    setState(() {
      if (player == 1) {
        symbol[index] = 'X';

        player = 2;
      } else {
        symbol[index] = 'O';
        player = 1;
      }
      if ((symbol[0] == symbol[1] &&
              symbol[0] == symbol[2] &&
              symbol[0] == 'X') ||
          (symbol[3] == symbol[4] &&
              symbol[3] == symbol[5] &&
              symbol[3] == 'X') ||
          (symbol[6] == symbol[7] &&
              symbol[6] == symbol[8] &&
              symbol[6] == 'X') ||
          (symbol[0] == symbol[3] &&
              symbol[0] == symbol[6] &&
              symbol[0] == 'X') ||
          (symbol[1] == symbol[4] &&
              symbol[1] == symbol[7] &&
              symbol[1] == 'X') ||
          (symbol[2] == symbol[5] &&
              symbol[2] == symbol[8] &&
              symbol[2] == 'X') ||
          (symbol[0] == symbol[4] &&
              symbol[0] == symbol[8] &&
              symbol[0] == 'X') ||
          (symbol[2] == symbol[4] &&
              symbol[2] == symbol[6] &&
              symbol[2] == 'X')) {
        winner = 1;
      } else if ((symbol[0] == symbol[1] &&
              symbol[0] == symbol[2] &&
              symbol[0] == 'O') ||
          (symbol[3] == symbol[4] &&
              symbol[3] == symbol[5] &&
              symbol[3] == 'O') ||
          (symbol[6] == symbol[7] &&
              symbol[6] == symbol[8] &&
              symbol[6] == 'O') ||
          (symbol[0] == symbol[3] &&
              symbol[0] == symbol[6] &&
              symbol[0] == 'O') ||
          (symbol[1] == symbol[4] &&
              symbol[1] == symbol[7] &&
              symbol[1] == 'O') ||
          (symbol[2] == symbol[5] &&
              symbol[2] == symbol[8] &&
              symbol[2] == 'O') ||
          (symbol[0] == symbol[4] &&
              symbol[0] == symbol[8] &&
              symbol[0] == 'O') ||
          (symbol[2] == symbol[4] &&
              symbol[2] == symbol[6] &&
              symbol[2] == 'O')) {
        winner = 2;
      } else if (!symbol.contains('')) {
        winner = 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            winner != 0
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Container(
                            height: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4, color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              winner == 3
                                  ? 'Draw'
                                  : 'the player $winner is the winner',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                player = 1;
                                winner = 0;
                                symbol = [
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                  '',
                                ];
                              });
                            },
                            child: Text(
                              'Reset',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                  )
                : SizedBox(),
            if (winner == 0)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'player $player',
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w900),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Box(
                          symbol: symbol[0],
                          onTap: () => onTap(0),
                        ),
                        Box(
                          symbol: symbol[1],
                          onTap: () => onTap(1),
                        ),
                        Box(
                          symbol: symbol[2],
                          onTap: () => onTap(2),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Box(
                          symbol: symbol[3],
                          onTap: () => onTap(3),
                        ),
                        Box(
                          symbol: symbol[4],
                          onTap: () => onTap(4),
                        ),
                        Box(
                          symbol: symbol[5],
                          onTap: () => onTap(5),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Box(
                          symbol: symbol[6],
                          onTap: () => onTap(6),
                        ),
                        Box(
                          symbol: symbol[7],
                          onTap: () => onTap(7),
                        ),
                        Box(
                          symbol: symbol[8],
                          onTap: () => onTap(8),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Box extends StatelessWidget {
  final int index;
  final Function onTap;
  final String symbol;
  Box({this.index, this.symbol, this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: kIsWeb && MediaQuery.of(context).size.height < 600
          ? SizedBox()
          : Container(
              height: kIsWeb
                  ? MediaQuery.of(context).size.height / 5
                  : MediaQuery.of(context).size.width / 3 - 16,
              width: kIsWeb
                  ? MediaQuery.of(context).size.width / 5
                  : MediaQuery.of(context).size.width / 3 - 16,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  )),
              child: Center(
                  child: Text(symbol,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(color: Colors.white))),
            ),
    );
  }
}

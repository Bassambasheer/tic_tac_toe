import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/core/widgets/custom_dialog.dart';
import 'package:tic_tac_toe/core/widgets/game_button.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class MultiPlayerController extends GetxController {
  List<GameButton> buttonList = [];
  var player1;
  var player2;
  var activePlayer;

  @override
  void onInit() {
    super.onInit();
    buttonList = doInit();
  }

  List<GameButton> doInit() {
    player1 = List.generate(buttonList.length, (index) => player1);
    player2 = List.generate(buttonList.length, (index) => player2);
    activePlayer = 1;
    var gameButtons = <GameButton>[
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  playGame(GameButton gb, BuildContext ctx) {
    if (activePlayer == 1) {
      gb.text = 'X';
      gb.bg = redColorDark;
      activePlayer = 2;
      player1.add(gb.id);
    } else {
      gb.text = '0';
      gb.bg = greenColor;
      activePlayer = 1;
      player2.add(gb.id);
    }
    gb.enabled = false;
    int winner = checkWinner(ctx);
    if (winner == -1) {
      if (buttonList.every((p) => p.text != "")) {
        showDialog(
            context: ctx,
            builder: (_) => CustomDialog(
                content: "This game is a Draw",
                callback: resetGame,
                actionText: "Reset"));
      }
    }
    update();
  }

  checkWinner(BuildContext context) {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    // row 2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    // row 3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    // col 1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    // col 2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    // col 3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    //diagonal
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                content: "Player 1 Won",
                callback: resetGame,
                actionText: "Reset"));
      } else {
        showDialog(
            context: context,
            builder: (_) => CustomDialog(
                content: "Player 2 Won",
                callback: resetGame,
                actionText: "Reset"));
      }
    }
    update();
    return winner;
  }

  resetGame() {
    buttonList = doInit();
    Get.back();
    update();
  }
}

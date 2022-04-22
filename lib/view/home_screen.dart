import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/core/widgets/home_card.dart';
import 'package:tic_tac_toe/core/widgets/text_widget.dart';
import 'package:tic_tac_toe/theme/theme.dart';
import 'package:tic_tac_toe/view/multiplayer_page.dart';
import 'package:tic_tac_toe/view/play_zone_screen.dart';

import '../core/widgets/container_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          child: ContainerBar(
              size: size,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Privacy Policy",
                      size: 18,
                      color: white,
                      type: GoogleFonts.acme().fontFamily,
                      weight: FontWeight.bold,
                    ),
                    TextWidget(
                      text: "1.0.0",
                      size: 18,
                      color: white,
                      type: GoogleFonts.acme().fontFamily,
                      weight: FontWeight.bold,
                    ),
                    TextWidget(
                        text: "Rate App",
                        size: 18,
                        color: white,
                        type: GoogleFonts.acme().fontFamily,
                        weight: FontWeight.bold)
                  ],
                ),
              ))),
      body: Column(
        children: [
          ContainerBar(
            size: size,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.share,
                    color: white,
                    size: 35,
                  ),
                  Icon(
                    Icons.settings,
                    color: white,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
          TextWidget(
            text: "Tic Tac Toe",
            size: 60,
            color: const Color.fromARGB(255, 0, 0, 41),
            weight: FontWeight.bold,
            type: GoogleFonts.bakbakOne().fontFamily,
          ),
          SizedBox(
            height: size.width / 3,
          ),
          Column(
            children: [
              HomeCard(
                  size: size,
                  text: "Single Player",
                  ontap: () {
                    Get.to(const PlayZone());
                  }),
              HomeCard(
                  size: size,
                  text: "MultiPlayer",
                  ontap: () {
                    Get.to(const MultiPlayerScreen());
                  }),
              HomeCard(size: size, text: "Online", ontap: () {}),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/core/controller/play_zone_controller.dart';
import 'package:tic_tac_toe/core/widgets/text_widget.dart';
import 'package:tic_tac_toe/theme/theme.dart';

class PlayZone extends StatelessWidget {
  const PlayZone({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final gameController = Get.put(PLayZoneController());
    return GetBuilder<PLayZoneController>(builder: (ctrl) {
      return Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TextWidget(text: "Name", size: 40, color: redColorDark),
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Are you sure to reset"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          ctrl.resetGame();
                                        },
                                        child: const Text("Confirm"))
                                  ],
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.refresh_outlined,
                          size: 50,
                          color: white,
                        )),
                  ],
                ),
              ),
              SizedBox(height: size.height / 7),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6),
                        itemCount: ctrl.buttonList.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 60,
                            height: 60,
                            child: MaterialButton(
                              color: ctrl.buttonList[index].bg,
                              disabledColor: ctrl.buttonList[index].bg,
                              onPressed: ctrl.buttonList[index].enabled
                                  ? () => ctrl.playGame(
                                      ctrl.buttonList[index], context)
                                  : null,
                              child: TextWidget(
                                  text: ctrl.buttonList[index].text,
                                  size: 30,
                                  color: white),
                            ),
                          );
                        })),
              ),
            ],
          ),
        ),
      );
    });
  }
}

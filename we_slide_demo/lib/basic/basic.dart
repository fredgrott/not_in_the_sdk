import 'package:flutter/material.dart';
import 'package:we_slide/we_slide.dart';

class Basic extends StatefulWidget {
  const Basic({Key? key}) : super(key: key);

  @override
  State<Basic> createState() => _BasicState();
}

class _BasicState extends State<Basic> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    const double panelMinSize = 130.0;
    final double panelMaxSize = MediaQuery.of(context).size.height;
    final controller = WeSlideController();
    final footerController = WeSlideController(initial: true);

    return Scaffold(
      backgroundColor: Colors.black,
      body: WeSlide(
        parallax: true,
        hideAppBar: true,
        hideFooter: true,
        panelMinSize: panelMinSize,
        panelMaxSize: panelMaxSize,
        backgroundColor: Colors.tealAccent,
        panelBorderRadiusBegin: 20.0,
        panelBorderRadiusEnd: 20.0,
        parallaxOffset: 0.3,
        appBarHeight: 80.0,
        footerHeight: 60.0,
        controller: controller,
        footerController: footerController,
        appBar: AppBar(
          title: const Text("We Slide"),
          leading: const BackButton(),
          backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.tealAccent,
          child: TextButton(
            child: const Text(
              "This is the body 💪",
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              if (footerController.value) {
                footerController.hide();
              } else {
                footerController.show();
              }
            },
          ),
        ),
        panel: Container(
          color: colorScheme.primary,
          child: const Center(child: Text("This is the panel 😊")),
        ),
        panelHeader: GestureDetector(
          onTap: () {
            controller.show();
          },
          child: Container(
            height: 90.0,
            color: colorScheme.secondary,
            child: const Center(child: Text("Slide to Up ☝️")),
          ),
        ),
        footer: Container(
          height: 60.0,
          color: Colors.orange,
          child: const Center(child: Text("This is the footer ")),
        ),
      ),
    );
  }
}

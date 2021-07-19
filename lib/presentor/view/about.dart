import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Center(
              child: Container(

                  height: 240,
                  child: Image.asset(
                    'assets/graphics/mascot_android-flutter.png',
                    fit: BoxFit.fill,
                  )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "The intention behind building this app was to learn flutter as an android developer. Many discoveries were made about how the flutter framework runs as opposed to android. And what it's limitations are over using native platform.")
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

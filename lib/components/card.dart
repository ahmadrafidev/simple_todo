import 'package:flutter/material.dart';
import 'package:simple_todo/components/profile.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: new Stack(
          children: <Widget>[
            Card(
              child: Container(
                height: 100.0,
              ),
            ),
            FractionalTranslation(
              translation: Offset(0.0, -0.4),
              child: Align(
                child: CustomAvatar(
                ),
                alignment: FractionalOffset(0.5, 0.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

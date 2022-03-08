import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: ClipPolygon(
        sides: 6,
        borderRadius: 10,
        rotate: 90,
        boxShadows: [
          PolygonBoxShadow(color: Colors.black, elevation: 7)
        ],
        child: Image.network(
            'https://drive.google.com/file/d/1BtRCuZvN3t7yQJ01ieGbpLUwQDwiMzRM/view?usp=sharing',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

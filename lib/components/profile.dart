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
        borderRadius: 12,
        rotate: 90,
        boxShadows: [
          PolygonBoxShadow(color: Colors.black, elevation: 7),
          PolygonBoxShadow(color: Colors.deepPurpleAccent, elevation: 8)
        ],
        child: Image.asset(
            'assets/images/fotoweb.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

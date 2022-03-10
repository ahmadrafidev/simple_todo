import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_todo/components/profile.dart';


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, right: 7.0, left: 7.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
              ),
              color: Theme.of(context).primaryColor,
              child: Container(
                width: double.infinity,
                height: 450.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 15),
                      Text(
                       "Nama Lengkap",
                       style: GoogleFonts.mavenPro(
                         fontWeight: FontWeight.bold,
                         fontSize: 16,
                         color: Colors.white70,
                       ),
                     ),
                      Text(
                        "Ahmad Rafi Wirana",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Nama Panggilan",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "Rafi",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Hobi",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "Ngoding, Baca Buku",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Media Sosial",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        "IG: @ahhmadrafi",
                        style: GoogleFonts.mavenPro(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const FractionalTranslation(
              translation: Offset(0.0, -0.5),
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


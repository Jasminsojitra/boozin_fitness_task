import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/strings.dart';

class HomeCard extends StatelessWidget {
  HomeCard({required this.title, required this.goal, required this.imagePath, required this.heading, required this.value, Key? key})
      : super(key: key);
  final String imagePath;
  final String title;
  final String goal;
  final String heading;
  final double value;
  final TextStyle _titleStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: GoogleFonts.nunito().fontFamily,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        '$heading: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                        ),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: GoogleFonts.nunito().fontFamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: LinearProgressIndicator(
                      value: value / 100,
                      minHeight: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '0',
                        style: _titleStyle,
                      ),
                      Text(
                        '${AppText.goal}: $goal',
                        style: _titleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 21),
            SizedBox(
              height: 52,
              width: 52,
              child: Image.asset(imagePath),
            )
          ],
        ),
      ),
    );
  }
}

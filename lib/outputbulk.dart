import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero_bounce/widgets/info2.dart';

class buloutput extends StatelessWidget {
  const buloutput({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFF1FE'),
      appBar: AppBar(
        backgroundColor: HexColor('EFF1FE'),
        elevation: 2,
        title: Text(
          'Bulk Verification',
          style: GoogleFonts.lexend(
              color: HexColor(
                ('313131'),
              ),
              fontSize: 25,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                height: 690,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                      child: Text(
                        'File name',
                        style: GoogleFonts.lexend(
                            color: HexColor(
                              ('313131'),
                            ),
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      'UPLOAD DATE: 8/8/23  8.22 AM',
                      style: GoogleFonts.lexend(
                          color: HexColor(
                            ('777777'),
                          ),
                          fontSize: 17,
                          fontWeight: FontWeight.w400),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Info2(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class bulk extends StatefulWidget {
  const bulk({super.key});

  @override
  State<bulk> createState() => _bulkState();
}

class _bulkState extends State<bulk> {
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  'File name',
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                    hintText: 'file name',
                    suffixIcon: Icon(Icons.edit_outlined),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: HexColor('844DA6'),
                    side: BorderSide(width: 2, color: HexColor('844DA6')),
                  ),
                  child: Text(
                    'Validate',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('FFFFFF'),
                        ),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
      },
    );
  }

  late File file;

  Future<void> picFile() async {
    PlatformFile? file;
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv', 'xlsx']);
    if (result != null) {
      file = result.files.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFF1FE'),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 290,
            decoration: BoxDecoration(
                color: HexColor('FFFFFF'),
                borderRadius: BorderRadius.circular(45),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: HexColor('D4D4D4'),
                      spreadRadius: 0,
                      offset: Offset(1, 1)),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12, 50, 50, 10),
                      child: Text(
                        'Bulk Verification',
                        style: GoogleFonts.lexend(
                            color: HexColor(
                              ('000000'),
                            ),
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Upload a CSV,Excel or TXT file and evaluate your list',
                      style: GoogleFonts.lexend(
                          color: HexColor(
                            ('000000'),
                          ),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 55, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 65,
                        width: 220,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor('43B8B5'),
                              side: BorderSide(
                                  width: 2, color: HexColor('298280')),
                            ),
                            onPressed: picFile,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.file_upload_outlined,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                                Text(
                                  'Upload your list',
                                  style: GoogleFonts.lexend(
                                      color: HexColor(
                                        ('FFFFFF'),
                                      ),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 30, 265, 10),
                child: Text(
                  'STEP 1',
                  style: GoogleFonts.lexend(
                      color: HexColor(
                        ('5F2781'),
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 320,
                decoration: BoxDecoration(
                  color: HexColor('FFFFFF'),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 70,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.sticky_note_2_rounded,
                        color: HexColor('5F2781'),
                        size: 28,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('DBBEFF'),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Text(
                    'Upload your Existing list',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('4C4C4C'),
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 265, 10),
                child: Text(
                  'STEP 2',
                  style: GoogleFonts.lexend(
                      color: HexColor(
                        ('5F2781'),
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 320,
                decoration: BoxDecoration(
                  color: HexColor('FFFFFF'),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 70,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.check_circle,
                        color: HexColor('5F2781'),
                        size: 28,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('DBBEFF'),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Text(
                    'Hit Validate',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('4C4C4C'),
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(40, 20, 265, 10),
                child: Text(
                  'STEP 3',
                  style: GoogleFonts.lexend(
                      color: HexColor(
                        ('5F2781'),
                      ),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 320,
                decoration: BoxDecoration(
                  color: HexColor('FFFFFF'),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(
                    height: 70,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.file_download_outlined,
                        color: HexColor('5F2781'),
                        size: 28,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('DBBEFF'),
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Text(
                    'Download your clean list',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('4C4C4C'),
                        ),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  )
                ]),
              )
            ],
          )
        ]),
      ),
    );
  }
}

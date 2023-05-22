import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class History extends StatelessWidget {
  History({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              automaticallyImplyLeading: false,
              backgroundColor: HexColor('FFFFFF'),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'History',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('1E1E1E'),
                        ),
                        fontSize: 25,
                        height: 1,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Consists both single and bulk mail\'s history',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('5F5F5F'),
                        ),
                        fontSize: 13,
                        height: 2,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              bottom: TabBar(
                labelColor: HexColor('FFC728'),
                unselectedLabelColor: HexColor('5F5F5F'),
                indicatorColor: HexColor('FFC728'),
                tabs: [
                  Tab(
                    child: Text(
                      'Single',
                      style: GoogleFonts.lexend(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Bulk',
                      style: GoogleFonts.lexend(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 347,
                        child: SizedBox(
                          width: 400,
                          height: 150,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 120,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 5, 50),
                                          child: Text(
                                            'pranav@gmail.com',
                                            style: GoogleFonts.lexend(
                                                color: HexColor(
                                                  ('2D2D2D'),
                                                ),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: HexColor('E6FCE5'),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'Valid',
                                                style: GoogleFonts.lexend(
                                                    color: HexColor(
                                                      ('078605'),
                                                    ),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 347,
                        child: SizedBox(
                          width: 347,
                          height: 150,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              height: 120,
                              margin: EdgeInsets.all(10),
                              child: ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 30, 5, 50),
                                          child: Text(
                                            'pranav@gmail.com',
                                            style: GoogleFonts.lexend(
                                                color: HexColor(
                                                  ('2D2D2D'),
                                                ),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 35,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: HexColor('E6FCE5'),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 3,
                                              ),
                                              Text(
                                                'Valid',
                                                style: GoogleFonts.lexend(
                                                    color: HexColor(
                                                      ('078605'),
                                                    ),
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

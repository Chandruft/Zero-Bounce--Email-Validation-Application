import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:zero_bounce/widgets/info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  late String output;
  String? syntax;
  String? mx;
  String? temp;
  String? smtp;
  String? type;
  Map? mapResponse;
  Future apicall(String input) async {
    http.Response response;
    response = await http.get(
        Uri.parse("https://deepak2614.pythonanywhere.com/api?Query=$input"));
    if (response.statusCode == 200) {
      setState(() {
        output = response.body;
        mapResponse = json.decode(response.body);
        setState(() {
          syntax = mapResponse!['syntaxValidation'].toString();
          mx = mapResponse!['MXRecord'].toString();
          temp = mapResponse!['is Temporary'].toString();
          smtp = mapResponse!['smtpConnection'].toString();
        });
        if (syntax == 'Valid' &&
            mx == 'Valid' &&
            smtp == 'Valid' &&
            temp == 'Valid') {
          type = "Valid";
        } else if (syntax == 'Valid' && mx == 'Valid' && temp == 'Invalid') {
          type = "Risky";
        } else if (syntax == 'Valid' && mx == 'Valid' && smtp == 'Invalid') {
          type = "Unknown";
        } else if (syntax == 'Valid' && mx == 'Invalid') {
          type = "Invalid";
        } else if (syntax == 'Invalid') {
          type = "Invalid";
        } else {
          type = "Invalid";
        }
        print(output);
        print(syntax);
        print(mx);
        print(temp);
        print(smtp);
      });
    }
  }

  @override
  void _fetchData(BuildContext context, [bool mounted = true]) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Loading...',
                    style: GoogleFonts.lexend(
                        color: HexColor(
                          ('595959'),
                        ),
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          );
        });

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('EFF1FE'),
      appBar: AppBar(
        elevation: 0.7,
        bottomOpacity: 50,
        backgroundColor: HexColor('EFF1FE'),
        leading: Image.asset(
          'assets/images/zb.png',
        ),
        centerTitle: true,
        title: Text(
          'Zero Bounce',
          style: GoogleFonts.lexend(
              color: HexColor(
                ('2D2D2D'),
              ),
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: CarouselSlider(
                      items: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40)),
                          child: Image.asset(
                            'assets/images/fun.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            'assets/images/comp.png',
                            height: 90,
                            width: 90,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            'assets/images/comp2.png',
                            height: 90,
                            width: 90,
                          ),
                        )
                      ],
                      options: CarouselOptions(
                        height: 180,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 200),
                        viewportFraction: 0.9,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                    child: Container(
                      height: 280,
                      width: 330,
                      decoration: BoxDecoration(
                          color: Color(0xFFffffff),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: HexColor('D4D4D4'),
                                spreadRadius: 0,
                                offset: Offset(1, 1)),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              ' Verification',
                              style: TextStyle(
                                  color: HexColor(
                                    ('595959'),
                                  ),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(22, 30, 22, 30),
                            child: Container(
                              height: 60,
                              width: 370,
                              decoration: BoxDecoration(
                                color: HexColor('FFFFFF'),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor('DCE1FE'),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      1.0,
                                      3.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: myController,
                                    decoration: InputDecoration(
                                        hintText: 'Enter email address',
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.mail_outline),
                                        iconColor: HexColor('818181')),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                apicall(myController.text);
                              });
                              _fetchData(context);
                            },
                            child: Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                color: HexColor('FFF53D'),
                                borderRadius: BorderRadius.circular(17),
                                boxShadow: [
                                  BoxShadow(
                                    color: HexColor('E5E5E5'),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(
                                      1.0,
                                      4.0,
                                    ),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Verify',
                                    style: GoogleFonts.lexend(
                                        color: HexColor(
                                          ('000000'),
                                        ),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: HexColor('EFF1FE'),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: info(
                      type: type.toString(),
                      email: myController.text.toString(),
                      syntax: syntax.toString(),
                      mx: mx.toString(),
                      smtp: smtp.toString(),
                      temp: temp.toString(),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

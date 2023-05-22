import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Container getColorContainer(String type, String email, String syntax,
    String MXRecord, String SMTP, String TempDomain) {
  print(type);

  String prompt = type == 'Valid'
      ? 'The email can be used safely'
      : type == 'Unknown'
          ? 'This email is unknown to predict'
          : type == 'Risky'
              ? 'This email seems to be Risky'
              : type == 'Invalid'
                  ? 'This email is invalid and not safe to use'
                  : '';
  return Container(
    width: 410,
    child: Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 230,
            width: 355,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: type == 'Valid'
                  ? HexColor('E6FCE5')
                  : type == 'Unknown'
                      ? HexColor('FFF5D7')
                      : type == 'Risky'
                          ? HexColor('FFE2D6')
                          : type == 'Invalid'
                              ? HexColor('FFE1E1')
                              : Colors.transparent,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: type == 'Valid'
                            ? Image.asset('assets/images/valid.png')
                            : type == 'Unknown'
                                ? Image.asset('assets/images/unknown.png')
                                : type == 'Risky'
                                    ? Image.asset('assets/images/risky.png')
                                    : type == 'Invalid'
                                        ? Image.asset(
                                            'assets/images/invalid.png')
                                        : const Icon(
                                            Icons.downloading_outlined),
                      ),
                    ),
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(42.5),
                      color: HexColor('F7F9FA'),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: type == 'Valid'
                          ? HexColor('24A522')
                          : type == 'Unknown'
                              ? HexColor('F7BB12')
                              : type == 'Risky'
                                  ? HexColor('F65611')
                                  : type == 'Invalid'
                                      ? HexColor('D91F2E')
                                      : Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    email,
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: HexColor('474747')),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    prompt,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: HexColor('717880')),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 355,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: HexColor('F5F5FF'),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20,
                      color: HexColor('D4D4D4'),
                      spreadRadius: 0.02,
                      offset: const Offset(2, 2)),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Testcardfun('Syntax', syntax),
                  Testcardfun('MX Record', MXRecord),
                  Testcardfun('SMTP Connection', SMTP),
                  Testcardfun('Temporary Email', TempDomain),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Container Testcardfun(String Fun, String val) {
  String prompt = Fun == 'Syntax' && val == 'Valid'
      ? 'This email address has the correct format and is not giberish'
      : Fun == 'Syntax' && val == 'Invalid'
          ? 'This email address doesn\'t have correct format and is in giberish'
          : Fun == 'MX Record' && val == 'Valid'
              ? 'This email address have a valid MX Record'
              : Fun == 'MX Record' && val == 'Invalid'
                  ? 'This email  address doesn\'t have a valid MX Record'
                  : Fun == 'SMTP Connection' && val == 'Valid'
                      ? 'This email address has a valid SMTP Connection'
                      : Fun == 'SMTP Connection' && val == 'Invalid'
                          ? 'This email address doesn\'t have a valid SMTP Connection'
                          : Fun == 'Temporary Email' && val == 'Valid'
                              ? 'This email address is not a Temporary email or domain'
                              : Fun == 'Temporary Email' && val == 'Invalid'
                                  ? 'This email address is a Temporary email or domain'
                                  : 'Sorry! An unknown error occured try again later'; //'Sorry! An unknown error occured try again later'
  return Container(
    width: 355,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: HexColor('F5F5FF'),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              Fun,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.3,
                  color: HexColor('4C4C4C')),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              alignment: Alignment.center,
              height: 24,
              width: 57,
              child: Text(
                val,
                style: TextStyle(
                    color: val == 'Valid'
                        ? HexColor('078605')
                        : val == 'Invalid'
                            ? HexColor('D91F2E')
                            : Colors.transparent,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                  color: val == 'Valid'
                      ? HexColor('E6FCE5')
                      : val == 'Invalid'
                          ? HexColor('FFE1E1')
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(5)),
            )
          ],
        ),
        const SizedBox(height: 15),
        Text(
          prompt,
          style: TextStyle(
              color: HexColor('717880'),
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ],
    ),
  );
}

class info extends StatefulWidget {
  const info(
      {super.key,
      required this.email,
      required this.syntax,
      required this.mx,
      required this.smtp,
      required this.temp,
      required this.type});
  final String email;
  final String syntax;
  final String mx;
  final String smtp;
  final String temp;
  final String type;

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  // void setState(VoidCallback fn) {
  //   if(widget.syntax=='Valid' && widget.mx=='Valid' && widget.smtp=='Valid' && widget.temp=='Valid'){
  //     type = "Valid";
  //   }
  //   else if(widget.syntax=='Valid' && widget.mx=='Valid' && widget.smtp=='Valid' && widget.temp=='Invalid'){
  //     type = "Risky";
  //   }
  //   else if(widget.syntax=='Valid' && widget.mx=='Valid' && widget.smtp=='Invalid'){
  //     type = "Unknown";
  //   }
  //   else if(widget.syntax=='Valid' && widget.mx=='Invalid'){
  //     type = "Invalid";
  //   }
  //   else if(widget.syntax=='Invalid'){
  //     type = "Invalid";
  //   }
  //   else{
  //     type = "Invalid";
  //   }
  //
  //   super.setState(fn);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: getColorContainer(widget.type, widget.email, widget.syntax,
            widget.mx, widget.smtp, widget.temp),
        backgroundColor: HexColor('EFF1FE'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class Info2 extends StatelessWidget {
  const Info2({Key? key});

  @override
  Widget build(BuildContext context) {
    final int totalEmails = 400;
    final int validEmails = 200;
    final int invalidEmails = 100;
    final int unknownEmails = 50;
    final int riskyEmails = 50;

    final Map<String, double> dataMap = {
      'Valid': validEmails.toDouble(),
      'Invalid': invalidEmails.toDouble(),
      'Unknown': unknownEmails.toDouble(),
      'Risky': riskyEmails.toDouble(),
    };

    final String fileName = 'example.csv';
    final DateTime uploadDate = DateTime.now();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('F5F5FF'),
            elevation: 1.5,
            title: Text(
              'Bulk Verification',
              style: GoogleFonts.lexend(
                  color: HexColor(
                    ('000000'),
                  ),
                  fontSize: 25,
                  fontWeight: FontWeight.w600),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    EmailContainer(
                      fileName: fileName,
                      uploadDate: uploadDate,
                      numberOfEmails: totalEmails,
                    ),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          color: HexColor('FFFFFF'),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                color: HexColor('D4D4D4'),
                                spreadRadius: 0,
                                offset: Offset(1, 1)),
                          ]),
                      height: 250,
                      width: 300,
                      child: PieChart(
                        dataMap: dataMap,
                        centerText: "Complete validations",
                        ringStrokeWidth: 22,
                        legendOptions: LegendOptions(
                          showLegends: false,
                        ),
                        chartValuesOptions: ChartValuesOptions(
                          showChartValues: false,
                          showChartValueBackground: false,
                        ),
                        chartRadius: MediaQuery.of(context).size.width / 1.9,
                        chartType: ChartType.ring,
                        colorList: [
                          HexColor('24A522'),
                          HexColor('D91F2E'),
                          HexColor('F7BB12'),
                          HexColor('F65611'),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    EmailStatsContainer(
                      totalEmails: totalEmails,
                      validEmails: validEmails,
                      invalidEmails: invalidEmails,
                      unknownEmails: unknownEmails,
                      riskyEmails: riskyEmails,
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: HexColor('F5F5FF'),
        ),
      ),
    );
  }
}

class EmailContainer extends StatelessWidget {
  final int numberOfEmails;
  final String fileName;
  final DateTime uploadDate;

  EmailContainer({
    required this.numberOfEmails,
    required this.fileName,
    required this.uploadDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: HexColor('F5F5FF'),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$fileName',
            style: GoogleFonts.lexend(
                color: HexColor(
                  ('595959'),
                ),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            'Total Emails: $numberOfEmails',
            style: GoogleFonts.lexend(
                color: HexColor(
                  ('595959'),
                ),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 2),
          Text(
            'Upload Date: ${uploadDate.toString()}',
            style: GoogleFonts.lexend(
                color: HexColor(
                  ('595959'),
                ),
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class EmailStatsContainer extends StatelessWidget {
  final int totalEmails;
  final int validEmails;
  final int invalidEmails;
  final int unknownEmails;
  final int riskyEmails;

  EmailStatsContainer({
    required this.totalEmails,
    required this.validEmails,
    required this.invalidEmails,
    required this.unknownEmails,
    required this.riskyEmails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 324,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: HexColor('FFFFFF'),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      color: HexColor('D4D4D4'),
                      spreadRadius: 0,
                      offset: Offset(1, 1)),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: _buildCategoryContainer('Valid', validEmails),
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: HexColor('FFFFFF'),
                  ),
                ),
                Divider(),
                Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: HexColor('FFFFFF'),
                    ),
                    child: _buildCategoryContainer('Invalid', invalidEmails)),
                Divider(),
                Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: HexColor('FFFFFF'),
                    ),
                    child: _buildCategoryContainer('Unknown', unknownEmails)),
                Divider(),
                Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: HexColor('FFFFFF'),
                    ),
                    child: _buildCategoryContainer('Risky', riskyEmails)),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(String category, int count) {
    double percentage = (count / totalEmails) * 100;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                color: category == 'Valid'
                    ? Colors.green
                    : category == 'Invalid'
                        ? Colors.red
                        : category == 'Unknown'
                            ? Colors.yellow
                            : category == 'Risky'
                                ? Colors.orange
                                : HexColor('595959'),
              ),
            ),
          ],
        ),
        Text(
          category,
          style: GoogleFonts.lexend(
              color: HexColor(
                ('595959'),
              ),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 2),
        Text(
          '$count',
          style: GoogleFonts.lexend(
              color: HexColor(
                ('595959'),
              ),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(width: 2),
        Text(
          '${percentage.toStringAsFixed(2)}%',
          style: GoogleFonts.lexend(
              color: HexColor(
                ('595959'),
              ),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

import 'package:docwise/pages/home_page.dart';
import 'package:docwise/pages/marathi_page/home_page_marathi.dart';
import 'package:flutter/material.dart';
import 'package:docwise/pages/document.dart';
import 'package:docwise/pages/scheme/schemes_home.dart';

class HomePageHindi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 70,
              width: 70,
            ),
            const Text(
              "Doc",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 40.0,
              ),
            ),
            const Text(
              "Wise",
              style: TextStyle(
                color: Color.fromARGB(255, 85, 43, 211),
                fontWeight: FontWeight.w800,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                _showLanguagePopup(context); // Show language selection dialog
              },
              icon: ClipRRect(
                child: Image.asset(
                  'assets/images/translate_12836969.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
        backgroundColor:const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 245, 246, 252),
            border: Border.all(
              color:const Color.fromARGB(
                  255, 255, 255, 255), // Adjust border color if needed
              width: 1.0, // Adjust border width if needed
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.0),
                const Row(
                  children: [
                    SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "हे उपयोगकर्ता!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 13, 0, 95),
                            fontSize: 25.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox(width: 20.0)),
                  ],
                ),
                SizedBox(height: 20.0),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 127.0,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(190, 245, 249, 254),
                        border: Border.all(
                          color:const Color.fromARGB(255, 33, 0, 71),
                          width: 2,
                        ),
                        borderRadius:const BorderRadius.all(Radius.circular(12)),
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "स्वागत है!",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 25, 67),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "अपनी श्रेणी चुनें \n आगे बढ़ने के लिए",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 24, 34, 60),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(height: 5.0),
                              ],
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              'assets/images/5214651.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DocumentHome()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side:const BorderSide(
                            color: Color.fromARGB(255, 184, 184, 184),
                            width: 1.0,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 0, 15, 60),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 48.0, right: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/documents.jpg',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.0, left: 0.0, right: 0.0),
                                    child: Text(
                                      'दस्तावेज़',
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '(विभिन्न प्रकार के दस्तावेज शामिल हैं। जैसे आधार कार्ड, राशन कार्ड, नरेगा कार्ड आदि..)',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Color.fromARGB(255, 197, 197, 197),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SchemePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 184, 184, 184),
                            width: 1.0,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 10, 31, 54),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 48.0, right: 20.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/scholarship.jpg',
                                  width: 110,
                                  height: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.0, left: 5.0, right: 20.0),
                                    child: Text(
                                      'योजनाओं',
                                      style: TextStyle(
                                        fontSize: 32.0,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 247, 250, 255),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 8.0, right: 5.0, bottom: 5.0),
                                    child: Text(
                                      "(विभिन्न प्रकार की योजनाएं शामिल हैं। जैसे। सरकारी छात्रवृत्ति, एनजीओ छात्रवृत्ति आदि....)",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color:
                                            Color.fromARGB(255, 197, 197, 197),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 void _showLanguagePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption(context, 'English', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }),
            _buildLanguageOption(context, 'मराठी', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePageMarathi()),
              );
            }),
            _buildLanguageOption(context, 'हिंदी', () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePageHindi()),
              );
            }),
          ],
        ),
      );
    },
  );
}

Widget _buildLanguageOption(
      BuildContext context, String language, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(language),
    );
  }
}

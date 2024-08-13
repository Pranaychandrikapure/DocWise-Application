import 'package:docwise/pages/documents/required_document.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DocumentDetailsPage extends StatelessWidget {
  final String mainTitle;
  final Map<String, dynamic> fields;
  final String logo;

  const DocumentDetailsPage({
    Key? key,
    required this.mainTitle,
    required this.fields,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = fields['title'] ?? 'No title';
    final Map<String, Map<String, dynamic>> sections = {
      'Required Documents': fields['required_document'],
      'Steps To Follow': fields['steps_to_follow'],
      'Terms & Conditions': fields['terms&cond'],
      'Other': fields['other']
    };

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
        child: AppBar(
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 0, 3, 154), 
                  width: 2, 
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/images/${logo}',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                   const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 56, 0, 124),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: ListView(
                padding:const EdgeInsets.all(25),
                children: [
                  ...sections.entries.map((entry) {
                    final String sectionTitle = entry.key;
                    final Map<String, dynamic>? sectionData = entry.value;
                    return sectionData != null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ElevatedButton(
                                  onPressed: () {
                                     Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RequiredDocument(mainTitle: mainTitle,sectionTitle: sectionTitle , fields: fields)
                                        ),
                                      );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          12.0), 
                                      side:const BorderSide(
                                        color: Color.fromARGB(255, 0, 34, 86),
                                        width: 1,
                                      ),
                                    ),
                                    backgroundColor:
                                       const Color.fromARGB(255, 255, 255, 255),
                                    minimumSize: Size(
                                        325, 80), 
                                  ),
                                  child: Text(
                                    sectionTitle,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 56, 0, 124),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink();
                  }). toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

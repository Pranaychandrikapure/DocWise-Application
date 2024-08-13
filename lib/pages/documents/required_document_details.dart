import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequiredDocumentDetails extends StatelessWidget {
  final String title;
  final String barTitle;
  final Map<String, dynamic> fields;
  final String titleKey;

  const RequiredDocumentDetails({
    Key? key,
    required this.title,
    required this.barTitle,
    required this.fields,
    required this.titleKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> requiredDocuments =
        fields['required_document'] != null &&
                fields['required_document'] is Map<String, dynamic>
            ? Map<String, dynamic>.from(fields['required_document']!)
            : {};
    String des = requiredDocuments[titleKey]['description'];
    List<String> detailsOfRequiredDocument = [];
                des = des.replaceAll(r'\n', '\n');
                detailsOfRequiredDocument = des.split('\n');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          barTitle,
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 330,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 3, 154),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 65, 0, 216),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              for (String line in detailsOfRequiredDocument)
            ListTile(
              title: Text(
                line,
                style: const TextStyle(
                    color: Color.fromARGB(255, 19, 19, 19),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

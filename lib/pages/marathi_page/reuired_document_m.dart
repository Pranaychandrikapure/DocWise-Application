import 'package:docwise/pages/documents/required_document_details.dart';
import 'package:docwise/pages/marathi_page/required_document_marathi.dart';
import 'package:flutter/material.dart';

class RequiredDocumentMarathi extends StatelessWidget {
  final String mainTitle;
  final Map<String, dynamic> fields;
  final String sectionTitle;

  const RequiredDocumentMarathi({
    Key? key,
    required this.mainTitle,
    required this.fields,
    required this.sectionTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> stepsToFollow =
        fields['steps_to_follow'] != null &&
                fields['steps_to_follow'] is Map<String, dynamic>
            ? Map<String, dynamic>.from(fields['steps_to_follow']!)
            : {};
    final Map<String, dynamic> termsConditions = fields['terms&cond'] != null &&
            fields['terms&cond'] is Map<String, dynamic>
        ? Map<String, dynamic>.from(fields['terms&cond']!)
        : {};
    final Map<String, dynamic> other =
        fields['other'] != null && fields['other'] is Map<String, dynamic>
            ? Map<String, dynamic>.from(fields['other']!)
            : {};
    final Map<String, dynamic> requiredDocuments =
        fields['required_document'] != null &&
                fields['required_document'] is Map<String, dynamic>
            ? Map<String, dynamic>.from(fields['required_document']!)
            : {};
    late String des; // Declare as late
    // print(fields['steps_to_follow']['description']);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mainTitle,
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 28,
              fontWeight: FontWeight.w900),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
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
                    sectionTitle,
                    textAlign: TextAlign.center, // Align the text to the center
                    style: const TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 65, 0, 216),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          if (sectionTitle == 'आवश्यक कागदपत्रे')
            ...requiredDocuments.entries.map((entry) {
              print(entry.value.toString());
              print('h3');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: ElevatedButton(
                      onPressed: () {
                        print(entry.value['title']);
                        print(entry.key.toString());
                        print(fields);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => RequiredDocumentDetailsMarathi(
                        //           titleKey : entry.key,
                        //           title: entry.value['title'],
                        //           barTitle: mainTitle,
                        //           fields: fields,),
                        //     ));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 1,
                          ),
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        minimumSize: Size(325, 80),
                      ),
                      child: Text(
                        entry.value['title'] ?? 'No title',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 1, 47, 122)
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                ],
              );
            }).toList(),
          if (sectionTitle == 'इतर')
            ...other.entries.map((entry) {
              print('h2');
              List<String> lines2 = [];
              if (entry.key == 'description') {
                des = entry.value;
                des = des.replaceAll(r'\n', '\n');
                lines2 = des.split('\n');
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String line in lines2)
                    ListTile(
                      title: Text(
                        line,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 19, 19, 19),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          if (sectionTitle == 'यासाठी पावले')
            ...stepsToFollow.entries.map((entry) {
              print('h1');
              List<String> lines = [];
              if (entry.key == 'description') {
                des = fields['steps_to_follow']['description'];
                des = des.replaceAll(r'\n', '\n');
                lines = des.split('\n');
                print(lines);
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String line in lines)
                    ListTile(
                      title: Text(
                        line,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 19, 19, 19),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          if (sectionTitle == 'नियम आणि अटी')
            ...termsConditions.entries.map((entry) {
              print('h4');
              List<String> lines2 = [];
              if (entry.key == 'description') {
                des = entry.value;
                des = des.replaceAll(r'\n', '\n');
                lines2 = des.split('\n');
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String line in lines2)
                    ListTile(
                      title: Text(
                        line,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 19, 19, 19),
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  const SizedBox(height: 10),
                ],
              );
            }).toList(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

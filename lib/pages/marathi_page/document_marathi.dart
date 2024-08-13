import 'package:docwise/pages/document_details_page.dart';
import 'package:docwise/pages/marathi_page/document_marathi_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<DocumentSnapshot>> getDocuments() async {
  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('DocumentsM').get();
  return querySnapshot.docs;
}

class DocumentHomeMarathi extends StatefulWidget {
  const DocumentHomeMarathi({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DocumentHomeMarathiState createState() => _DocumentHomeMarathiState();
}

class _DocumentHomeMarathiState extends State<DocumentHomeMarathi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'दस्तऐवज',
          style: TextStyle(
              fontSize: 30,
              color: Colors.blue[900],
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ClipRRect(
        borderRadius:const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color:const Color.fromARGB(255, 252, 249, 254),
            border: Border.all(
              color: const Color.fromARGB(
                  255, 255, 255, 255), // Adjust border color if needed
              width: 1.0, // Adjust border width if needed
            ),
            borderRadius:const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: (snapshot.data!.length / 2).ceil(),
                        itemBuilder: (context, index) {
                          final firstButtonIndex = index * 2;
                          final secondButtonIndex = index * 2 + 1;
                          final firstDocumentData =
                              snapshot.data![firstButtonIndex].data()
                                      as Map<String, dynamic>? ??
                                  {};
                          final secondDocumentData =
                              secondButtonIndex < snapshot.data!.length
                                  ? snapshot.data![secondButtonIndex].data()
                                          as Map<String, dynamic>? ??
                                      {}
                                  : null;

                          return Padding(
                            padding:const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    if (firstDocumentData.isNotEmpty)
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DocumentDetailsPageMarathi(
                                                mainTitle: firstDocumentData[
                                                        'title'] ??
                                                    'No title',
                                                fields: firstDocumentData,
                                                logo: firstDocumentData['logo'],
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust border radius as needed
                                            side: const BorderSide(
                                              color: Color.fromARGB(73, 105, 105, 105), // Add border color
                                              width: 2, // Add border width
                                            ),
                                          ),
                                          backgroundColor: Colors
                                              .white, // Change background color
                                          minimumSize: const Size(160,
                                              160), // Adjust size of the button
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  12.0), // Set border radius for the image
                                              child: Image.asset(
                                                'assets/images/${firstDocumentData['logo']}', // Image path from assets
                                                width: 112,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                                height:
                                                    8), // Add spacing between image and text
                                            Text(
                                              firstDocumentData['title'] ??
                                                  'No title',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 56, 0, 124),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (secondDocumentData != null)
                                      const SizedBox(
                                          width:
                                              30), // Add spacing between buttons
                                    if (secondDocumentData != null)
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DocumentDetailsPageMarathi(
                                                mainTitle: secondDocumentData[
                                                        'title'] ??
                                                    'No title',
                                                fields: secondDocumentData,
                                                logo:
                                                    secondDocumentData['logo'],
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust border radius as needed
                                            side: const BorderSide(
                                              color: Color.fromARGB(73, 105, 105, 105), // Add border color
                                              width: 2, // Add border width
                                            ),
                                          ),
                                          backgroundColor:const  Color.fromARGB(255, 255, 255, 255), // Change background color
                                          minimumSize: const Size(160,
                                              160), // Adjust size of the button
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  12.0), // Set border radius for the image
                                              child: Image.asset(
                                                'assets/images/${secondDocumentData['logo']}', // Image path from assets
                                                width: 112,
                                                height: 100,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            const SizedBox(
                                                height:
                                                    8), // Add spacing between image and text
                                            Text(
                                              secondDocumentData['title'] ??
                                                  'No title',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 56, 0, 124),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const DocumentHomeMarathi(),
    );
  }
}

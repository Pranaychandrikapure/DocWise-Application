import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SchemePage(),
    );
  }
}

class SchemePage extends StatefulWidget {
  const SchemePage({Key? key}) : super(key: key);

  @override
  _SchemePageState createState() => _SchemePageState();
}

class _SchemePageState extends State<SchemePage> {
  late List<String> allTitles = [];
  late List<String> filteredTitles = [];
  String selectedState = 'All';
  int selectedMinAge = 0;
  String selectedOccupation = 'All';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchDocumentTitles();
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Schemes',
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 0, 11, 56),
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            _showFilterDialog(context);
          },
          icon: Icon(Icons.filter_alt),
        ),
      ],
    );
  }

  void searchTitles(String query) {
    setState(() {
      searchQuery = query;
      filteredTitles = allTitles
          .where((title) => title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> fetchDocumentTitles() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('Schemes').get();

    List<String> titles = [];
    querySnapshot.docs.forEach((doc) {
      if (_filterDocument(doc)) {
        titles.add(doc['title']);
      }
    });

    setState(() {
      allTitles = titles;
      filteredTitles = titles;
    });
  }

  bool _filterDocument(DocumentSnapshot doc) {
    Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
    if (data == null || !data.containsKey('category')) {
      return false; // Skip filtering if category field is missing
    }
    // Get the category map
    Map<String, dynamic> category = data['category'];

    // Check 'state' if it matches the selected state
    if (selectedState != 'All' && category.containsKey('state') && category['state'] != selectedState) {
      return false;
    }
    // Check 'age' if it's less than the selected minimum age
    if (selectedMinAge > 0 && category.containsKey('age') && category['age'] < selectedMinAge) {
      return false;
    }
    // Check 'occupation' if it matches the selected occupation
    if (selectedOccupation != 'All' && category.containsKey('occupation') && category['occupation'] != selectedOccupation) {
      return false;
    }
    return true; // Default: no filtering
  }

  void _showFilterDialog(BuildContext context) {
    String newSelectedState = selectedState;
    int newSelectedMinAge = selectedMinAge;
    String newSelectedOccupation = selectedOccupation;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Filter Schemes'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildFilterDropdown(
                      'State',
                      DropdownButton<String>(
                        value: newSelectedState,
                        onChanged: (value) {
                          setState(() {
                            newSelectedState = value!;
                          });
                        },
                        items: <String>[
                          'All',
                          'Maharashtra',
                          'Rajasthan',
                          'chennai',
                          'Bihar', // Add Bihar here
                          'Goa',
                          'Arunachal Pradesh', // Add Goa here
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildFilterDropdown(
                      'Age',
                      DropdownButton<int>(
                        value: newSelectedMinAge,
                        onChanged: (value) {
                          setState(() {
                            newSelectedMinAge = value!;
                          });
                        },
                        items: <int>[0, 18, 25, 30]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(
                              value.toString(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildFilterDropdown(
                      'Occupation',
                      DropdownButton<String>(
                        value: newSelectedOccupation,
                        onChanged: (value) {
                          setState(() {
                            newSelectedOccupation = value!;
                          });
                        },
                        items: <String>[
                          'All',
                          'college student',
                          'school student',
                          'graduate student'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      selectedState = newSelectedState;
                      selectedMinAge = newSelectedMinAge;
                      selectedOccupation = newSelectedOccupation;
                    });
                    Navigator.of(context).pop();
                    await fetchDocumentTitles(); // Call fetchDocumentTitles after applying filter criteria
                  },
                  child: const Text('Apply'),
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // Adjust the width and height
              contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterDropdown(String label, Widget dropdown) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromARGB(255, 1, 0, 59),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        dropdown,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchTitles,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final documentDetails =
                          await fetchDocumentDetails(filteredTitles[index]);
                          Navigator.push(
                            // ignore: use_build_context_synchronously
                            context,
                            MaterialPageRoute(
                              builder: (context) => SchemeDetailPage(
                                documentDetails: documentDetails,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 18.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 206, 206, 206),
                              width: 1,
                            ),
                          ),
                          backgroundColor: const Color.fromARGB(255, 249, 248, 252),
                          minimumSize: const Size(380, 100),
                        ),
                        child: Text(
                          filteredTitles[index],
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 0, 35, 150),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchDocumentDetails(String title) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Schemes')
      .where('title', isEqualTo: title)
      .limit(1)
      .get();

  if (querySnapshot.docs.isNotEmpty) {
    return querySnapshot.docs.first.data() as Map<String, dynamic>;
  } else {
    return {}; // Return empty map if document is not found
  }
}

class SchemeDetailPage extends StatelessWidget {
  final Map<String, dynamic> documentDetails;

  const SchemeDetailPage({required this.documentDetails});

  @override
  Widget build(BuildContext context) {
    List<String> eligibility = [];
    String des = documentDetails['information']['eligibility'] ?? 'N/A';
    des = des.replaceAll(r'\n', '\n');
    eligibility = des.split('\n');
    List<String> summary = [];
    des = documentDetails['summary'] ?? 'N/A';
    des = des.replaceAll(r'\n', '\n');
    summary = des.split('\n');
    List<String> stepsToApply = [];
    des = documentDetails['information']['step_to_apply'] ?? 'N/A';
    des = des.replaceAll(r'\n', '\n');
    stepsToApply = des.split('\n');
    List<String> termAndCondition = [];
    des = '${documentDetails['information']['term_and_condition'] ?? 'N/A'}';
    des = des.replaceAll(r'\n', '\n');
    termAndCondition = des.split('\n');

    return Scaffold(
      appBar: AppBar(
        title: Text(documentDetails['title'] ?? 'Scheme Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Application Date:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 94, 0, 0))),
                    SizedBox(height: 8),
                    Text('Deadline Date:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 94, 0, 0))),
                    SizedBox(height: 8),
                    Text('Benefit of Money:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 94, 0, 0))),
                    SizedBox(height: 8),
                    Text('Official Site:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 94, 0, 0))),
                    SizedBox(height: 8),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ${documentDetails['date']['application_date'] ?? 'N/A'}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        ' ${documentDetails['date']['deadline_date'] ?? 'N/A'}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                        ' ${documentDetails['information']['benefit_money'] ?? 'N/A'}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(
                        ' ${documentDetails['information']['official_site'] ?? 'N/A'}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
            const Text('Eligibility: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25)),
            for (String line in eligibility)
              ListTile(
                title: Text(
                  line,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            const SizedBox(height: 8),
            const Text('Important Info:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25)),
            const SizedBox(
              height: 8,
            ),
            Text(
              '${documentDetails['information']['important_info'] ?? 'N/A'}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text('Steps to Apply',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25)),
            for (String line in stepsToApply)
              ListTile(
                title: Text(
                  line,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            const SizedBox(height: 8),
            const Text('Term and Condition: ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25)),
            for (String line in termAndCondition)
              ListTile(
                title: Text(
                  line,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            const SizedBox(height: 8),
            const Text('Summary:',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25)),
            for (String line in summary)
              ListTile(
                title: Text(
                  line,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 19, 19, 19),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

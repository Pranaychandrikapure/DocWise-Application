import 'package:flutter/material.dart';

class SchemeDetailPage extends StatelessWidget {
  final Map<String, dynamic> documentDetails;

  const SchemeDetailPage({Key? key, required this.documentDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(documentDetails['title'] ?? 'Scheme Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application Date: ${documentDetails['application_date'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Deadline Date: ${documentDetails['deadline_date'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Information: ${documentDetails['information'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Important Info: ${documentDetails['important_info'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Official Site: ${documentDetails['official_site'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Steps to Apply: ${documentDetails['steps_to_apply'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Term and Condition: ${documentDetails['term_and_condition'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Summary: ${documentDetails['summary'] ?? 'N/A'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RequiredDocumentDetailsMarathi extends StatelessWidget {
  final String title;
  final String barTitle;
  final Map<String, dynamic> fields;
  final String titleKey;

  const RequiredDocumentDetailsMarathi({
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
    
    );
  }
}

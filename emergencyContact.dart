import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class EmergencyContactsPage extends StatefulWidget {
  const EmergencyContactsPage({super.key});

  @override
  _EmergencyContactsPageState createState() => _EmergencyContactsPageState();
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  final TextEditingController _primaryController = TextEditingController();
  final TextEditingController _secondaryController = TextEditingController();
  String? primaryContact;
  String? secondaryContact;

  void _saveContacts() {
    setState(() {
      primaryContact = _primaryController.text;
      secondaryContact = _secondaryController.text;
    });
  }

  void _callContact(String? contact) {
    if (contact != null && contact.isNotEmpty) {
      launchUrl(Uri.parse('tel:$contact'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Contacts')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _primaryController,
              decoration: const InputDecoration(labelText: 'Primary Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _secondaryController,
              decoration: const InputDecoration(labelText: 'Secondary Contact Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _saveContacts,
              child: const Text('Save Contacts'),
            ),
            const SizedBox(height: 20),
            if (primaryContact != null)
              ListTile(
                leading: const Icon(Icons.call),
                title: Text('Call Primary: $primaryContact'),
                onTap: () => _callContact(primaryContact),
              ),
            if (secondaryContact != null)
              ListTile(
                leading: const Icon(Icons.call),
                title: Text('Call Secondary: $secondaryContact'),
                onTap: () => _callContact(secondaryContact),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:dementia_app/options/dailyTask.dart';
import 'package:dementia_app/options/emergencyContact.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remind - Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.access_alarm),
            title: const Text('Daily Reminder'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DailyTasksPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: const Text('Add Photo/Album'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PhotoAlbumPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text('Emergency Contacts'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EmergencyContactsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.check_circle),
            title: const Text('Set Daily Tasks'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DailyTasksPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}



class PhotoAlbumPage extends StatelessWidget {
  const PhotoAlbumPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo/Album')),
      body: const Center(child: Text('Photo Album Page')),
    );
  }
}




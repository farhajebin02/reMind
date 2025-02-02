import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DailyReminderPage extends StatefulWidget {
  const DailyReminderPage({super.key});

  @override
  _DailyReminderPageState createState() => _DailyReminderPageState();
}

class _DailyReminderPageState extends State<DailyReminderPage> {
  final List<Map<String, dynamic>> _reminders = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  bool _enableAlarm = false;

  void _addReminder() {
    if (_titleController.text.isNotEmpty && _timeController.text.isNotEmpty) {
      setState(() {
        _reminders.add({
          'title': _titleController.text,
          'time': _timeController.text,
          'alarm': _enableAlarm,
        });
      });
      if (_enableAlarm) {
        _scheduleNotification(_titleController.text);
      }
      _titleController.clear();
      _timeController.clear();
      _enableAlarm = false;
    }
  }

  Future<void> _scheduleNotification(String title) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'reminder_channel',
      'Daily Reminders',
      importance: Importance.high,
      priority: Priority.high,
    );
    // const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
    // await FlutterLocalNotificationsPlugin.show(
    //   0,
    //   'Reminder',
    //   title,
    //   platformChannelSpecifics,
    // );
//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//   android: androidPlatformChannelSpecifics,
// );
// await FlutterLocalNotificationsPlugin.show( // Use the instance
//   0,
//   'Reminder',
//   title,
//   platformChannelSpecifics,
// );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Reminders')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Reminder Title'),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(labelText: 'Time to Remind (HH:MM)'),
              keyboardType: TextInputType.datetime,
            ),
            Row(
              children: [
                const Text('Enable Alarm'),
                Switch(
                  value: _enableAlarm,
                  onChanged: (value) {
                    setState(() {
                      _enableAlarm = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addReminder,
              child: const Text('Add Reminder'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _reminders.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_reminders[index]['title']),
                      subtitle: Text('Time: ${_reminders[index]['time']}\nAlarm: ${_reminders[index]['alarm'] ? 'Enabled' : 'Disabled'}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:intl/intl.dart';

import '../preset/nav.dart';

class Timezone extends StatelessWidget {
  const Timezone({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PresetAppBar(),
      drawer: PresetDrawer(),
      
      body: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDateTime;
  String? _convertedTime;
  String _selectedTimeZone = 'UTC';
  String _selectedTimeOption = 'Now';
  final List<String> _timeOptions = ['Now', 'Custom Time'];
  final double _offsetY = 40.0;
  final List<String> _timeZones = [
    'UTC',
    'America/New_York',
    'Europe/London',
    'Asia/Tokyo',
    'Australia/Sydney',
  ];
  final Map<String, String> _timeZoneLabels = {
    'UTC': 'UTC',
    'America/New_York': 'New York',
    'Europe/London': 'London',
    'Asia/Tokyo': 'Tokyo',
    'Australia/Sydney': 'Sydney',
  };

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _initializeTimeZone();
  }

  Future<void> _initializeTimeZone() async {
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
  }

  Future<void> _pickDateTime() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _convertTime() {
    tz.TZDateTime timeToConvert;

    if (_selectedTimeOption == 'Now') {
      timeToConvert = tz.TZDateTime.now(tz.getLocation(_selectedTimeZone));
    } else if (_selectedDateTime != null) {
      timeToConvert = tz.TZDateTime.from(_selectedDateTime!, tz.getLocation(_selectedTimeZone));
    } else {
      return;
    }

    setState(() {
      _convertedTime = DateFormat('yyyy/MM/dd HH:mm').format(timeToConvert);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Title 'Time Zone Converter'
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Time Zone Converter',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(97, 97, 97, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Spacing (for aesthetic lol)
          Padding(
            padding: EdgeInsets.only(top: _offsetY),
            child: Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[

                      // Time option selector
                      const Text('Select Time Option:'),
                      DropdownButton<String>(
                        value: _selectedTimeOption,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTimeOption = newValue!;
                          });
                        },
                        items: _timeOptions.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                      // Custom time picker
                      if (_selectedTimeOption == 'Custom Time') ...[
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _pickDateTime,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(36, 49, 223, 1),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          child: const Text('Pick Date & Time'),
                        ),
                        if (_selectedDateTime != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text(
                              'Selected Date & Time: ${DateFormat('yyyy/MM/dd HH:mm').format(_selectedDateTime!)}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromRGBO(248, 49, 50, 1),
                              ),
                            ),
                          ),
                      ],

                      // Time zone selector
                      const SizedBox(height: 20),
                      const Text('Select Time Zone:'),
                      DropdownButton<String>(
                        value: _selectedTimeZone,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTimeZone = newValue!;
                          });
                        },
                        items: _timeZones.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(_timeZoneLabels[value]!),
                          );
                        }).toList(),
                      ),

                      // Convert button
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: _convertTime,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(36, 49, 223, 1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Convert Time'),
                      ),

                      // Show converted time
                      const SizedBox(height: 40),
                      if (_convertedTime != null)
                        Text(
                          'Converted Time: $_convertedTime',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(1, 190, 98, 1),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

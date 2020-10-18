import 'package:flutter/material.dart';
import 'package:isp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'newyork.jpg'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'la.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'seoul.jpg'),
    WorldTime(url: 'Asia/Dubai', location: 'Dubai', flag: 'dubai.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'cairo.jpg'),

  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
  //navigate to home screen

    Navigator.pop(context, {
      'location': instance.location, 'flag': instance.flag, 'time': instance.time, 'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          'Choose a location'
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  //To import flags
                  // leading: CircleAvatar(
                  //   backgroundImage: AssetImage(
                  //     'assets/${locations[index].flag}'
                  //   ),
                  // ),
                ),
              ),
            );
          },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_jarvis_world_time/services/worldTime.dart';
import 'package:flutter_jarvis_world_time/services/InternetCheck.dart';

class ChooseLocation extends StatefulWidget {


  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime('Asia/Kolkata','India','ind.png'),
    WorldTime('Europe/London','London','uk.png'),
    WorldTime('Europe/Berlin', 'Athens', 'greece.png'),
    WorldTime('Africa/Cairo',  'Cairo', 'egypt.png'),
    WorldTime('Africa/Nairobi',  'Nairobi',  'kenya.png'),
    WorldTime('America/Chicago', 'Chicago',  'usa.png'),
    WorldTime('America/New_York', 'New York', 'usa.png'),
    WorldTime('Asia/Seoul', 'Seoul', 'south_korea.png'),
    WorldTime('Asia/Jakarta', 'Jakarta',  'indonesia.png'),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body:
      ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}')
                  ),

                ),
              ),
            );
        }
      ),
    );
  }

  void updateTime(int index)async {

    InternetCheck check= new InternetCheck();
    bool isConnected=await check.checkInternet();
    if(isConnected)
      {
        WorldTime instance=locations[index];
        await instance.getTime();
        Navigator.pop(context,{
          'location':instance.location,
          'flag':instance.flag,
          'time':instance.time,
          'isDay':instance.isDay
        });
      }
    else
      {
        Navigator.pushReplacementNamed(context, '/error');
      }

  }
}

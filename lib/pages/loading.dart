import 'package:flutter/material.dart';
import 'package:flutter_jarvis_world_time/services/worldTime.dart';
import 'package:flutter_jarvis_world_time/services/InternetCheck.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {


  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  bool isError=false;
  bool isConnected=false;
  void setTime() async
  {
    print('setTime Called');
    InternetCheck check= new InternetCheck();
    isConnected=await check.checkInternet();

    print('isConnected..$isConnected');

    if(!isConnected)
      {
        print('iserror ..${this.isError}');
        Navigator.pushReplacementNamed(context, '/error');
      }
    else{
      WorldTime instance= WorldTime('Asia/Kolkata','Kolkata', 'ind.png');
      await instance.getTime();
      print('iserror ..${this.isError}');
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDay':instance.isDay
      });
      this.isError=instance.isError;
    }




  }


  @override
  void initState() {

    super.initState();
    setTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          size: 80.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

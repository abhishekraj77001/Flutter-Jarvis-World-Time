import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  var location;
  var time;
  var flag;
  var url;
  bool isDay=false;
  bool isError=false;

  WorldTime(this.url,this.location,this.flag){}

  Future<void> getTime() async
  {
    try{

      print('Worldtime from gettime..');
      Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      print('from loading time1');
      Map data= jsonDecode(response.body);
      print('from loading time1 $data.values');
      String dateTime=data['utc_datetime'];
      print('from loading time1 $data.values');
      String offset=data['utc_offset'];
      print('from loading time1 $data.values');
      String hr=offset.substring(1,3);
      String min=offset.substring(4);




      print(offset);

      DateTime now= DateTime.parse(dateTime);
      now= now.add(Duration(hours: int.parse(hr),minutes: int.parse(min)));
      //this.time=(now).toString();

      isDay= now.hour>6 && now.hour<20 ? true:false;

      time=DateFormat.jm().format(now);
      print('from loading time.. $time');


    }
    catch(e){
          print('Worldtime from catch..');
          this.isError=true;
    }

  }

}
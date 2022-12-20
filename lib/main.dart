import 'package:flutter/material.dart';
import 'package:flutter_jarvis_world_time/pages/loading.dart';
import 'package:flutter_jarvis_world_time/pages/home.dart';
import 'package:flutter_jarvis_world_time/pages/choose_location.dart';
import 'package:flutter_jarvis_world_time/pages/ErrorPage.dart';



void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=> Loading(),
        '/home':(context)=> Home(),
        '/location':(context)=> ChooseLocation(),
        '/error':(context)=>ErrorPage()
      },
    )
  );
}

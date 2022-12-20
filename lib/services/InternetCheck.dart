import 'dart:async';
import 'dart:io';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:http/http.dart';

class InternetCheck
{

  Future<bool> checkInternet() async
  {
    print('check interner called');
    // bool isConnected = await SimpleConnectionChecker.isConnectedToInternet();
    // print('check internet return $isConnected');
    // return isConnected;

    try {
      Response response= await get(Uri.parse('http://worldtimeapi.org/api/timezone'));
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    on SocketException catch (_) {
      return false;
    }
  }


}
import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {



  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0,150.0,20.0,0.0),
        child: Center(
          child: Column(
            children: [
              Image(image: AssetImage('images/error.png')),
              SizedBox(height: 20.0,),
              Text('Something is not right here...'),
              SizedBox(height: 20.0,),
              Text('Check your internet and click below refresh button'),
              SizedBox(height: 20.0,),
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(Icons.refresh_sharp),
                  label: Text(
                      'Refresh',
                      style: TextStyle(
                        color: Colors.black
                      ),
                  ))
            ],

          ),
        ),
      ),
    );
  }
}

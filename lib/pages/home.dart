import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data= data.isNotEmpty?data: ModalRoute.of(context)!.settings.arguments as Map;


   String bcgImg= data['isDay']?'day.png':'night.png';

    print(data);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/$bcgImg'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton.icon(
                      onPressed: ()async {
                      dynamic result= await  Navigator.pushNamed(context, '/location');
                      setState(() {
                        data={
                          'time':result['time'],
                          'location':result['location'],
                          'flag':result['flag'],
                          'isDay':result['isDay']

                        };
                      });
                      },
                      icon: Icon(Icons.edit_location),
                      label: Text('Edit Location')),
                ],
              ),
            SizedBox(height: 30.0,),
              Center(
                child: Text
                  (data['location'],
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.amber,
                      letterSpacing: 2.0

                  ),

                ),
              ),
              SizedBox(height: 30.0,),
            Center(
              child: Text
                (data['time'],
                style: TextStyle(
                  fontSize: 55.0,
                  color: Colors.amber,
                  letterSpacing: 2.0

                ),

              ),
            )

          ],

          ),

            ),
      ),
      );

      

  }
}

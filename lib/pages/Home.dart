import 'package:flutter/material.dart';
import 'package:world_time/services/WorldTimeService.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WorldTimeService worldTime = null;

  @override
  Widget build(BuildContext context) {
    // Received the object that will be showed
    worldTime = worldTime != null ? worldTime : ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage("if-nuit.jpghttps://www.energids.be/nl/media/mediumimg/18/24tarif-exclus"),
                image: new AssetImage('assets/${worldTime.bgImageTimeOfDay}'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  // Image.network('https://www.energids.be/nl/media/mediumimg/18/24tarif-exclusif-nuit.jpg'),
                  FlatButton.icon(
                      onPressed: () async{
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          worldTime = result;
                        });
                      },
                      icon: Icon(Icons.edit, color: Colors.black,),
                      label: Text('Edit Location',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                        ),
                      )
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            worldTime.location,
                            style: TextStyle(
                                fontSize: 40.0,
                                letterSpacing: 2.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Text(
                            worldTime.time,
                            style: TextStyle(
                                fontSize: 60.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
        ),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:world_time/services/WorldTimeService.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupTimeWorld() async{
    WorldTimeService worldService = WorldTimeService(location: 'Berlin', flagImage: 'germany', url: 'Europe/Berlin');
    await worldService.getTime();
    // Redirect the data to the home page.
    Navigator.pushReplacementNamed(context, '/home', arguments: worldService);

  }

  @override
  void initState() {
    super.initState();

    setupTimeWorld();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.white,
            size: 90.0,
            // duration: Duration(seconds: 30600),
          ),
        ),
    );
  }
}

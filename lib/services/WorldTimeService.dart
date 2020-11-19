import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTimeService{

  String location;
  String flagImage;
  String url;
  String time;
  String bgImageTimeOfDay;

  WorldTimeService({this.location, this.flagImage, this.url});

  Future<void> getTime() async {

    try {
      url = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await get(url);
      Map responseStream = jsonDecode(response.body);

      DateTime dateNow = DateTime.parse(responseStream['datetime']);
      int utc_offset = int.parse(responseStream['utc_offset'].toString().substring(1, 3));
      dateNow = dateNow.add(Duration(hours: utc_offset));

      this.bgImageTimeOfDay = dateNow.hour > 6 && dateNow.hour < 20 ? 'day.jpg': 'night.jpg';
      this.time = DateFormat.jm().format(dateNow);

    } catch(e){
        time = "can't get the time. Erro: $e";
    }
  }
}
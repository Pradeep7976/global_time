import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
   String location="";
   String time="";
   String flag;
   String url;
   bool isDayTime=false;

   WorldTime({required this.location, required this.flag, required this.url});


    Future<void> getTime() async {
      try{
        var response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
        Map data = jsonDecode(response.body);

        String datetime=data['utc_datetime'];
        String offset=data['utc_offset'].toString().substring(1,3);

        DateTime now =DateTime.parse(datetime);
        now = now.add(Duration(hours:( int.parse(offset)))).add(Duration(minutes: 30));

        isDayTime = now.hour > 6 && now.hour<20 ?true:false;

        time= DateFormat.jm().format(now);
      }catch(e){
        time='could not get time data';
      }

    }

}

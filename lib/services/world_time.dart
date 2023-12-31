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
        var response = await get(Uri.parse('https://www.timeapi.io/api/Time/current/zone?timeZone=$url'));
        Map data = jsonDecode(response.body);

        String datetime=data['dateTime'];

        DateTime now =DateTime.parse(datetime);

        isDayTime = now.hour > 6 && now.hour<19 ?true:false;

        time= DateFormat.jm().format(now);
      }catch(e){
        time='could not get time data';
      }

    }

}

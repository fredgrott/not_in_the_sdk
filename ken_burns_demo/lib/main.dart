// BSD Clause 3
// Copyright (c) 2021, neo_reusables


import 'package:flutter/material.dart';

import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*
              Container(
                height: 300,
                child: KenBurns(
                  child: Image.network(
                    "https://www.photo-paysage.com/?file=pic_download_link/picture&pid=3100",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              */
              SizedBox(
                height: 300,
                child: KenBurns.multiple(
                  maxAnimationDuration: const Duration(seconds: 10),
                  minAnimationDuration: const Duration(seconds: 3),
                  children: <Widget>[
                    Image.network(
                      "https://unsplash.com/photos/y2azHvupCVo",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://cdn.getyourguide.com/img/location_img-59-1969619245-148.jpg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://www.theglobeandmail.com/resizer/vq3O7LI3hvsjTP2N0m9NwU4W3Eg=/1500x0/filters:quality(80)/arc-anglerfish-tgam-prod-tgam.s3.amazonaws.com/public/4ETF3GZR3NA3RDDW23XDRBKKCI",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

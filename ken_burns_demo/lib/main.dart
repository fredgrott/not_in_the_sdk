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
      debugShowCheckedModeBanner: false,
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
                      "https://photos.google.com/album/AF1QipPg4cSFhiX03mvXOH70YvcNo81Wq8t8GMFNOVrt/photo/AF1QipOQ2YvLe1FUWC_4tj1zUvPKyJQRyLTTQWbvHvJR",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://photos.google.com/album/AF1QipPg4cSFhiX03mvXOH70YvcNo81Wq8t8GMFNOVrt/photo/AF1QipPbjnfJv8yNcHc_zjDdjimCkPH76o8MillsY2fy",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://photos.google.com/album/AF1QipPg4cSFhiX03mvXOH70YvcNo81Wq8t8GMFNOVrt/photo/AF1QipPjvRZn7vE_MkMvelUR2PPX8Vf8NrTLy8Kd6DzQ",
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

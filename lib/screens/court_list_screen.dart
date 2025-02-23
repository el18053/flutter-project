import 'package:flutter/material.dart';
import '../widgets/court_field_card.dart';

class CourtListScreen extends StatelessWidget {
  final String title;

  CourtListScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Courts'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          CourtFieldCard(
            fieldName: "Court 1",
            images: ["assets/court.jpg", "assets/court_2.jpg"],
            availableCourts: [
              {
                "name": "Court A",
                "images": ["assets/court.jpg", "assets/court.jpg"],
                "rating": 9.0,
                "price": 20.0
              },
              {
                "name": "Court B",
                "images": ["assets/court_2.jpg", "assets/court_2.jpg"],
                "rating": 8.5,
                "price": 18.0
              },
            ],
          ),
          CourtFieldCard(
            fieldName: "Court 2",
            images: ["assets/court.jpg", "assets/court_2.jpg"],
            availableCourts: [
              {
                "name": "Court A",
                "images": ["assets/court.jpg", "assets/court.jpg"],
                "rating": 9.0,
                "price": 20.0
              },
              {
                "name": "Court B",
                "images": ["assets/court_2.jpg", "assets/court_2.jpg"],
                "rating": 8.5,
                "price": 18.0
              },
            ],
          ),
        ],
      ),
    );
  }
}

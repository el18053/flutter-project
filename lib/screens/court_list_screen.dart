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
            fieldName: "Football",
            images: ["assets/court.jpg", "assets/court_2.jpg"],
            availableCourts: [
              {
                "name": "Football Court A",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 9.0,
                "price": 30.0,
                "availability": ["5x5", "7x7"], // Football court has availability field
              },
              {
                "name": "Football Court B",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 8.5,
                "price": 25.0,
                "availability": ["5x5"], // Only 5x5 option
              },
              {
                "name": "Football Court C",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 8.0,
                "price": 20.0,
                "availability": ["7x7"], // Only 7x7 option
              },
            ],
          ),
          CourtFieldCard(
            fieldName: "Football",
            images: ["assets/court.jpg", "assets/court_2.jpg"],
            availableCourts: [
              {
                "name": "Football Court A",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 9.0,
                "price": 30.0,
                "availability": ["5x5", "7x7"], // Football court has availability field
              },
              {
                "name": "Football Court B",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 8.5,
                "price": 25.0,
                "availability": ["5x5"], // Only 5x5 option
              },
              {
                "name": "Football Court C",
                "images": ["assets/court.jpg", "assets/court_2.jpg"],
                "rating": 8.0,
                "price": 20.0,
                "availability": ["7x7"], // Only 7x7 option
              },
            ],
          ),
        ],
      ),
    );
  }
}
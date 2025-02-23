import 'package:flutter/material.dart';
import '../widgets/court_category_card.dart';

class CourtDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🏆 Elite Courts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Push content to the center
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // Adjust the height dynamically
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true, // Ensures the GridView doesn't take full height
                  children: [
                    CourtCategoryCard(title: 'Tennis', icon: Icons.sports_tennis),
                    CourtCategoryCard(title: 'Basketball', icon: Icons.sports_basketball),
                    CourtCategoryCard(title: 'Volleyball', icon: Icons.sports_volleyball),
                    CourtCategoryCard(title: 'Soccer', icon: Icons.sports_soccer),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'booking_screen.dart';

class AvailableCourtsScreen extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> availableCourts;

  AvailableCourtsScreen({required this.category, required this.availableCourts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available $category Courts"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: availableCourts.length,
        itemBuilder: (context, index) {
          final court = availableCourts[index];

          return Card(
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: SizedBox(
                width: 60,
                height: 60,
                child: PageView(
                  children: court['images'].map<Widget>((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(image, fit: BoxFit.cover),
                    );
                  }).toList(),
                ),
              ),
              title: Text(court['name'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow, size: 20),
                      SizedBox(width: 5),
                      Text("${court['rating']} / 10"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green),
                      Text("${court['price']} per hour", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  // Show Availability ONLY for Football Courts
                  if (court.containsKey('availability'))
                    Row(
                      children: [
                        Icon(Icons.sports_soccer, color: Colors.blue),
                        SizedBox(width: 5),
                        Text("Available: ${court['availability'].join(', ')}", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                ],
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingScreen(
                      courtName: court['name'],
                      courtImages: court['images'],
                      rating: court['rating'],
                      price: court['price'],
                      availability: court.containsKey('availability') ? court['availability'] : [],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

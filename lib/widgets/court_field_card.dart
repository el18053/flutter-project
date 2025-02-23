import 'package:flutter/material.dart';
import '../screens/available_courts_screen.dart';

class CourtFieldCard extends StatefulWidget {
  final String fieldName;
  final List<String> images;
  final List<Map<String, dynamic>> availableCourts; // Add available courts data

  CourtFieldCard({required this.fieldName, required this.images, required this.availableCourts});

  @override
  _CourtFieldCardState createState() => _CourtFieldCardState();
}

class _CourtFieldCardState extends State<CourtFieldCard> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AvailableCourtsScreen(
              category: widget.fieldName,
              availableCourts: widget.availableCourts,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            // PageView for image slider
            Stack(
              children: [
                SizedBox(
                  height: 150,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.images.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                        child: Image.asset(
                          widget.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    },
                  ),
                ),
                // Dots Indicator
                Positioned(
                  bottom: 8,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(widget.images.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 10 : 8,
                        height: _currentPage == index ? 10 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index ? Colors.white : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.fieldName, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text("Location "),
                  Icon(Icons.location_on_outlined, color: Colors.black),
                  SizedBox(width: 5),
                  Text("DreamLand"),
                ],
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Text("Rating "),
                  Icon(Icons.star, color: Colors.yellow),
                  SizedBox(width: 5),
                  Text("8/10"),
                ],
              ),
            ),
            ListTile(title: Text("Available Time Slots : 10:00 - 22:00")),
          ],
        ),
      ),
    );
  }
}

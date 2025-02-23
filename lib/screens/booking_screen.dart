import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String courtName;
  final List<String> courtImages;
  final double rating;
  final double price;

  BookingScreen({required this.courtName, required this.courtImages, required this.rating, required this.price});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? selectedTimeSlot;
  int _currentImageIndex = 0;
  late PageController _pageController;

  final List<String> timeSlots = [
    "10:00 - 11:00 AM", "11:00 - 12:00 PM", "12:00 - 1:00 PM",
    "2:00 - 3:00 PM", "3:00 - 4:00 PM", "5:00 - 6:00 PM", "6:00 - 7:00 PM",
  ];

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

  void _confirmBooking() {
    if (selectedTimeSlot == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select a time slot!")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Booking Confirmed!"),
        content: Text("You have booked ${widget.courtName} at $selectedTimeSlot for \$${widget.price}."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book ${widget.courtName}"),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image Carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.courtImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(widget.courtImages[index], fit: BoxFit.cover),
                );
              },
            ),
          ),

          // Image Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.courtImages.length, (index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                width: _currentImageIndex == index ? 10 : 8,
                height: _currentImageIndex == index ? 10 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentImageIndex == index ? Colors.deepPurple : Colors.grey,
                ),
              );
            }),
          ),

          // Title & Rating
          Text(widget.courtName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 24),
              SizedBox(width: 5),
              Text("${widget.rating} / 10"),
            ],
          ),
          SizedBox(height: 10),

          // Price
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              Text("\$${widget.price} per hour", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 10),

          // Select Time Slot
          Text("Select a Time Slot", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(timeSlots[index]),
                  leading: Radio<String>(
                    value: timeSlots[index],
                    groupValue: selectedTimeSlot,
                    onChanged: (value) {
                      setState(() {
                        selectedTimeSlot = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Booking Button
          Padding(
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: _confirmBooking,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              ),
              child: Text("Confirm Booking", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

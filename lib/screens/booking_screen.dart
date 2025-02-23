import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String courtName;
  final List<String> courtImages;
  final double rating;
  final double price;
  final List<String> availability; // New field for football courts

  BookingScreen({required this.courtName, required this.courtImages, required this.rating, required this.price, required this.availability});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String? selectedAvailability;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.courtImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(widget.courtImages[index], fit: BoxFit.cover),
                  );
                },
              ),
            ),
            Text(widget.courtName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Rating: ${widget.rating}/10"),
            Text("Price: \$${widget.price} per hour"),
            if (widget.availability.isNotEmpty)
              Column(
                children: widget.availability.map((option) {
                  return RadioListTile<String>(
                    title: Text(option),
                    value: option,
                    groupValue: selectedAvailability,
                    onChanged: (value) {
                      setState(() {
                        selectedAvailability = value;
                      });
                    },
                  );
                }).toList(),
              ),
            Text("Select a Time Slot", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Column(
              children: timeSlots.map((slot) {
                return RadioListTile<String>(
                  title: Text(slot),
                  value: slot,
                  groupValue: selectedTimeSlot,
                  onChanged: (value) {
                    setState(() {
                      selectedTimeSlot = value;
                    });
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _confirmBooking,
              child: Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}

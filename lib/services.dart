import 'package:flutter/material.dart';
import 'package:dh/basescaffold.dart'; // Import BaseScaffold
import 'electrician.dart'; // Import individual service pages
import 'plumber.dart';
import 'househelp.dart';
import 'laundry.dart';
import 'gardener.dart';
import 'grocery.dart';
import 'bicycle.dart';
import 'transport.dart';
import 'turf.dart';

class ServicesScreen extends StatefulWidget {
  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  // List of all Services names
  final List<String> services = [
    'Electrician',
    'Plumber',
    'Househelp',
    'Laundry',
    'Gardener',
    'Grocery',
    'Bicycle Booking',
    'Local Transport',
    'Turf & Club',
  ];

  // Names of a particular service's sub-services
  final List<List<String>> serviceNames = [
    ['Fan Installation', 'Light Repair', 'Wiring Check', 'UnInstallation'],
    ['Pipe Leak Repair', 'Tap Installation', 'Drain Cleaning'],
    ['House Cleaning', 'Dish Washing', 'Laundry'],
    ['Wash and Iron', 'Dry Cleaning', 'Iron Only'],
    ['Lawn Mowing', 'Plant Watering', 'Garden Maintenance'],
    ['Home Delivery', 'Bulk Order', 'Express Delivery'],
    ['Hourly Rental', 'Daily Rental', 'Weekly Rental'],
    ['Taxi Booking', 'Auto Rickshaw', 'Bus Pass'],
    ['Turf Booking', 'Club Membership', 'Event Hosting'],
  ];

  // Price of all sub-services of each service
  final List<List<int>> servicesCharge = [
    [50, 52, 54, 56],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
    [50, 52, 54],
  ];

  // Images of services
  final List<String> serviceImages = [
    'assets/electrician.png',
    'assets/plumber.png',
    'assets/househelp.png',
    'assets/laundry.png',
    'assets/gardener.png',
    'assets/grocery.png',
    'assets/bicycle.png',
    'assets/transport.png',
    'assets/turf.png',
  ];

  // Map service names to corresponding pages
  final Map<String, Widget Function(BuildContext, String, List<String>, List<int>)> servicePages = {
    'Electrician': (context, title, serviceOptions, serviceCharges) =>
        ElectricianPage(title: title, imagePath: 'assets/electrician.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Plumber': (context, title, serviceOptions, serviceCharges) =>
        PlumberPage(title: title, imagePath: 'assets/plumber.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Househelp': (context, title, serviceOptions, serviceCharges) =>
        HousehelpPage(title: title, imagePath: 'assets/househelp.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Laundry': (context, title, serviceOptions, serviceCharges) =>
        LaundryPage(title: title, imagePath: 'assets/laundry.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Gardener': (context, title, serviceOptions, serviceCharges) =>
        GardenerPage(title: title, imagePath: 'assets/gardener.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Grocery': (context, title, serviceOptions, serviceCharges) =>
        GroceryPage(title: title, imagePath: 'assets/grocery.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Bicycle Booking': (context, title, serviceOptions, serviceCharges) =>
        BicyclePage(title: title, imagePath: 'assets/bicycle.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Local Transport': (context, title, serviceOptions, serviceCharges) =>
        TransportPage(title: title, imagePath: 'assets/transport.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
    'Turf & Club': (context, title, serviceOptions, serviceCharges) =>
        TurfPage(title: title, imagePath: 'assets/turf.png', serviceOptions: serviceOptions, servicesCharge: serviceCharges),
  };

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Services',
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8.0),
              children: List.generate(services.length, (index) {
                return GestureDetector(
                  onTap: () {
                    String selectedService = services[index];
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => servicePages[selectedService]!(
                          context,
                          selectedService,
                          serviceNames[index],
                          servicesCharge[index],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: AssetImage(serviceImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: 75,
                        height: 75,
                      ),
                      SizedBox(height: 4),
                      Text(
                        services[index],
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:admin/pages/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Seller Details'),
        ),
        backgroundColor:
            Colors.grey[200], // Setting background color for the page
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  'assets/seller.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 20),
                color: Colors.white, // Setting background color for the card
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow(
                        icon: Icons.person,
                        label: 'Name',
                        value: ctrl.seller!.first.username.toString(),
                      ),
                      Divider(),
                      _buildDetailRow(
                        icon: Icons.phone,
                        label: 'Mobile Number',
                        value: ctrl.seller!.first.phone.toString(),
                      ),
                      Divider(),
                      _buildDetailRow(
                        icon: Icons.email,
                        label: 'Email',
                        value: ctrl.seller!.first.email.toString(),
                      ),
                      Divider(),
                      _buildDetailRow(
                        icon: Icons.location_on,
                        label: 'Location',
                        value: 'Sun City, Hyderabad',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDetailRow(
      {required IconData icon, required String label, required String value}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}

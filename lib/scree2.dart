import 'package:flutter/material.dart';

class RecentCampaignsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Recent'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CampaignCard(
            currentAmount: 2500,
            targetAmount: 4000,
            title: 'Building a Sustainable Hive for a ...',
            organization: 'Bee-Care',
            postedTime: '3 minutes ago',
          ),
          SizedBox(height: 16),
          CampaignCard(
            currentAmount: 5000,
            targetAmount: 15000,
            title: 'Providing Better Education for ...',
            organization: 'Extra Helpers',
            postedTime: '1 hour ago',
          ),
        ],
      ),
    );
  }
}

class CampaignCard extends StatelessWidget {
  final double currentAmount;
  final double targetAmount;
  final String title;
  final String organization;
  final String postedTime;

  const CampaignCard({
    Key? key,
    required this.currentAmount,
    required this.targetAmount,
    required this.title,
    required this.organization,
    required this.postedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3A3C),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${currentAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${targetAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: currentAmount / targetAmount,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      postedTime,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.grey,
                      child: Text(
                        organization[0],
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      organization,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

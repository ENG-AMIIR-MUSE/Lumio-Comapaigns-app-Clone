import 'package:flutter/material.dart';
import 'package:ui_clone/scree2.dart';
import 'package:ui_clone/screen3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crowdfunding App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1C1C1E),
      ),
      home: ExploreCampaignsScreen(),
    );
  }
}

class ExploreCampaignsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Explore Campaigns',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search donation campaign...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Color(0xFF2C2C2E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: Colors.orange),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Wrapping RecentCampaignCard with GestureDetector for navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecentCampaignsScreen(),
                  ),
                );
              },
              child: RecentCampaignCard(
                title: 'Bring The Lost City to Live',
                organizer: 'Extra Helpers',
                raisedAmount: 400,
                goalAmount: 4000,
                color: Color(0xff27364E),
                progressColor: Colors.red,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward, color: Colors.orange),
                ],
              ),
            ),
            SizedBox(height: 8),
            // Wrapping PopularCampaignCard with GestureDetector for navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularCampaignsScreen(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PopularCampaignCard(
                  title: 'Save Earth From Global ...',
                  organization: 'Extra Helpers',
                  progress: 0.7,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF2C2C2E),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }
}

// Dummy Campaign Detail Screen for Popular Campaigns
class PopularCampaignsDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Campaign Details'),
      ),
      body: Center(
        child: Text('Details of the popular campaign will be displayed here.'),
      ),
    );
  }
}

class RecentCampaignCard extends StatelessWidget {
  final String title;
  final String organizer;
  final double raisedAmount;
  final double goalAmount;
  final Color color;
  final Color progressColor;

  RecentCampaignCard({
    required this.title,
    required this.organizer,
    required this.raisedAmount,
    required this.goalAmount,
    required this.color,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Placeholder
          Container(
            height: 152,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 10),
          // Progress bar with amounts on top
          Stack(
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Container(
                height: 6,
                width: (raisedAmount / goalAmount) *
                    MediaQuery.of(context).size.width *
                    0.6,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$$raisedAmount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Text(
                '\$$goalAmount',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Campaign details
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.person, color: Colors.grey, size: 16),
              SizedBox(width: 4),
              Text(
                organizer,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.verified, color: Colors.green, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class PopularCampaignCard extends StatelessWidget {
  final String title;
  final String organization;
  final double progress;

  const PopularCampaignCard({
    Key? key,
    required this.title,
    required this.organization,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 8,
                    ),
                    SizedBox(width: 8),
                    Text(organization, style: TextStyle(color: Colors.grey)),
                    SizedBox(width: 8),
                    Icon(Icons.check_circle, color: Colors.green, size: 16),
                  ],
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

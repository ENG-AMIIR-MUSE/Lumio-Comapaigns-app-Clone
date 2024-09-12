import 'package:flutter/material.dart';

class PopularCampaignsScreen extends StatelessWidget {
  final List<CampaignData> campaigns = [
    CampaignData(
      title: 'Save Earth From Global ...',
      organization: 'Extra Helpers',
      progress: 0.7,
      isVerified: true,
    ),
    CampaignData(
      title: 'A Community Garden for...',
      organization: 'Oasis Helper',
      progress: 0.5,
      isVerified: true,
    ),
    CampaignData(
      title: 'Funding for a Cure',
      organization: 'MedHelps',
      progress: 0.3,
      isVerified: false,
    ),
    CampaignData(
      title: 'Saving Oceans Life, One ...',
      organization: 'Oasis Helper',
      progress: 0.8,
      isVerified: true,
    ),
    CampaignData(
      title: 'Providing Education for ...',
      organization: 'Extra Helpers',
      progress: 0.6,
      isVerified: true,
    ),
  ];

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
        title: Text('Popular'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: campaigns.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CampaignCard(campaign: campaigns[index]),
          );
        },
      ),
    );
  }
}

class CampaignData {
  final String title;
  final String organization;
  final double progress;
  final bool isVerified;

  CampaignData({
    required this.title,
    required this.organization,
    required this.progress,
    required this.isVerified,
  });
}

class CampaignCard extends StatelessWidget {
  final CampaignData campaign;

  const CampaignCard({Key? key, required this.campaign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    campaign.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey,
                        child: Text(
                          campaign.organization[0],
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        campaign.organization,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      if (campaign.isVerified) ...[
                        SizedBox(width: 4),
                        Icon(Icons.check_circle, color: Colors.green, size: 14),
                      ],
                    ],
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: campaign.progress,
                    backgroundColor: Colors.grey[800],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:amingo/screens/friend_verification.dart';
import 'package:flutter/material.dart';

class PlayerEventDetails extends StatelessWidget {
  const PlayerEventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // sample data
    final List<EventDetail> details = [
      EventDetail(
        icon: Icons.calendar_month,
        mainDetail: "Oct 15, 2025",
        subDetail: "Tuesday",
      ),
      EventDetail(
        icon: Icons.timer,
        mainDetail: "6pm - 9pm",
        subDetail: "Duration: 3 hrs",
      ),
      EventDetail(
        icon: Icons.location_on,
        mainDetail: "Amrita University",
        subDetail: "Main Auditorium",
      ),
    ];

    return Scaffold(
      backgroundColor: colorScheme.surface,

      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        title: Text(
          "•  LIVE EVENT",
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // BODY
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // crowd gathering image
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.22,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/crowd_gathering.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 15,
                          left: 15,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.006,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "SOCIAL BINGO",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Column(
                  children: details.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: DetailCard(
                        icon: item.icon,
                        mainDetail: item.mainDetail,
                        subDetail: item.subDetail,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM PLAY BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: height * 0.07,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FriendVerification(letter: 'A'),
                  ),
                ); //NAVIGATION TO BINGO BOARD
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "PLAY",
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// CUSTOM WIDGET FOR DETAILS

class DetailCard extends StatelessWidget {
  final IconData icon;
  final String mainDetail;
  final String subDetail;

  const DetailCard({
    super.key,
    required this.icon,
    required this.mainDetail,
    required this.subDetail,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width * 0.9,
      height: height * 0.12,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        children: [
          Icon(icon, color: colorScheme.primary, size: 36),

          SizedBox(width: width * 0.04),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mainDetail,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),

                SizedBox(height: height * 0.008),

                Text(
                  subDetail,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//----------------------------------------------------------------
// Class for sample data
class EventDetail {
  final IconData icon;
  final String mainDetail;
  final String subDetail;

  EventDetail({
    required this.icon,
    required this.mainDetail,
    required this.subDetail,
  });
}

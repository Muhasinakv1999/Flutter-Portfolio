import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(  // Allow scrolling for smaller screens
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 34, 33, 33),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 20,bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              const Text(
                "About Me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'A Flutter developer passionate about creating beautiful and functional cross-platform apps for Android and the web. Eager to learn and grow, I focus on building intuitive user interfaces and exploring the latest technologies in mobile and web development.',
                style: TextStyle(color: Colors.grey, fontSize: 20),
                maxLines: null,
              ),
              const SizedBox(height: 10),
              const Text(
                "What I'm Doing",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double cardWidth = screenWidth > 600 ? screenWidth * 0.4 : screenWidth * 0.9; 

                  return screenWidth > 600
                      ? Row(
                          children: [
                            Expanded(
                              child: serviceCard(
                                title: "Mobile Apps",
                                description:
                                    "Professional development of applications for Android.",
                                icon: Icons.phone_android,
                                width: cardWidth,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: serviceCard(
                                title: "Web Development",
                                description:
                                    "High-quality development of sites at a professional level.",
                                icon: Icons.web,
                                width: cardWidth,
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            serviceCard(
                                title: "Mobile Apps",
                                description:
                                    "Developing high-quality Android apps with a focus on performance and user experience.",
                                icon: Icons.phone_android,
                                width: screenWidth),
                            const SizedBox(height: 20),
                            serviceCard(
                                title: "Web Development",
                                description:
                                    "Building high-quality websites with a focus on functionality and user experience",
                                icon: Icons.web,
                                width: screenWidth),
                          ],
                        );
                },
              ),
              const SizedBox(height: 20),
              skillSection(),
              
              
            ],
          ),
        ),
      ),
    );
  }
}

Widget serviceCard({
  required String title,
  required String description,
  required IconData icon,
  required double width,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      gradient: const LinearGradient(
        colors: [
          Color.fromARGB(255, 66, 66, 66),
          Color.fromARGB(255, 246, 238, 247)
        ], // Adjust colors as needed
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(1),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.yellow, size: 50),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
              maxLines: null,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget skillSection() {
  final List<Map<String, dynamic>> skills = [
    {
      "image": "assets/images/dart.png",
      "url": "https://dart.dev",
    },
    {
      "image": "assets/images/flutter.png",
      "url": "https://flutter.dev",
    },
    {
      "image": "assets/images/firebase.png",
      "url": "https://firebase.google.com",
    },
  ];

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;

      // Adjust size dynamically
      double containerSize = screenWidth > 600 ? 150 : 100; // Larger for bigger screens

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 10),
            child: Text(
              "Skills",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: containerSize + 20, // Adjusted for consistency
            child: screenWidth > 600
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: skills.map((skill) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () => launchURL(skill["url"]!),
                          child: Container(
                            width: containerSize,
                            height: containerSize,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 40, 40, 62),
                              borderRadius: BorderRadius.circular(containerSize * 0.3),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(containerSize * 0.15),
                              child: Image.asset(skill["image"]!),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: skills.map((skill) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: InkWell(
                            onTap: () => launchURL(skill["url"]!),
                            child: Container(
                              width: containerSize,
                              height: containerSize,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 40, 40, 62),
                                borderRadius: BorderRadius.circular(containerSize * 0.3),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(containerSize * 0.15),
                                child: Image.asset(skill["image"]!),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ),
        ],
      );
    },
  );
}

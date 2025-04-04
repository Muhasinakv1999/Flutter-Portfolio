import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double imageSize =
          screenWidth > 600 ? 150 : 150; // Adjust size dynamically

      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 34, 33, 33),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 60, 59, 59),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: CircleAvatar(
                      radius: imageSize / 2,
                      backgroundImage:
                          const AssetImage("assets/images/profile.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Muhasina KV",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 64, 62, 62),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("Flutter Developer",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Color.fromARGB(255, 60, 56, 56),
                thickness: 1,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 20),
              contactItem(
                icon: Icons.email,
                title: "EMAIL",
                content: "muhasinakv1999@gmail.com",
                screenWidth: screenWidth, 
              ),
              const SizedBox(height: 20),
              contactItem(
                icon: Icons.phone,
                title: "PHONE",
                content: "+91-7510991940",
                screenWidth: screenWidth, 
              ),
              const SizedBox(height: 20),
              contactItem(
                icon: Icons.location_on,
                title: "LOCATION",
                content: "Malappuram, Kerala",
                screenWidth: screenWidth, 
              ),
              const SizedBox(height: 20),
              Wrap(
                alignment: WrapAlignment.center, 
                spacing: 10, 
                runSpacing: 10, 
                children: [
                  socialIcon(
                      FontAwesomeIcons.linkedin,
                      "https://www.linkedin.com/in/muhasina-kv-19aa4822a",
                      screenWidth),
                  socialIcon(FontAwesomeIcons.github,
                      "https://github.com/Muhasinakv1999", screenWidth),
                  socialIcon(FontAwesomeIcons.google,
                      "mailto:muhasinakv1999@gmail.com", screenWidth),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    });
  }
}

Widget contactItem({
  required IconData icon,
  required String title,
  required String content,
  required double screenWidth, 
}) {
  double iconSize = screenWidth > 600 ? 24 : 18; 
  double paddingSize = screenWidth > 600 ? 14 : 10; // Adjust padding
  double titleFontSize = screenWidth > 600 ? 14 : 12;
  double contentFontSize = screenWidth > 600 ? 16 : 14;

  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: screenWidth > 600 ? 30 : 20, vertical: 8),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(paddingSize),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.yellow, width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.yellow, size: iconSize),
        ),
        const SizedBox(width: 12),
        Expanded(
          // Ensures text does not overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: contentFontSize,
                ),
                overflow: TextOverflow.ellipsis, // Prevents overflow issues
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget socialIcon(IconData icon, String url, double screenWidth) {
  double iconSize =
      screenWidth > 600 ? 24 : 20; // Adjust icon size based on screen width

  return InkWell(
    onTap: () async {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
      
    },
    child: Icon(icon, color: Colors.white, size: iconSize),
  );
}

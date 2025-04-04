import 'package:flutter/material.dart';
import 'package:portfolio/about_section.dart';
import 'package:portfolio/profile_card.dart';
import 'screen_utils.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(top:ScreenUtil.setWidth(10)),  
        child: LayoutBuilder(
          builder: (context, constraints) {
            
            if (ScreenUtil.width > 900) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  SizedBox(width: constraints.maxWidth * 0.08),
                  const Expanded(flex: 2, child: ProfileCard()),  
                  const SizedBox(width: 20),
                  const Expanded(flex: 8, child: AboutSection()),  
            
                  SizedBox(width: constraints.maxWidth * 0.08),
                ],
              );
            } else {
              
              return SingleChildScrollView(  
                child: Column(
                  children: [
                    const ProfileCard(),  
                    SizedBox(height: ScreenUtil.setHeight(20)),  
                    const AboutSection(),  
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

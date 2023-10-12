import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';
import 'package:zoom_clone/widgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home-screen';

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Meet & Chat'),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: deviceWidth * 0.01),
        child: Column(
          children: [
            SizedBox(
              width: deviceWidth,
              height: deviceHeight * 0.12,
              child: LayoutBuilder(builder: (context, constraint) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeButton(
                      onTap: () {},
                      placeholder: 'New Meeting',
                      icon: Icons.videocam_sharp,
                      constraint: constraint,
                    ),
                    HomeButton(
                      onTap: () {},
                      placeholder: 'Join Meeting',
                      icon: Icons.add_box,
                      constraint: constraint,
                    ),
                    HomeButton(
                      onTap: () {},
                      placeholder: 'Schedule',
                      icon: Icons.calendar_today_rounded,
                      constraint: constraint,
                    ),
                    HomeButton(
                      onTap: () {},
                      placeholder: 'Share Screen',
                      icon: Icons.arrow_circle_up_sharp,
                      constraint: constraint,
                    ),
                  ],
                );
              }),
            ),
            const Expanded(
              child: Center(
                child: Text('Create/Join Meetings with just a click'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double coverHeight = 200;
  final double profileHeight = 140;

  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: bottom),
                child: buildCoverImage(),
              ),
              Positioned(
                top: top,
                child: buildProfileImage(),
              ),
              Positioned(
                top: top / 6,
                child: const Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Positioned(
                top: top / 6,
                right: top / 8,
                child: const Icon(
                  Icons.edit_calendar_sharp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 49),
            child: const Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Kak Elay',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const DynamicTextWidget(
            text: 'Your Information',
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
          DynamicRowWidget(
            showForwardIcon: false,
            iconData: Icons.phone_android_rounded,
            text: '+85510600261',
            onTap: () {
              // Handle onTap action here
            },
          ),
          DynamicRowWidget(
            showForwardIcon: false,
            iconData: Icons.location_on,
            text: 'Angkor Wat',
            onTap: () {
              // Handle onTap action here
            },
          ),
          const DynamicTextWidget(
            text: 'Preferences',
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
          DynamicRowWidget(
            imageUrl:
                'https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Flag_of_Cambodia.svg/1200px-Flag_of_Cambodia.svg.png',
            text: 'Change Language',
            onTap: () {
              // Handle onTap action here
            },
          ),
          const DynamicTextWidget(
            text: 'Supports',
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
          DynamicRowWidget(
            iconData: Icons.privacy_tip,
            text: 'Privacy Policy',
            onTap: () {
              // Handle onTap action here
            },
          ),
          DynamicRowWidget(
            iconData: Icons.note_add,
            text: 'Terms and Conditions',
            onTap: () {
              // Handle onTap action here
            },
          ),
          const SizedBox(
            height: 10,
          ),
          DynamicRowWidget(
            iconData: Icons.logout,
            iconColor: Colors.red,
            text: 'Logout',
            textColor: Colors.red,
            textStyle: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
            forwardIconColor: Colors.red,
            onTap: () {
              // Handle onTap action here
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  DynamicTextWidget(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    text: 'Verison 1.0.0',
                    fontWeight: FontWeight.normal,
                    color: Colors.blue,
                  ),
                  DynamicTextWidget(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    text: 'Let\'s Go by CAMTRIP',
                    fontWeight: FontWeight.normal,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.network(
          'https://cdn.britannica.com/49/94449-050-ECB0E7C2/Angkor-Wat-temple-complex-Camb.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget buildProfileImage() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        child: CircleAvatar(
          radius: profileHeight / 2,
          backgroundColor: Colors.grey.shade800,
          backgroundImage: const NetworkImage(
            'https://avatars.githubusercontent.com/u/110383694?v=4',
          ),
        ),
      );
}

class DynamicRowWidget extends StatelessWidget {
  final IconData? iconData;
  final String text;
  final VoidCallback? onTap;
  final bool showForwardIcon;
  final String? imageUrl;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? forwardIconColor;

  const DynamicRowWidget({
    Key? key,
    this.iconData,
    required this.text,
    this.onTap,
    this.showForwardIcon = true,
    this.imageUrl,
    this.iconColor,
    this.textColor,
    this.textStyle,
    this.forwardIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          if (imageUrl != null)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
              backgroundColor: iconColor ?? Colors.transparent,
            )
          else
            Icon(iconData, color: iconColor),
          const SizedBox(width: 10),
          Text(
            text,
            style: textStyle?.merge(TextStyle(color: textColor)) ??
                TextStyle(color: textColor),
          ),
          const Spacer(),
          if (showForwardIcon && onTap != null)
            InkWell(
              onTap: onTap!,
              child: Icon(
                Icons.arrow_forward_ios,
                color: forwardIconColor ?? Colors.black,
              ),
            ),
        ],
      ),
    );
  }
}

class DynamicTextWidget extends StatelessWidget {
  final String text;
  final FontWeight fontWeight;
  final Color color;
  final EdgeInsets padding;

  const DynamicTextWidget({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:charitoon/comic.dart';
import 'package:charitoon/genre.dart';
import 'package:charitoon/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Profile());
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChariToon',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: const Color(0xFFFBBF24),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4;

  final List<Widget> _pages = [
    const ComicHomePageContent(),
    const ComicPageContent(),
    const GenrePageContent(),
    const Center(child: Text('Histories')),
    const ProfilePageContent(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label, {Color? color}) {
    return BottomNavigationBarItem(
      icon: FaIcon(icon, size: 24, color: color),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              offset: const Offset(0, -1),
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color(0xFFFBBF24),
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          items: [
            _buildNavItem(FontAwesomeIcons.home, 'Home', color: _selectedIndex == 0 ? const Color(0xFFFBBF24) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.book, 'Comiclist', color: _selectedIndex == 1 ? const Color(0xFFFBBF24) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.boxArchive, 'GenreList', color: _selectedIndex == 2 ? const Color(0xFFFBBF24) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.bookBookmark, 'Histories', color: _selectedIndex == 3 ? const Color(0xFFFBBF24) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.solidUser, 'Profile', color: _selectedIndex == 4 ? const Color(0xFFFBBF24) : Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  static const yellow400 = Color(0xFFFBBF24);
  static const pink400 = Color(0xFFEC4899);
  static const pink100 = Color(0xFFFCE7F3);
  static const gray200 = Color(0xFFE5E7EB);
  static const gray400 = Color(0xFF9CA3AF);
  static const black = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        // Replace AppBar with custom Row as requested
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 20, color: Colors.black),
                  onPressed: () {},
                  splashRadius: 20,
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // to balance the back button width
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // Profile Header Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.network(
                      'https://storage.googleapis.com/a1aa/image/247864f4-592a-477e-6c55-e1a1efc88f74.jpg',
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                      semanticLabel: 'Profile image of a person wearing a dark jacket and hat, looking to the side',
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 56,
                        height: 56,
                        color: pink100,
                        child: const Icon(Icons.person, color: pink400),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Name and details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hello, Grace
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25,
                              color: black,
                            ),
                            children: [
                              TextSpan(
                                text: 'Hello',
                                style: TextStyle(color: yellow400),
                              ),
                              const TextSpan(text: ', Grace'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 2),
                        // Location and sign
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.locationDot,
                              size: 12,
                              color: pink400,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Girls',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: pink400,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              'Scorpio',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: black,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        // ID
                        Text(
                          'ID : 8993137465',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: yellow400,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Progress bar with "Edit Profile"
                        Stack(
                          children: [
                            Container(
                              height: 16,
                              decoration: BoxDecoration(
                                color: pink100,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            Container(
                              height: 16,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: yellow400,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                              child: Center(
                                child: Text(
                                  'Edit Profile',
                                  style: const TextStyle(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        // Level text
                        const Text(
                          'Lvl : 4 - Comic Explorer',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: black,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Right stats column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Chapters\n',
                              style: TextStyle(
                                fontSize: 7,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFFBBF24),
                                height: 1.2,
                              ),
                            ),
                            TextSpan(
                              text: 'Read',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFBBF24),
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: yellow400,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '20h 40m',
                        style: TextStyle(
                          fontSize: 7,
                          fontWeight: FontWeight.w400,
                          color: yellow400,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Divider and menu items
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: gray200, width: 1),
                    bottom: BorderSide(color: gray200, width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    _MenuItem(
                      title: 'SETTING',
                      trailing: const FaIcon(FontAwesomeIcons.chevronRight, size: 16, color: Color(0xFF9CA3AF)),
                      onTap: () {},
                    ),
                    _MenuItem(
                      titleWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'CONTACT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'SUPPORT',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                      trailingWidget: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'supportemail@domain.com',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            'Response Time : 09:00-18:00',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                          Text(
                            '(GMT+7), Monday to Friday',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                      paddingVertical: 16,
                    ),
                    _MenuItem(
                      title: 'VERSION',
                      trailing: const Text(
                        'v0.1.0-beta',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF9CA3AF),
                          height: 1.2,
                        ),
                      ),
                      onTap: () {},
                      titleStyle: const TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF9CA3AF),
                      ),
                      paddingVertical: 16,
                    ),
                    _MenuItem(
                      title: 'ABOUT US',
                      trailingWidget: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'ChariToon (By : RAM)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: black,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(width: 4),
                          FaIcon(FontAwesomeIcons.chevronRight, size: 16, color: Color(0xFF9CA3AF)),
                        ],
                      ),
                      onTap: () {},
                      paddingVertical: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Sign out button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: yellow400, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    foregroundColor: yellow400,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      height: 1.25,
                    ),
                  ),
                  child: const Text('Sign out'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final String? title;
  final Widget? titleWidget;
  final Widget? trailing;
  final Widget? trailingWidget;
  final VoidCallback? onTap;
  final TextStyle? titleStyle;
  final double paddingVertical;

  const _MenuItem({
    this.title,
    this.titleWidget,
    this.trailing,
    this.trailingWidget,
    this.onTap,
    this.titleStyle,
    this.paddingVertical = 12,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: 0),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            titleWidget ??
                Text(
                  title ?? '',
                  style: titleStyle ??
                      const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.2,
                      ),
                ),
            trailingWidget ?? trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
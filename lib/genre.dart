// ignore_for_file: deprecated_member_use

import 'package:charitoon/comic.dart';
import 'package:charitoon/home.dart';
import 'package:charitoon/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Genre());
}

class Genre extends StatelessWidget {
  const Genre({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChariToon',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFF9A825),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const GenrePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GenrePage extends StatefulWidget {
  const GenrePage({super.key});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  int _selectedIndex = 2;

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
          selectedItemColor: const Color(0xFFF9A825),
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          items: [
            _buildNavItem(FontAwesomeIcons.home, 'Home', color: _selectedIndex == 0 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.book, 'Comiclist', color: _selectedIndex == 1 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.boxArchive, 'GenreList', color: _selectedIndex == 2 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.bookBookmark, 'Histories', color: _selectedIndex == 3 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.solidUser, 'Profile', color: _selectedIndex == 4 ? const Color(0xFFF9A825) : Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}

class GenrePageContent extends StatelessWidget {
  const GenrePageContent({super.key});

  final List<Map<String, dynamic>> genres = const [
    {
      'color': Color(0xFFF59E0B),
      'icon': FontAwesomeIcons.fire,
      'label': 'Action',
      'iconDescription': 'Orange circle with a white target icon representing Action genre',
    },
    {
      'color': Color(0xFF8B00FF),
      'icon': FontAwesomeIcons.bullseye,
      'label': 'Mystery',
      'iconDescription': 'Purple circle with a white triangle icon representing Mystery genre',
    },
    {
      'color': Color(0xFFEF4444),
      'icon': FontAwesomeIcons.locationArrow,
      'label': 'Horror',
      'iconDescription': 'Red circle with a white arrow icon representing Horror genre',
    },
    {
      'color': Color(0xFFEC4899),
      'icon': FontAwesomeIcons.heart,
      'label': 'Romance',
      'iconDescription': 'Pink circle with a white heart icon representing Romance genre',
    },
    {
      'color': Color(0xFF2DD4BF),
      'icon': FontAwesomeIcons.basketballBall,
      'label': 'Sports',
      'iconDescription': 'Cyan circle with a white basketball icon representing Sports genre',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Top bar with back arrow and title "Genre"
            Row(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 20, color: Colors.black),
                  onPressed: () {},
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Genre',
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
            const SizedBox(height: 12),
            // Search and filter
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        FaIcon(FontAwesomeIcons.search, color: Color(0xFFBDBDBD), size: 16),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.filter, color: Color(0xFFBDBDBD), size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Genre icons grid (wrap with spacing)
            Wrap(
              spacing: 32,
              runSpacing: 24,
              children: genres.map((genre) {
                return SizedBox(
                  width: 64,
                  child: Column(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: genre['color'] as Color,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: FaIcon(
                            genre['icon'] as IconData,
                            color: Colors.white,
                            size: 20,
                            semanticLabel: genre['iconDescription'] as String,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        genre['label'] as String,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            // Pagination with only one page active and left/right arrows
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 16, color: Color(0xFF9E9E9E)),
                  onPressed: null,
                  disabledColor: const Color(0xFFCCCCCC),
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF59E0B),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronRight, size: 16, color: Color(0xFF9E9E9E)),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
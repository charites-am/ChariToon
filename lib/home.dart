
// ignore_for_file: deprecated_member_use

import 'package:charitoon/comic.dart';
import 'package:charitoon/genre.dart';
import 'package:charitoon/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChariToon',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFF9A825),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ComicHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ComicHomePage extends StatefulWidget {
  const ComicHomePage({super.key});

  @override
  State<ComicHomePage> createState() => _ComicHomePageState();
}

class _ComicHomePageState extends State<ComicHomePage> {
  int _selectedIndex = 0;

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
            _buildNavItem(FontAwesomeIcons.book, 'Comic List', color: _selectedIndex == 1 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.boxArchive, 'Categories', color: _selectedIndex == 2 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.bookBookmark, 'Histories', color: _selectedIndex == 3 ? const Color(0xFFF9A825) : Colors.grey[600]),
            _buildNavItem(FontAwesomeIcons.solidUser, 'Profile', color: _selectedIndex == 4 ? const Color(0xFFF9A825) : Colors.grey[600]),
          ],
        ),
      ),
    );
  }
}

class ComicHomePageContent extends StatefulWidget {
  const ComicHomePageContent({super.key});

  @override
  State<ComicHomePageContent> createState() => _ComicHomePageContentState();
}

class _ComicHomePageContentState extends State<ComicHomePageContent> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> banners = [
    {
      'image': 'https://placehold.co/100x140/png?text=Solo+Leveling',
      'alt': 'Cover Solo Leveling',
      'title': 'Solo Leveling',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Begin+After+The+End',
      'alt': 'Banner with characters fighting and text The Begin After The End',
      'title': 'The Begin\nAfter The\nEnd',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Genius+Who+Sees+The+End',
      'alt': 'Banner with man reading a book and text The Genius Who Sees The End',
      'title': 'The Genius\nWho Sees\nThe End',
    },
  ];

  final genreData = [
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
  ];

  final comics = [
    {
      'image': 'https://placehold.co/100x140/png?text=Solo+Leveling',
      'alt': 'Solo Leveling comic cover with dark characters',
      'chapter': 'S2 END',
      'title': 'Solo Leveling',
      'views': '233.2M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Begin+After+The+End',
      'alt': 'The Begin After The End comic cover with characters fighting',
      'chapter': 'Chapter 100',
      'title': 'The Begin After The End',
      'views': '200M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Genius+Who+Sees+The+End',
      'alt': 'The Genius Who Sees The End comic cover with man reading a book',
      'chapter': 'Chapter 28',
      'title': 'The Genius Who Sees Th...',
      'views': '139.2M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=My+Status+on+The+Super+God+System',
      'alt': 'My Status on The Super God System comic cover with characters',
      'chapter': 'Chapter 12',
      'title': 'My Status on the Super God System',
      'views': '16.7M',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Optional: Auto slide every 4 seconds
    // Uncomment below to enable auto sliding
    // Timer.periodic(const Duration(seconds: 4), (timer) {
    //   if (_pageController.hasClients) {
    //     int nextPage = (_currentPage + 1) % banners.length;
    //     _pageController.animateToPage(
    //       nextPage,
    //       duration: const Duration(milliseconds: 400),
    //       curve: Curves.easeInOut,
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildBanner() {
    return SizedBox(
      height: 112,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: banners.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final banner = banners[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  banner['image']!,
                  width: double.infinity,
                  height: 112,
                  fit: BoxFit.cover,
                  semanticLabel: banner['alt']!,
                ),
              );
            },
          ),
          Positioned(
            bottom: 12,
            left: 16,
            child: Text(
              banners[_currentPage]['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                height: 1.1,
                shadows: [
                  Shadow(
                    color: Colors.black54,
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 16,
            child: Row(
              children: List.generate(banners.length, (index) {
                return Container(
                  margin: const EdgeInsets.only(left: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == _currentPage
                        ? Colors.white.withOpacity(0.8)
                        : Colors.white.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar and filter
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.filter, color: Colors.grey),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Banner slideshow
            _buildBanner(),
            const SizedBox(height: 20),
            // Genre header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Genre',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        '›',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: genreData.length,
                separatorBuilder: (_, __) => const SizedBox(width: 20),
                itemBuilder: (context, index) {
                  final genre = genreData[index];
                  IconData iconData = genre['icon'] as IconData;
                  Color bgColor = genre['color'] as Color;
                  Widget iconWidget;

                  // Custom rotations for icons to match the screenshot
                  switch (genre['label']) {
                    case 'Mystery':
                      iconWidget = Transform.rotate(
                        angle: 3.14159, // 180 degrees
                        child: FaIcon(iconData, color: Colors.white, size: 28),
                      );
                      break;
                    case 'Horror':
                      iconWidget = Transform.rotate(
                        angle: 0.785398, // 45 degrees
                        child: FaIcon(iconData, color: Colors.white, size: 28),
                      );
                      break;
                    default:
                      iconWidget = FaIcon(iconData, color: Colors.white, size: 28);
                  }

                  return Column(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: bgColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(child: iconWidget),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: 60,
                        child: Text(
                          genre['label'] as String,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Comic List header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                    text: 'Comic ',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    children: [
                      TextSpan(
                        text: 'List',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: const [
                      Text(
                        '›',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: comics.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final comic = comics[index];
                  return SizedBox(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            comic['image']!,
                            height: 120,
                            width: 80,
                            fit: BoxFit.cover,
                            semanticLabel: comic['alt']!,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          comic['chapter']!,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          comic['title']!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.eye,
                              size: 12,
                              color: Color(0xFFF9A825),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              comic['views']!,
                              style: const TextStyle(
                                fontSize: 10,
                                color: Color(0xFFF9A825),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

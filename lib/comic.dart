// ignore_for_file: deprecated_member_use

import 'package:charitoon/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const Comic());
}

class Comic extends StatelessWidget {
  const Comic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChariToon',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: const Color(0xFFF9A825),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const ComicPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ComicPage extends StatefulWidget {
  const ComicPage({super.key});

  @override
  State<ComicPage> createState() => _ComicPageState();
}

class _ComicPageState extends State<ComicPage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const ComicHomePageContent(),
    const ComicPageContent(),
    const Center(child: Text('Genrelist')),
    const Center(child: Text('Histories')),
    const Center(child: Text('Profile')),
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

class ComicPageContent extends StatelessWidget {
  const ComicPageContent({super.key});

  final List<Map<String, dynamic>> comics = const [
    {
      'image': 'https://placehold.co/100x140/png?text=Solo+Leveling',
      'alt': 'Cover image of Solo Leveling comic showing a dark armored character with glowing eyes',
      'chapter': 'S2 END',
      'title': 'Solo Leveling',
      'views': '233.2M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Begin+After+The+End',
      'alt': 'Cover image of The Begin After The End comic showing a character with orange hair and magic effects',
      'chapter': 'Chapter 100',
      'title': 'The Begin After The End',
      'views': '200M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=The+Genius+Who+Sees+The+End',
      'alt': 'Cover image of The Genius Who Sees The End comic showing a character with long black hair reading a book',
      'chapter': 'Chapter 28',
      'title': 'The Genius Who Sees Th...',
      'views': '139.2M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=My+Bias+Gets+on+the+Last+T',
      'alt': 'Cover image of My Bias Gets on the Last Train comic showing two characters lying down with colorful background',
      'chapter': 'Chapter 26',
      'title': 'My Bias Gets on the Last T...',
      'views': '100M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=I%27m+Not+Really+Demon+God',
      'alt': 'Cover image of I\'m Not Really Demon God comic showing a dark figure with glowing red eyes and text',
      'chapter': 'Chapter 194',
      'title': 'i\'m Not Really Demon God\'...',
      'views': '106.7M',
    },
    {
      'image': 'https://placehold.co/100x140/png?text=Murim+Login',
      'alt': 'Cover image of Murim Login comic showing characters with fire and glowing eyes',
      'chapter': 'Chapter 127',
      'title': 'Murim Login',
      'views': '95M',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: ListView(
          children: [
            // Top bar with back arrow and title
            Row(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 20),
                  onPressed: () {},
                ),
                Expanded(
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Comic ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'List',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF9A825),
                            ),
                          ),
                        ],
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
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: FaIcon(FontAwesomeIcons.filter, color: Color(0xFFBDBDBD), size: 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Comics grid
           GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: comics.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    mainAxisSpacing: 16,
    crossAxisSpacing: 12,
    childAspectRatio: 0.6, // naikkan dari 0.55 ke 0.6
  ),
  itemBuilder: (context, index) {
    final comic = comics[index];
    return SizedBox(
  width: 90,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min, // pastikan Column tidak mengambil ruang vertikal tak terbatas
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          comic['image']!,
          height: 120,
          width: 90,
          fit: BoxFit.cover,
          semanticLabel: comic['alt']!,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 90,
              height: 120,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  comic['title']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ),
            );
          },
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
      Flexible(
        child: Text(
          comic['title']!,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
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
          Expanded(
            child: Text(
              comic['views']!,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFFF9A825),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ],
  ),
);
  },
),
            const SizedBox(height: 12),
            // Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.chevronLeft, size: 16, color: Color(0xFF9E9E9E)),
                  onPressed: null,
                  disabledColor: const Color(0xFFCCCCCC),
                ),
                const SizedBox(width: 8),
                _PageNumberButton(number: '1', isActive: true, onTap: () {}),
                const SizedBox(width: 8),
                _PageNumberButton(number: '2', isActive: false, onTap: () {}),
                const SizedBox(width: 8),
                _PageNumberButton(number: '3', isActive: false, onTap: () {}),
                const SizedBox(width: 8),
                const Text('...', style: TextStyle(fontSize: 14, color: Colors.black87)),
                const SizedBox(width: 8),
                _PageNumberButton(number: '67', isActive: false, onTap: () {}),
                const SizedBox(width: 8),
                _PageNumberButton(number: '68', isActive: false, onTap: () {}),
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

class _PageNumberButton extends StatelessWidget {
  final String number;
  final bool isActive;
  final VoidCallback onTap;

  const _PageNumberButton({
    required this.number,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFFF9A825) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const LaqtaApp());
}

class LaqtaApp extends StatelessWidget {
  const LaqtaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'لقطة',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0714),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8E44FF),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'لقطة 🎬',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF160B22),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'أهلاً بك في لقطة',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'أفلام ومسلسلات وأنمي وكارتون',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),

            // البحث
            TextField(
              decoration: InputDecoration(
                hintText: 'ابحث عن فيلم أو مسلسل...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFF21132F),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'التصنيفات',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(title: 'الكل'),
                  CategoryChip(title: 'أفلام'),
                  CategoryChip(title: 'مسلسلات'),
                  CategoryChip(title: 'أنمي'),
                  CategoryChip(title: 'كارتون'),
                  CategoryChip(title: 'تركي'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'الأكثر مشاهدة 🔥',
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MovieCard(title: 'فيلم جديد'),
                  MovieCard(title: 'مسلسل جديد'),
                  MovieCard(title: 'أنمي'),
                  MovieCard(title: 'كارتون'),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF160B22),
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            label: 'الأفلام',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv_outlined),
            label: 'المسلسلات',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String title;

  const CategoryChip({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(title),
        backgroundColor: const Color(0xFF21132F),
        side: BorderSide.none,
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;

  const MovieCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF21132F),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF7B2FFF),
                    Color(0xFF2A123F),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.movie,
                  size: 55,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

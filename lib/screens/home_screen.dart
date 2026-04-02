import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';
import '../widgets/destination_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.user, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 32),
            _buildDestinationsSection(),
            const SizedBox(height: 32),
            _buildEventsSection(),
            const SizedBox(height: 60),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.background,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(LucideIcons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.map), label: "Destinations"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.calendar), label: "Events"),
          BottomNavigationBarItem(icon: Icon(LucideIcons.compass), label: "Tours"),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image mock
          Container(
            color: Colors.black,
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                'https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=1000&auto=format&fit=crop',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: const Column(
                      children: [
                        Text(
                          "णमो अरिहंताणं णमो सिद्धाणं",
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("॥ जय जिनेन्द्र ॥", style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 24),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 48, height: 1.1),
                      children: const [
                        TextSpan(text: "Welcome to\n"),
                        TextSpan(text: "Jain Digital "),
                        TextSpan(text: "Booking", style: TextStyle(color: AppTheme.primary)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Discover historic Jain tirths, join live pravachans, and connect with a global sangha of shravaks in spiritual purity.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "Explore Tirths",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDestinationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SACRED JOURNEYS", style: TextStyle(color: AppTheme.primary, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Spiritual Destinations", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("See All", style: TextStyle(color: AppTheme.primary)),
                    SizedBox(width: 4),
                    Icon(LucideIcons.arrowRight, size: 16, color: AppTheme.primary),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 330,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: const [
              DestinationCard(
                title: "Shree Sammed Shikharji",
                imagePath: "https://images.unsplash.com/photo-1514222325255-b44c4fa51fd2?q=80&w=800",
                location: "Parasnath Hill, Jharkhand",
                tag: "STAY",
              ),
              DestinationCard(
                title: "Palitana Tirth",
                imagePath: "https://images.unsplash.com/photo-1560179406-1c6c60e0dc26?q=80&w=800",
                location: "Bhavnagar, Gujarat",
                tag: "DHARAMSHALA",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildEventsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Upcoming Events", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("Don't miss the latest gatherings.", style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Row(
                  children: [
                    Text("View All", style: TextStyle(color: AppTheme.primary)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          _buildEventItem(
            "Mahavir Janma Kalyanak Celebration",
            "Apr 14, 2026 • 6:00 PM",
            "https://images.unsplash.com/photo-1519681393784-d120267933ba?q=80&w=400",
          ),
          const SizedBox(height: 16),
          _buildEventItem(
            "Paryushan Parv Aradhana",
            "Sep 02, 2026 • 5:30 AM",
            "https://images.unsplash.com/photo-1507692049790-de58290a4334?q=80&w=400",
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String date, String img) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: img,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(date, style: const TextStyle(color: AppTheme.primary, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("View Event", style: TextStyle(color: AppTheme.primary, fontSize: 12, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

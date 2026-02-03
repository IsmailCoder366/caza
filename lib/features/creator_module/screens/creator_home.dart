import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/caza_button.dart';

class CreatorHome extends StatelessWidget {


  const CreatorHome({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // We use the initialTabIndex passed from the Layout
      initialIndex: 0,
      length: 2,
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            const SizedBox(height: 10),

            // 1. Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            // 2. The Tab Bar
            const TabBar(
              tabs: [
                Tab(text: "Personal"),
                Tab(text: "Group"),
              ],
              labelColor: AppColors.primaryBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.primaryBlue,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              indicatorWeight: 3,
            ),

            const Divider(height: 1, thickness: 1, color: Colors.black12),

            // 3. The Tab Views
            Expanded(
              child: TabBarView(
                children: [
                  // Personal Tab Content (Matches "Not Have Message.png")
                  _buildPersonalEmptyState(context),

                  // Group Tab Content (Matches "Not Have Group.png")
                  _buildGroupEmptyState(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalEmptyState(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Image.asset(
            'assets/logos/logo.png',
            height: 220,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            "Start your message",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            "Start conversation with other employee in your organization.",
            style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          CazaButton(
            text: "Add New Message",
            onPressed: () {
              print("Opening Contact List...");
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildGroupEmptyState(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Image.asset(
            'assets/logos/logo.png',
            height: 220,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          const Text(
            "Ready for a next level chat?",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: -0.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Text(
            "Make your conversations with divisions or friends more structured and organized",
            style: TextStyle(color: Colors.grey, fontSize: 15, height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          CazaButton(
            text: "Create Group Chat",
            onPressed: () {
              print("Initiating Group Creation Flow...");
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
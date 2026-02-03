import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/auth/auth_state.dart';
import 'creator_home.dart';

class CreatorMainLayout extends StatefulWidget {
  // This value comes from AuthWrapper to decide: Personal (0) or Group (1)

  const CreatorMainLayout({super.key});

  @override
  State<CreatorMainLayout> createState() => _CreatorMainLayoutState();
}

class _CreatorMainLayoutState extends State<CreatorMainLayout> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    // Start on the 'Messages' icon (Index 1 of BottomNavigationBar)
    _selectedIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthBloc>().state;
    String displayName = "Creator";

    if (state is Authenticated) {
      displayName = state.user.displayName;
    }

    return Scaffold(
      appBar: AppBar(
        // Titles based on selected bottom nav item
        title: Text(_getAppBarTitle(_selectedIndex)),
        centerTitle: false,
        actions: [
          // Profile pic as seen in your screenshot's "You" section
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
              child: Text(displayName[0], style: const TextStyle(color: AppColors.primaryBlue)),
            ),
          ),
        ],
      ),

      body: _buildSelectedPage(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryBlue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder_rounded), label: 'File'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_rounded), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_rounded), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'You'),
        ],
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0: return "My Files";
      case 1: return "Messages";
      case 2: return "Notifications";
      case 3: return "Profile";
      default: return "Caza";
    }
  }

  Widget _buildSelectedPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Files Module"));
      case 1:
      // IMPORTANT: Passing the initialTab down to CreatorHome
        return CreatorHome();
      case 2:
        return const Center(child: Text("Notifications Center"));
      case 3:
        return const Center(child: Text("Account Settings"));
      default:
        return CreatorHome();
    }
  }
}
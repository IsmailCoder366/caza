import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/auth/auth_event.dart';
import '../../creator_module/screens/creator_home.dart';

class UserDashboard extends StatefulWidget {
  final int initialTab;
  const UserDashboard({super.key, required this.initialTab});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 1; // Default to 'Messages' bottom icon
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getAppBarTitle(_selectedIndex)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),

      // We reuse the CreatorHome UI but pass widget.initialTab (which is 0 for User)
      body: _buildSelectedPage(_selectedIndex),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // User module color
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.folder_open), label: 'File'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'You'),
        ],
      ),
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0: return "Shared Files";
      case 1: return "My Chats";
      case 2: return "Alerts";
      case 3: return "My Account";
      default: return "Caza User";
    }
  }

  Widget _buildSelectedPage(int index) {
    switch (index) {
      case 1:
      // By passing widget.initialTab (0), the User will land on 'Personal' tab
        return CreatorHome();
      default:
        return const Center(
          child: Text("Available in Phase 2"),
        );
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/auth/auth_bloc.dart';
import '../../../logic/auth/auth_event.dart';

class CreatorDashboard extends StatelessWidget {
  const CreatorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Studio"),
        backgroundColor: Colors.indigo, // Visual distinction
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => context.read<AuthBloc>().add(LogoutRequested()),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.edit_note, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text("Welcome, Creator!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text("You have management and editing tools."),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Create New Content"),
            )
          ],
        ),
      ),
    );
  }
}
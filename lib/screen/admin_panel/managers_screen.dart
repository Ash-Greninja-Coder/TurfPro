import 'package:flutter/material.dart';
import '../../../models/manager_model.dart';

class ManagersScreen extends StatelessWidget {
  final List<ManagerModel> managers = [
    ManagerModel(name: 'Alice Walker', email: 'alice@example.com', phone: '123-456-7890'),
    ManagerModel(name: 'Bob Brown', email: 'bob@example.com', phone: '987-654-3210'),
    ManagerModel(name: 'Charlie Green', email: 'charlie@example.com', phone: '555-555-5555'),
  ];

  ManagersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: managers.length,
      itemBuilder: (context, index) {
        var manager = managers[index];
        return ListTile(
          title: Text(manager.name),
          subtitle: Text(manager.email),
          trailing: Text(manager.phone),
        );
      },
    );
  }
}
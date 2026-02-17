import 'package:flutter/material.dart';

import '../models/module.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({super.key, required this.module});

  final RoleModule module;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Text(
          module.icon,
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(module.title),
        subtitle: Text(module.description),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

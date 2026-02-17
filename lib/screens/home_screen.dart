import 'package:flutter/material.dart';

import '../models/module.dart';
import '../models/user_role.dart';
import '../widgets/module_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserRole _selectedRole = UserRole.admin;

  static const Map<UserRole, List<RoleModule>> _modulesByRole = {
    UserRole.admin: [
      RoleModule(
        title: 'Gestion des inscriptions',
        description:
            'Créer, valider et suivre les dossiers des élèves et des classes.',
        icon: '🗂️',
      ),
      RoleModule(
        title: 'Pilotage académique',
        description: 'Visualiser les indicateurs globaux de présence et résultats.',
        icon: '📊',
      ),
      RoleModule(
        title: 'Communication globale',
        description: 'Publier des annonces importantes pour toute la communauté.',
        icon: '📢',
      ),
    ],
    UserRole.enseignant: [
      RoleModule(
        title: 'Cahier de notes',
        description: 'Saisir les notes, appréciations et compétences par matière.',
        icon: '📝',
      ),
      RoleModule(
        title: 'Gestion des absences',
        description: 'Enregistrer les présences et signaler les absences.',
        icon: '✅',
      ),
      RoleModule(
        title: 'Messagerie parents',
        description: 'Dialoguer directement avec les parents de la classe.',
        icon: '💬',
      ),
    ],
    UserRole.parent: [
      RoleModule(
        title: 'Suivi de scolarité',
        description: 'Consulter les notes, bulletins et progression de votre enfant.',
        icon: '🎓',
      ),
      RoleModule(
        title: 'Absences & retards',
        description: 'Recevoir des alertes en temps réel et justifier les absences.',
        icon: '⏰',
      ),
      RoleModule(
        title: 'Relation avec l’école',
        description: 'Prendre rendez-vous et échanger avec l’équipe pédagogique.',
        icon: '🏫',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    final modules = _modulesByRole[_selectedRole] ?? const [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de Scolarité'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Plateforme école ↔ parents',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Choisissez un rôle pour afficher les fonctionnalités adaptées.',
            ),
            const SizedBox(height: 16),
            SegmentedButton<UserRole>(
              segments: UserRole.values
                  .map(
                    (role) => ButtonSegment<UserRole>(
                      value: role,
                      label: Text(role.label),
                    ),
                  )
                  .toList(),
              selected: {_selectedRole},
              onSelectionChanged: (selection) {
                setState(() {
                  _selectedRole = selection.first;
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: modules.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return ModuleCard(module: modules[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

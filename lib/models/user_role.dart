enum UserRole {
  admin,
  enseignant,
  parent,
}

extension UserRoleLabel on UserRole {
  String get label {
    switch (this) {
      case UserRole.admin:
        return 'Administrateur';
      case UserRole.enseignant:
        return 'Enseignant';
      case UserRole.parent:
        return 'Parent';
    }
  }
}

class User {
  final String id;
  final String email;
  final String password;

  User(this.id, this.email, this.password);

  Map<String, dynamic> toJson() => {'id': id, 'email': email};
}

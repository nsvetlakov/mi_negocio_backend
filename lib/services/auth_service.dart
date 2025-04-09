import 'package:uuid/uuid.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import '../models/user.dart';

class AuthService {
  static final _users = <String, User>{};
  static const _secret = 'super-secret';
  static final _uuid = Uuid();

  static User register(String email, String password) {
    final id = _uuid.v4();
    final user = User(id, email, password);
    _users[id] = user;
    return user;
  }

  static String? login(String email, String password) {
    final user = _users.values.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => User('', '', ''),
    );
    if (user.id.isEmpty) return null;
    final jwt = JWT({'id': user.id});
    return jwt.sign(SecretKey(_secret));
  }
}

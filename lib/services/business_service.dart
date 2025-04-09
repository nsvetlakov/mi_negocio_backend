import 'package:uuid/uuid.dart';
import '../models/business.dart';

class BusinessService {
  static final _businesses = <String, Business>{};
  static final _uuid = Uuid();

  static List<Business> getAll() => _businesses.values.toList();

  static Business? getById(String id) => _businesses[id];

  static Business create(Map<String, dynamic> data) {
    final id = _uuid.v4();
    final business = Business(id, data['name'], data['description']);
    _businesses[id] = business;
    return business;
  }
}

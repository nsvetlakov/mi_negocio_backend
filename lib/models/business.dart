class Business {
  final String id;
  final String name;
  final String description;

  Business(this.id, this.name, this.description);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
  };
}

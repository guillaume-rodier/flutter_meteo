class City {
  final String id;
  final String name;

  City({required this.id, required this.name});

  // Method to convert to Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Method to recreate an object from a Map
  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
    );
  }
}

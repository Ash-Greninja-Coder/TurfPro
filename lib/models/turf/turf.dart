class Turf {
  final String id; // Unique identifier for the turf
  final String name;
  final String imageUrl;
  final String games;
  final String location;
  final String openHours;
  final String discount;
  final double rating;

  Turf({
    required this.id, // Update constructor to include ID
    required this.name,
    required this.imageUrl,
    required this.games,
    required this.location,
    required this.openHours,
    required this.discount,
    required this.rating,
  });

  // Factory constructor to create Turf object from JSON
  factory Turf.fromJson(Map<String, dynamic> json) {
    return Turf(
      id: json['_id'], // Assuming the ID field from the backend is _id
      name: json['name'],
      imageUrl: json['imageUrl'],
      games: json['games'],
      location: json['location'],
      openHours: json['openHours'],
      discount: json['discount'],
      rating: json['rating'].toDouble(),
    );
  }
}

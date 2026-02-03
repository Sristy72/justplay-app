class FetchPitchResponseModel {
  final List<Pitch> pitches;

  FetchPitchResponseModel({required this.pitches});

  /// Because API returns a LIST directly
  factory FetchPitchResponseModel.fromJson(List<dynamic> json) {
    return FetchPitchResponseModel(
      pitches: json.map((e) => Pitch.fromJson(e)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return pitches.map((pitch) => pitch.toJson()).toList();
  }
}


class Pitch {
  final String id;
  final String name;
  final PitchImage image;
  final String city;   // extracted from city.name
  final String sport;  // extracted from sport.name
  final String location;
  final int price;
  final String currency;
  final String createdAt;
  final String updatedAt;

  Pitch({
    required this.id,
    required this.name,
    required this.image,
    required this.city,
    required this.sport,
    required this.location,
    required this.price,
    required this.currency,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pitch.fromJson(Map<String, dynamic> json) {
    return Pitch(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      image: PitchImage.fromJson(json['image'] ?? {}),
      city: json['city']?['name'] ?? '',
      sport: json['sport']?['name'] ?? '',
      location: json['location'] ?? '',
      price: json['price'] ?? 0,
      currency: json['currency'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'image': image.toJson(),
      'city': city,
      'sport': sport,
      'location': location,
      'price': price,
      'currency': currency,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}


class PitchImage {
  final String url;
  final String publicId;

  PitchImage({
    required this.url,
    required this.publicId,
  });

  factory PitchImage.fromJson(Map<String, dynamic> json) {
    return PitchImage(
      url: json['url'] ?? '',
      publicId: json['public_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'public_id': publicId,
    };
  }
}



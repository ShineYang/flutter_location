/// A data class that represents a location model.
class Location {
  /// The latitude of the location.
  final double latitude;

  /// The longitude of the location.
  final double longitude;

  /// The accuracy of the location.
  final double horizontalAccuracy;
  final double verticalAccuracy;

  /// The altitude of the location.
  final double altitude;

  /// The angle in the direction the device is moving.
  final double course;

  /// The movement speed of the device.
  final double speed;

  /// The accuracy of [speed].
  final double speedAccuracy;

  /// The millisecondsSinceEpoch at which the location update occurred.
  final double millisecondsSinceEpoch;

  /// The device time at which the location update occurred.
  final DateTime timestamp;

  /// Whether the mock location.
  final bool isMock;

  /// Constructs an instance of [Location].
  const Location({
    required this.latitude,
    required this.longitude,
    required this.horizontalAccuracy,
    required this.verticalAccuracy,
    required this.altitude,
    required this.course,
    required this.speed,
    required this.speedAccuracy,
    required this.millisecondsSinceEpoch,
    required this.timestamp,
    required this.isMock,
  });

  /// Constructs an instance of [Location] from [json].
  factory Location.fromJson(Map<String, dynamic> json) {
    final double? lat = double.tryParse(json['latitude'].toString());
    final double? lon = double.tryParse(json['longitude'].toString());
    if (lat == null) throw ArgumentError.notNull('latitude');
    if (lon == null) throw ArgumentError.notNull('longitude');

    final double? millisecondsSinceEpoch =
    double.tryParse(json['millisecondsSinceEpoch'].toString());
    final DateTime timestamp = millisecondsSinceEpoch == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch.toInt());

    return Location(
      latitude: lat,
      longitude: lon,
      horizontalAccuracy: double.tryParse(json['horizontalAccuracy'].toString()) ?? 0.0,
      verticalAccuracy: double.tryParse(json['verticalAccuracy'].toString()) ?? 0.0,
      altitude: double.tryParse(json['altitude'].toString()) ?? 0.0,
      course: double.tryParse(json['course'].toString()) ?? 0.0,
      speed: double.tryParse(json['speed'].toString()) ?? 0.0,
      speedAccuracy: double.tryParse(json['speedAccuracy'].toString()) ?? 0.0,
      millisecondsSinceEpoch:
      millisecondsSinceEpoch ?? timestamp.millisecondsSinceEpoch.toDouble(),
      timestamp: timestamp,
      isMock: json['isMock'] ?? false,
    );
  }

  /// Returns the data fields of [Location] in JSON format.
  Map<String, dynamic> toJson() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'horizontalAccuracy': horizontalAccuracy,
      'verticalAccuracy': verticalAccuracy,
      'course': course,
      'speed': speed,
      'speedAccuracy': speedAccuracy,
      'millisecondsSinceEpoch': millisecondsSinceEpoch,
      'timestamp': timestamp,
      'isMock': isMock,
    };
  }

  @override
  String toString() => 'Location($latitude, $longitude)';

  @override
  bool operator ==(Object other) =>
      other is Location &&
          latitude == other.latitude &&
          longitude == other.longitude &&
          horizontalAccuracy == other.horizontalAccuracy &&
          verticalAccuracy == other.verticalAccuracy &&
          altitude == other.altitude &&
          course == other.course &&
          speed == other.speed &&
          speedAccuracy == other.speedAccuracy &&
          millisecondsSinceEpoch == other.millisecondsSinceEpoch &&
          timestamp == other.timestamp &&
          isMock == other.isMock;

  @override
  int get hashCode =>
      latitude.hashCode ^
      longitude.hashCode ^
      horizontalAccuracy.hashCode ^
      verticalAccuracy.hashCode ^
      altitude.hashCode ^
      course.hashCode ^
      speed.hashCode ^
      speedAccuracy.hashCode ^
      millisecondsSinceEpoch.hashCode ^
      timestamp.hashCode ^
      isMock.hashCode;
}
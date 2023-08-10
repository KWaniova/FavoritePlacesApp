import 'dart:io';

import 'package:favorite_places_app/models/place_location.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Place {
  final String id;
  final String title;
  final File? image;
  final PlaceLocation? location;

  Place({
    required this.title,
    this.image,
    required this.location,
  }) : id = uuid.v4();
}
